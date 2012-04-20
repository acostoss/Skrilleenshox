#!/usr/bin/env ruby

# Settings
#   Where to save the images to, locally
      tmpDir = ""
#   What FTP server to upload to
      ftpServ = ""
#   FTP user/pass credentials
      ftpUser = ""
      ftpPass = ""
#   What directory to upload to, "./" for 
#   the home directory.
      ftpDir = ""
#   Where to log all URLs
      logFile = ""


# Capture png image, name with timestamp. Timestamps are encoded in base32 for shorter filenames.
    time = Time.new
    year = time.strftime("%Y").to_i
    month = time.strftime("%m").to_i # This could probably be done so much cleaner, huh?
    day = time.strftime("%d").to_i
    hour = time.strftime("%H").to_i
    minute = time.strftime("%M").to_i
    second = time.strftime("%S").to_i
    tstamp = year.to_s(36) + month.to_s(36) + day.to_s(36) + hour.to_s(36) + minute.to_s(36) + second.to_s(36)
    tmpFile = tmpDir + tstamp + ".png"
    imageFile = ARGV[0]

# This snippet was based upon similar code in 
# tyru's "gyazo-linux" ruby script. All credit
# for this snippit goes to tyru.
#
# https://github.com/tyru/gyazo-linux
    if imageFile && File.exist?(imageFile) then
      system "convert '#{imageFile}' '#{tmpFile}'"
    else
      system "import '#{tmpFile}'"
    end
    
    if !File.exist?(tmpFile) then
      exit
    end
# END tyru's snippet

# upload to ftp server (sftp soon)
    require 'net/ftp'
    ftp = Net::FTP.new(ftpServ)
    ftp.passive = true
    ftp.login(ftpUser, ftpPass)
    ftp.chdir(ftpDir)
    ftp.putbinaryfile(tmpFile)
    ftp.close

    url = "http://" + ftpServ + "/" + tstamp + ".png"

# Comment out the following lines to disable them.

# copy url to clipboard
    system "echo '#{url}' | xclip -selection clipboard"

# copy url to logfile
    system "echo '#{url}' >> " + logFile

# delete image from tmpDir (comment out if you'd liek to keep a local copy)
    File.delete(tmpFile)
