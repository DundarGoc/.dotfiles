######################################################
#
# Install all missing programs
#

# vim-plug
if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

######################################################
#
# General options
#

zstyle ':*:*:*' case-sensitive 'yes' # Case sensitive completion.
setopt auto_cd                       # Allow .. without getting "Permission denied".
setopt extendedglob                  # Add additional features for identifying files.

bindkey '^[[1;5C' forward-word  # [Ctrl-RightArrow] - move forward one word.
bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word.

# Automatically attach tmux session named ssh-tmux. If it doesn't exist then just create a new one.
if [[ -n $PS1 ]] && [[ -z $TMUX ]] && [[ -n $SSH_CONNECTION ]]; then
	export TERM=xterm-256color # Set the term variable if I'm using SSH so my terminal (kitty) doesn't break.
	tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi

# Force unique paths only
typeset -U path

######################################################
#
# History
#

setopt bang_hist              # Treat the '!' character specially during expansion.
setopt extended_history       # Write the history file in the ':start:elapsed;command' format.
setopt share_history          # Share history between all sessions.
setopt hist_expire_dups_first # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups       # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups   # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups      # Do not display a previously found event.
setopt hist_ignore_space      # Do not record an event starting with a space.
setopt hist_save_no_dups      # Do not write a duplicate event to the history file.
setopt hist_verify            # Do not execute immediately upon history expansion.

source ~/.zinit.zsh
source ~/.aliases.sh

# Automatically run ls after using cd.
function chpwd() {la}
