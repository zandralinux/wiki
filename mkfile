webbase="/var/www/wiki"

all:QV:
	teal

install:QV:
	cp -rfv out/* $webbase

uninstall:QV:
	for f in pages/*; do
		rm -rfv $webbase/$(echo $f | awk -F '/' '{print $NF}' | sed 's/md$/html/')
	done
