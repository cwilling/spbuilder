SOURCES = \
	lxc-spbuilder-1402 \
	spbuilder \
	spbuilder-1402.conf \
	spbuilder.build \
	spbuilder.create.in \
	spbuilder.update.in \
	spbuilder.wrapper.in \
	spbuilder_repo.i686 \
	spbuilder_repo.x86_64 \
	spbuilderrc.default

DESTDIR =


build: $(SOURCES)


man:	spbuilder.rst
	install -d $(DESTDIR)/usr/man/man1
	rst2man.py spbuilder.rst |sed -e "s/Slackware ® Package/Slackware<AE> Package/" |gzip -9 >$(DESTDIR)/usr/man/man1/spbuilder.1.gz

install: build man
	install -d $(DESTDIR)/etc/spbuilder
	install -d $(DESTDIR)/usr/bin
	install -d $(DESTDIR)/usr/share/lxc/templates
	install -d $(DESTDIR)/usr/share/spbuilder
	install -d $(DESTDIR)/var/cache/spbuilder/{build,log,result,distfiles,slackbuilds}
	install -m 0755 lxc-spbuilder-1402 $(DESTDIR)/usr/share/lxc/templates
	install -m 0755 spbuilder $(DESTDIR)/usr/bin
	install -m 0755 spbuilder-1402.conf $(DESTDIR)/etc/spbuilder
	install -m 0755 -T spbuilderrc.default $(DESTDIR)/etc/spbuilder/spbuilderrc
	install -m 0755 spbuilder.build $(DESTDIR)/usr/share/spbuilder
	install -m 0755 spbuilder.create.in $(DESTDIR)/usr/share/spbuilder
	install -m 0755 spbuilder.update.in $(DESTDIR)/usr/share/spbuilder
	install -m 0755 spbuilder.wrapper.in $(DESTDIR)/usr/share/spbuilder
	install -m 0755 spbuilder_repo.{i686,x86_64} $(DESTDIR)/usr/share/spbuilder



clean:
	@-rm -f op

