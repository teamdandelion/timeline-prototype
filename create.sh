#!/bin/sh

set -eu

DEMO_DIR=`pwd`
echo $DEMO_DIR
SOURCECRED_DIR="$sc/sourcecred"
SOURCECRED_CLI="$SOURCECRED_DIR/bin/sourcecred.js"
mkdir -p $DEMO_DIR/sourcecred_data/cache
#cp -r $SOURCECRED_DIRECTORY/cache $DEMO_DIR/sourcecred_data/cache
export SOURCECRED_DIRECTORY="$DEMO_DIR/sourcecred_data"
SITE_DIR="$DEMO_DIR/site"

#node "$SOURCECRED_CLI" load sourcecred/sourcecred
#node "$SOURCECRED_CLI" load sourcecred/research
#node "$SOURCECRED_CLI" load filecoin-project/specs
#node "$SOURCECRED_CLI" load gitcoinco/web


(cd "$SOURCECRED_DIR" && yarn build --output-path "$SITE_DIR")
mkdir -p "$SITE_DIR/api/v1"
cp -r "$SOURCECRED_DIRECTORY" "$SITE_DIR/api/v1/data"
rm -rf "$SITE_DIR/api/v1/data/cache"
