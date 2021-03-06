#!/bin/bash

#Download PHPDocumentor
if [ ! -d phpDocumentor ]
then
	wget https://github.com/phpDocumentor/phpDocumentor2/releases/download/v2.9.0/phpDocumentor.phar
	phar.phar extract -f phpDocumentor.phar phpDocumentor
	rm -rf phpDocumentor.phar
fi

#WordPress
if [ -d working/wordpress ]
then
	svn up working/wordpress
else
	svn co https://core.svn.wordpress.org/trunk/ working/wordpress
fi
[ ! -d html/wordpress  ] && mkdir html/wordpress
php phpDocumentor/bin/phpdoc -d working/wordpress -t html/wordpress --defaultpackagename WordPress --cache-folder cache/wordpress --template templates/responsive

#bbPress
if [ -d working/bbpress ]
then
	svn up working/bbpress
else
	svn co https://bbpress.svn.wordpress.org/trunk/ working/bbpress
fi
[ ! -d html/bbpress  ] && mkdir html/bbpress
php phpDocumentor/bin/phpdoc -d working/bbpress -t html/bbpress --defaultpackagename bbPress --cache-folder cache/bbpress --template templates/responsive

#BackPress
if [ -d working/backpress ]
then
	svn up working/backpress
else
	svn co https://svn.automattic.com/backpress/trunk/ working/backpress
fi
[ ! -d html/backpress  ] && mkdir html/backpress
php phpDocumentor/bin/phpdoc -d working/backpress -t html/backpress --defaultpackagename BackPress --cache-folder cache/backpress --template templates/responsive

#BuddyPress
if [ -d working/buddypress ]
then
	svn up working/buddypress
else
	svn co https://buddypress.svn.wordpress.org/trunk/ working/buddypress
fi
[ ! -d html/buddypress  ] && mkdir html/buddypress
php phpDocumentor/bin/phpdoc -d working/buddypress -t html/buddypress --defaultpackagename BuddyPress --cache-folder cache/buddypress --template templates/responsive

#GlotPress
if [ -d working/glotpress ]
then
	svn up working/glotpress
else
	svn co https://github.com/GlotPress/GlotPress-WP/trunk/ working/glotpress
fi
[ ! -d html/glotpress  ] && mkdir html/glotpress
php phpDocumentor/bin/phpdoc -d working/glotpress -t html/glotpress --defaultpackagename GlotPress --cache-folder cache/glotpress --template templates/responsive
