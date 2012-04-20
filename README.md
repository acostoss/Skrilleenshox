## Skrilleenshox

### Screenshot and FTP upload script

----

#### About

I grew tired of not having a decent puuush alternative in Linux, so I wrote my own in a language I have never even used.

Some code is lifted from [tyru's"gyazo-linux"](https://github.com/tyru/gyazo-linux) script.

Name was suggested to me by [@8C](http://www.twitter.com/8C) onTwitter, it seemed the funniest.

----

#### To Do

* SFTP support, possibly default unless switch (quite likely)
* Learn Ruby, it seems so simple (not very likely)
* Make cross-platform (extremely unlikely)

----

#### License
You are free to do whatever the hell you'd like to do with this code. If you do wish to attribute it to me, a link to http://acostoss.com will be more than enough.

To be honest, I dont see this ever happening. This thing is so simple.

----

#### Usage

###### To get the most out of Skrilleenshox, you'll need:

* Ruby (recent)
* IMagemagick (recent)
* Write access to a FTP server
* XClip (whichever)

###### To run:

* Change all settings to match your personal setup, and comment out features you'd like to disable (copying and logging).
* Set this script as executable with `chmod +x /path/to/script`
* Run the script and select a rectangle onscreen that you'd like captured to an image.
* The selected image will be saved to your tempDir and uploaded to your FTP server using the credentials you specified.
* If you haven't commented out anything, the url will be logged and copied to your clipboard.
