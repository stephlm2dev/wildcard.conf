#!/usr/bin/env bash

# Hosted on gist.github.com
export WILDCARD_RELEASE=1.0.0
wget --no-check-certificate --content-disposition https://github.com/stephlm2dev/wildcard.conf/archive/$WILDCARD_RELEASE.zip --directory-prefix=$TMPDIR
unzip $TMPDIR/wildcard.conf-${WILDCARD_RELEASE}.zip -d $TMPDIR
