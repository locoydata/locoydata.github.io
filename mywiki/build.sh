#!/usr/bin/env bash
# build.sh

echo -e "\033[0;31;1m--build index.html\033[0m"
tiddlywiki --build index
mv index.html /sdcard/_tdwiki/mywiki/