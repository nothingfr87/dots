function fish_greeting
end

# set fish_key_bindings fish_vi_key_bindings
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes
set -g theme_color_scheme catppuccin-mocha

# Autoload TMUX
# if status is-interactive
#     if type -q tmux
#         if not set -q TMUX
#             if not set -q SSH_TTY
#                 tmux attach -t main 2>/dev/null; or tmux new -s main
#             end
#         end
#     end
# end

# PATH
export PATH="/usr/local/node/bin:/home/nothing/.local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH"
source "$HOME/.cargo/env.fish"

# Aliases
alias ff "fastfetch -c examples/13.jsonc --disable-linewrap"
alias vim nvim
alias cdnv "cd ~/.config/nvim"
alias cat batcat
alias ls "eza --icons"
alias cleanapt "sudo apt autopurge; sudo apt autoclean; sudo apt autoremove"
alias update "sudo apt update; sudo apt upgrade"
alias install "sudo apt update; sudo apt install"

# Prompt
set -g __show_cmd_duration 0

function __mark_command_finished --on-event fish_postexec
    set -g __show_cmd_duration 1
end

function fish_prompt
    set -l last_status $status
    set -l cwd_color cba6f7
    set -l git_color a6adc8
    set -l time_color f9e2af
    set -l prompt_color cdd6f4
    set -l duration

    if test $__show_cmd_duration -eq 1; and set -q CMD_DURATION; and test $CMD_DURATION -ge 100
        set duration (set_color $time_color)(math -s 1 "$CMD_DURATION / 1000")s
    end

    set -g __show_cmd_duration 0

    if test $last_status -ne 0
        set prompt_color f38ba8
    end

    string join ' ' -- \
        (set_color $cwd_color)(prompt_pwd) \
        (set_color $git_color)(fish_git_prompt) \
        '' $duration

    printf "%s❯ %s" (set_color $prompt_color) (set_color normal)
end
