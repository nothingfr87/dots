function fish_greeting
end

set fish_key_bindings fish_vi_key_bindings
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts no
set -g theme_color_scheme catppuccin-mocha

# Autoload TMUX
if status is-interactive
    and not set -q TMUX
    tmux attach-session -t default; or tmux new-session -s default
end

# PATH
export PATH="/usr/local/node/bin:/home/nothing/.local/bin:$PATH"

# Aliases
alias ff "fastfetch -c examples/13.jsonc"
alias vim "nvim"
alias cdnv "cd ~/.config/nvim"
alias cat "batcat"

# Prompt
# function fish_prompt
#           set_color green
#           printf "%s" (whoami)
#
#           set_color normal
#           printf " in "
#
#           set_color blue
#           printf "%s" (prompt_pwd)
#
#           set_color normal
#           printf "%s \$ "
# end
