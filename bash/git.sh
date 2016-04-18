if $_islinux; then
	    get_prompt_symbol() {
	      [[ $UID == 0 ]] && echo "#" || echo "\$"
	    }

	   export GIT_PS1_SHOWCOLORHINTS=true
	   export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1) \$ '
fi
