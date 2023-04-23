#!/bin/sh


./scripts/ed-ipkg-make-index.sh ./edatec-ipk/package > ./edatec-ipk/Packages
gzip -9c ./edatec-ipk/Packages > ./edatec-ipk/Packages.gz
./staging_dir/host/bin/usign -S -m edatec-ipk/Packages -s sig.key -x edatec-ipk/Packages.sig
