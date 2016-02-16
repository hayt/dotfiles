_islinux=false
[[ "$(uname -s)" =~ Linux|GNU|GNU/* ]] && _islinux=true

if $_islinux; then
	echo "-------------linux environment---------------"
	if [[ -f $HOME/.bashrc_linux ]]; then
		. $HOME/.bashrc_linux
	fi
	if [[ -f $HOME/dotfiles/bashrc ]]; then
		. $HOME/dotfiles/bashrc
	fi
else
	echo "-------------windows  environment------------"
	if [[ -f $HOME/.bashrc_windows ]]; then
		. $HOME/.bashrc_windows
	fi
fi
