function fish_greeting
end

set fish_key_bindings fish_vi_key_bindings

set -l prompt_color cdd6f4

# Bobthefish
set -g theme_nerd_fonts yes
set -g theme_powerline_fonts yes
set -g theme_color_scheme catppuccin-mocha
set -g theme_newline_cursor yes
set -g theme_newline_prompt (set_color cdd6f4)"❯ "(set_color normal)

# Autoload TMUX
if status is-interactive
    if type -q tmux
        if not set -q TMUX
            if not set -q SSH_TTY
                tmux attach -t main 2>/dev/null; or tmux new -s main
            end
        end
    end
end

# VARS
export PATH="/usr/local/node/bin:/home/nothing/.local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH"
export EDITOR="nvim"
source "$HOME/.cargo/env.fish"

# Aliases
alias ff "fastfetch --disable-linewrap"
alias v nvim
alias vim nvim
alias cdnv "cd ~/.config/nvim"
alias cat batcat
alias bat batcat
alias ls "eza --icons"
alias tree "eza --tree --icons"
alias cleanapt "sudo apt autopurge; sudo apt autoclean; sudo apt autoremove"
alias update "sudo apt update; sudo apt upgrade"
alias install "sudo apt update; sudo apt install"

# Prompt
# set -g __show_cmd_duration 0
#
# function __mark_command_finished --on-event fish_postexec
#     set -g __show_cmd_duration 1
# end
#
# function git_status_icons
#     command git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return
#
#     set -l staged (command git diff --cached --name-only)
#     set -l unstaged (command git diff --name-only)
#     set -l untracked (command git ls-files --others --exclude-standard)
#     set -l ahead (command git rev-list --count @{u}..HEAD 2>/dev/null)
#     set -l behind (command git rev-list --count HEAD..@{u} 2>/dev/null)
#
#     set -l out
#
#     if test -n "$staged"
#         set out $out (set_color a6e3a1)"●"
#     end
#
#     if test -n "$unstaged"
#         set out $out (set_color f9e2af)"✚"
#     end
#
#     if test -n "$untracked"
#         set out $out (set_color 89dceb)"?"
#     end
#
#     if test -n "$ahead"; and test $ahead -gt 0
#         set out $out (set_color cba6f7)"⇡$ahead"
#     end
#
#     if test -n "$behind"; and test $behind -gt 0
#         set out $out (set_color fab387)"⇣$behind"
#     end
#
#     if test (count $out) -eq 0
#         echo (set_color a6e3a1)"✔"
#     else
#         string join " " $out
#     end
# end
#
# function fish_prompt
#     set -l last_status $status
#     set -l cwd_color cba6f7
#     set -l git_color a6adc8
#     set -l time_color f9e2af
#     set -l prompt_color cdd6f4
#     set -l duration
#
#     if test $__show_cmd_duration -eq 1; and set -q CMD_DURATION; and test $CMD_DURATION -ge 100
#         set -l total_seconds (math -s 0 "$CMD_DURATION / 1000")
#
#         if test $total_seconds -ge 60
#             set -l minutes (math -s 0 "$total_seconds / 60")
#             set -l seconds (math -s 0 "$total_seconds % 60")
#             set duration (set_color $time_color)"$minutes"m"$seconds"s
#         else
#             set duration (set_color $time_color)"$total_seconds"s
#         end
#     end
#
#     set -g __show_cmd_duration 0
#
#     if test $last_status -ne 0
#         set prompt_color f38ba8
#     end
#
#     string join ' ' -- \
#         (set_color $cwd_color)(prompt_pwd) \
#         (set_color $git_color)(fish_git_prompt)" "(git_status_icons) \
#         '' $duration
#
#     printf "%s❯ %s" (set_color $prompt_color) (set_color normal)
# end
