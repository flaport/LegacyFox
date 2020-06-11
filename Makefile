.PHONY: all clean install uninstall

files := config.js
files += defaults/pref/config-prefs.js
files += legacy.manifest
files += legacy/BootstrapLoader.jsm
files += legacy/RDFDataSource.jsm
files += legacy/RDFManifestConverter.jsm
archive = legacyfox.tar.gz
FIREFOXDIR = /usr/lib/firefox/
WATERFOXDIR = /opt/waterfox-current/

all: $(archive)
$(archive): $(files)
	tar czf $@ -- $(files)

clean:
	rm -f $(archive)

install: $(archive)
	tar xzf $(archive) -C "$(FIREFOXDIR)"
	tar xzf $(archive) -C "$(WATERFOXDIR)"

uninstall:
	cd "$(FIREFOXDIR)" && rm -rf -- $(files)
	cd "$(WATERFOXDIR)" && rm -rf -- $(files)
