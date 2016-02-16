if $_isxrunning; then
    get_prompt_symbol() {
      [[ $UID == 0 ]] && echo "#" || echo "\$"
    }

   export GIT_PS1_SHOWCOLORHINTS=true
   export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W\$(__git_ps1 \"$GY|$LB%s\")$GY]$W\$(get_prompt_symbol) "
fi
