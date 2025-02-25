#!/bin/bash

set -euo pipefail

install_dependencies() {
	sudo apt-get update && sudo apt-get install -y \
		build-essential \
		cmake \
		curl \
		gettext \
		git \
		ninja-build \
		wget
}

install_neovim() {
	local tmp_dir
	tmp_dir=$(mktemp -d)
	git clone --branch nightly --depth 1 https://github.com/neovim/neovim "$tmp_dir"
	cd "$tmp_dir"
	make CMAKE_BUILD_TYPE=ReleaseWithDebInfo
	sudo make install
	cd -
	rm -rf "$tmp_dir"
}

install_mamba() {
	local name
	name=Miniforge3-$(uname)-$(uname -m).sh
	wget "https://github.com/conda-forge/miniforge/releases/latest/download/$name"
	sudo bash $name -b -p /opt/mambaforge
	/opt/mambaforge/bin/mamba init bash
	rm $name
}

install_packages() {
	sudo /opt/mambaforge/bin/mamba install -y \
		bash-completion \
		bat \
		btop \
		eza \
		fd-find \
		fish \
		fzf \
		git-delta \
		lazygit \
		pre-commit \
		ripgrep \
		rm-improved \
		starship \
		tmux \
		zoxide \
		nodejs \
		yazi \
		xclip \
		jq
}

setup_dotfiles() {
	export XDG_CONFIG_HOME="$HOME"/.config
	mkdir -p "$XDG_CONFIG_HOME"
	ln -sf "$PWD/dotfiles/.bashrc" "$HOME/.bashrc"
	ln -sf "$PWD/dotfiles/starship.toml" "$XDG_CONFIG_HOME/starship.toml"
	git clone https://github.com/LazyVim/starter "$XDG_CONFIG_HOME/nvim"
	rm -rf "$XDG_CONFIG_HOME/nvim/.git"
}

main() {
	install_dependencies
	install_neovim
	install_mamba
	install_packages
	setup_dotfiles
}

main "$@"
