#!/usr/bin/sh

cat notes.md.enc | openssl aes-256-cbc -d -a -iter 8 > notes.md
ln -sf $HOME/.dotfiles/notes/notes.md $HOME/.dotfiles/nvim/nvchad/plugins/buffer/notes.md
