#!/bin/bash

ln -sf ~/dotfiles/themes/solarized.theme.dark ~/.scheme/color.theme
echo "let scheme_bg=\"dark\"" > ~/.scheme/bg.vim
source ~/.scheme/color.theme
