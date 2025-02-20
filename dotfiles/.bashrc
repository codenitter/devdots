shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

HISTSIZE=100000
HISTFILESIZE=20000

__conda_setup="$('/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
		. "/opt/mambaforge/etc/profile.d/conda.sh"
	else
		export PATH="/opt/mambaforge/bin:$PATH"
	fi
fi
unset __conda_setup

if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
	. "/opt/mambaforge/etc/profile.d/mamba.sh"
fi

set -o vi

export EDITOR=nvim
export GIT_PAGER=delta
export XDG_CONFIG_HOME="$HOME/.config"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

source /opt/mambaforge/share/fzf/shell/completion.bash
source /opt/mambaforge/share/fzf/shell/key-bindings.bash

eval "$(starship init bash)"
eval "$(zoxide init bash)"

alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"
alias cd="z"
alias b="z .."
