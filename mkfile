webbase="/var/www/wiki"

all:QV:
	teal

clean:QV:
	rm -rfv out/

install:QV: all
	cp -rfv out/* $webbase

uninstall:QV:
	for f in pages/*; do
		rm -rfv $webbase/$(echo $f | awk -F '/' '{print $NF}' | sed 's/md$/html/')
	done
