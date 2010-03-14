ABOUT
=====

**web-obex** is a web-based UI of obexftp to download and play music from mobile phone.

Usage
=====

1. install needed packages

	sudo apt-get install obexftp bluez mplayer

2. start daemon and device (busybox httpd applet suggested) 

	sudo httpd -h $PWD &
	sudo hciconfig hci0 up 

4. open UI with browser (firefox for example)

	firefox http://localhost/index.html &

LICENSE
=======

Copyright (c) 2010, Ping-Hsun Chen.

Except the file that comes with its own license, the rest of web-obex is free.
You are free to distribute and/or modify this software under the terms of
the GNU General Public License.

On Debian systems, the complete text of the GNU General Public License can
be found in `/usr/share/common-licenses/GPL` file.

AUTHOR
======

Ping-Hsun Chen (penk) <penkia@gmail.com>

* <penkia@gmail.com>
* [@penk](http://twitter.com/penk) on Twitter

