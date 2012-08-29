#!/usr/bin/env ruby

# Settings for Skrilleenshox

###########
# General #
###########

# These settings are used across the entire script

# Where are we storing our local temp image?
##  Default             =   File.dirname(__FILE__) + "/img/"

    $tmpDir             =   File.dirname(__FILE__) + "/img/"
 
# Where should we upload the captured image? [imgur, ftp, sftp]
##  Default             =   "imgur"

    $destination        =   "imgur"
    
# Should we delete the local copy of the image? 
# Set as false to keep all screenshots you take in the $tmpDir
## True or False, no quotations

    $deleteLocalCopy    =   true
    
# Should we copy the URL to the clipboard?
## true or false, no quotations

    $copyToClipboard    =   true
    
# Should we copy the URL to the log file?
## true or false, no quotations

    $logURL             =   true
    
# Where should we log the URL?
## Default              =   "./log"
    
    $logFile            =   "./log"
    
# Should we open the URL of the uploaded screenshot in your browser?
##  Either true or false, no quotations

    $openInBrowser      =   true

# Executable for your web browser. 
##  Examples:   "google-chrome", "firefox"
    
    $browser            =  'google-chrome'
    
# Should we show a notification via libnotify?
## Either true or false, no quotations

    $showNotification   =   true
    
# What should the notification message be?
# See the lib notify man pages for configuration help
##  Default             =   "Upload complete!"

    $notificationMessage=   "Upload complete!"
    
# How long should the notification message stay up?
# Time in miliseconds
##  Default             =   750

    $notificationLength =  750 

    
#######
# FTP #
#######

# These settings only matter if you choose "ftp" as your destination.

# FTP user, password, and server; self-explanatory

    $ftpServ            =   ""
    $ftpUser            =   ""
    $ftpPass            =   ""

# If you wish to upload your files to the home directory on the remote server, leave this blank

    $ftpDir             =   ""

########
# SFTP #
########

# These settings only matter if you choose "sftp" as your destination.

# SFTP user, password, and server; self-explanatory

    $sftpServ           =   ""
    $sftpUser           =   ""
    $sftpPass           =   ""
    
# If you wish to upload your files to the home directory on the remote server, leave this blank
    $sftpDir            =   ""

#########
# imgur #
#########

# These settings only matter if you choose "imgur" as your destination
    $proxyAddress      =   nil
    $proxyPort         =   nil
    
# Your imgur anonymous imgur API key. Get one for free here: https://imgur.com/register/api_anon
    $imgurAPI           =   ''
    
