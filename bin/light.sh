#!/bin/bash

ln -sf ~/dotfiles/themes/solarized.theme.light ~/.scheme/color.theme
echo " let scheme_bg=\"light\"" > ~/.scheme/bg.vim
source ~/.scheme/color.theme
