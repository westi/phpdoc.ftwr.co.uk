#!/bin/bash

#Download PHPDocumentor
if [ ! -f phpDocumentor.phar ]
then
	wget http://phpdoc.org/phpDocumentor.phar
fi

#WordPress
if [ -d working/wordpress ]
then
	svn up working/wordpress
else
	svn co https://core.svn.wordpress.org/trunk/ working/wordpress
fi
[ ! -d html/wordpress  ] && mkdir html/wordpress
php5 phpDocumentor.phar -d working/wordpress -t html/wordpress --defaultpackagename WordPress --cache-folder cache/wordpress --template responsive

#bbPress
if [ -d working/bbpress ]
then
	svn up working/bbpress
else
	svn co https://bbpress.svn.wordpress.org/trunk/ working/bbpress
fi
[ ! -d html/bbpress  ] && mkdir html/bbpress
php5 phpDocumentor.phar -d working/bbpress -t html/bbpress --defaultpackagename bbPress --cache-folder cache/bbpress --template responsive

#BackPress
if [ -d working/backpress ]
then
	svn up working/backpress
else
	svn co https://svn.automattic.com/backpress/trunk/ working/backpress
fi
[ ! -d html/backpress  ] && mkdir html/backpress
php5 phpDocumentor.phar -d working/backpress -t html/backpress --defaultpackagename BackPress --cache-folder cache/backpress --template responsive

#BuddyPress
if [ -d working/buddypress ]
then
	svn up working/buddypress
else
	svn co https://buddypress.svn.wordpress.org/trunk/ working/buddypress
fi
[ ! -d html/buddypress  ] && mkdir html/buddypress
php5 phpDocumentor.phar -d working/buddypress -t html/buddypress --defaultpackagename BuddyPress --cache-folder cache/buddypress --template responsive

#GlotPress
if [ -d working/glotpress ]
then
	svn up working/glotpress
else
	svn co https://github.com/GlotPress/GlotPress-WP/trunk/ working/glotpress
fi
[ ! -d html/glotpress  ] && mkdir html/glotpress
php5 phpDocumentor.phar -d working/glotpress -t html/glotpress --defaultpackagename GlotPress --cache-folder cache/glotpress --template responsive
