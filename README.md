# Skrilleenshox

## Screenshot and upload script in Ruby

### About

I grew tired of not having a decent puuush alternative in Linux, so this came to be.

Some code is lifted from [tyru's"gyazo-linux"](https://github.com/tyru/gyazo-linux) script.

Name was suggested to me by [@8C](http://www.twitter.com/8C) onTwitter, it seemed the funniest.

### Features

* Upload to imgur
* Upload to a personal server (via ftp or sftp)
* Other optional things such as
    * Automatic copying of the URL to the clipboard
    * Notifications
    * Automatic opening in the browser of your choice
    * URL logging


### To Do

Nothing entirely pressing at the moment. Suggestions welcome to be sent to [acostoss@gmail.com.](mailto:acostoss@gmail.com)


### Usage

#### Prerequisites

At the very least, you will need:

* **Ruby**
    
    Tested with 1.8.7
    
    * Gems needed:
        * net-ftp
        * net-sftp

* **ImageMagick**
    
    Tested with 6.6

* Write access to a FTP server, SFTP server, or a [free imgur API key](https://imgur.com/register/api_anon)

For the optional, superfluous features, you will additionally need:

* **XClip**

    Tested with 0.12

* **libnotify**

    Tested with 0.5.0


##### Running

* Copy `conf.default.rb` to `conf.rb`
* Edit the contents of `conf.rb` to fit your needs
* Make the main script executable with `chmod +x /path/to/skrilleenshox.rb`
* Run from the terminal, or bind it to a key such as Print Screen.

### License
You are free to do whatever the hell you'd like to do with this code. Use it for something great or terrible, for profit or not, for ego or not. I don't really mind.

If you do wish to attribute it to me, a link to http://acostoss.com will be more than enough.

