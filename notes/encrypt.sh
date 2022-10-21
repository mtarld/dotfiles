#!/usr/bin/sh

cat notes.md | openssl aes-256-cbc -a -salt -iter 8 > notes.md.enc
