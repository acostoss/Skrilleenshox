#!/usr/bin/env ruby

# Load our settings
load File.dirname(__FILE__) + '/conf.rb'



# Capture png image, name with timestamp.
    time = Time.new
    year = time.strftime("%Y").to_i
    month = time.strftime("%m").to_i # This could probably be done so much cleaner, huh?
    day = time.strftime("%d").to_i
    hour = time.strftime("%H").to_i
    minute = time.strftime("%M").to_i
    second = time.strftime("%S").to_i
    tstamp = year.to_s(36) + month.to_s(36) + day.to_s(36) + hour.to_s(36) + minute.to_s(36) + second.to_s(36)
    tmpFile = $tmpDir + tstamp + ".png"
    imageFile = ARGV[0]

# If we already have an image file passed as an argument, then carry on. If not, capture one from the screen with ImageMagick
    if imageFile && File.exist?(imageFile) then
      system "convert '#{imageFile}' '#{tmpFile}'"
    else
      system "import '#{tmpFile}'"
    end
    
    if !File.exist?(tmpFile) then
      exit
    end    
    
    if $destination === "ftp" then
    
# Upload to ftp server
        require 'net/ftp'
        
        ftp = Net::FTP.new(ftpServ)
            ftp.passive = true
            ftp.login($ftpUser, $ftpPass)
            ftp.chdir($ftpDir)
            ftp.putbinaryfile(tmpFile)
        ftp.close
        
        url = "http://" + $ftpServ + "/" + tstamp + ".png"
        
    elsif $destination === "sftp" then
    
# Upload to sftp server
        require 'rubygems'
        require 'net/sftp'
        
        Net::SFTP.start($sftpServ, $sftpUser, :password => $sftpPass) do |sftp|
            sftp.upload!(tmpFile, $sftpDir + tstamp + ".png")   
        end
        
        url = "http://" + $sftpServ + "/" + tstamp + ".png"
        
    elsif $destination === "imgur" then
        
# Upload to imgur
        require 'net/http'
        require 'uri'
        require 'base64'
        require 'rexml/document'


        imagedata = Base64.encode64(File.read(tmpFile))

        Net::HTTP::Proxy($proxyAddress, $proxyPort).start("api.imgur.com",80) {|http|
	        res = Net::HTTP.post_form(URI.parse('http://api.imgur.com/2/upload'),
		        {'image' => imagedata, 'key' => $imgurAPI})
	        xml_data = res.body
	        doc = REXML::Document.new(xml_data)
	        doc.elements.each('upload/links/original') do |element|
		        url = element.text
	        end

        }
    else
        put "Cannot upload to the service you specified. Are you sure you didn't make a typo?"
    end


# Delete local copy
    if $deleteLocalCopy === true then
        File.delete(tmpFile)
    end

# Copy url to clipboard
    if $copyToClipboard === true then
        system "echo '#{url}' | xclip -selection clipboard"
    end
    
# Copy url to logfile
    if $logURL === true then
        system "echo '#{url}' >> " + $logFile
    end
    
# Open in browser
    if $openInBrowser === true then
	    system "#{$browser} #{url}"
	end
	
# Show notification via libnotify, see the man pages for configuration details
    if $showNotification === true then
        system "notify-send '#{$notificationMessage}' -t #{$notificationLength"
    end
