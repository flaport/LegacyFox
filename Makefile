.PHONY: all clean install uninstall

files := config.js
files += defaults/pref/config-prefs.js
files += legacy.manifest
files += legacy/BootstrapLoader.jsm
files += legacy/RDFDataSource.jsm
files += legacy/RDFManifestConverter.jsm
archive = legacyfox.tar.gz
firefoxdir = /usr/lib/firefox/

all: $(archive)
$(archive): $(files)
	tar czf $@ -- $(files)

clean:
	rm -f $(archive)

install: $(archive)
	tar xzf $(archive) -C "$(firefoxdir)"

uninstall:
	cd "$(firefoxdir)" && rm -rf -- $(files)
