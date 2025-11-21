# Setup fzf
# ---------
if [[ ! "$PATH" == */home/algorithmic/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/algorithmic/.fzf/bin"
fi

eval "$(fzf --bash)"
