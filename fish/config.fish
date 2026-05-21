set fish_greeting

# PATH
export PATH="/usr/local/node/bin:/home/nothing/.local/bin:$PATH"
# Aliases
alias ff "fastfetch -c examples/13.jsonc"
alias vim "nvim"
alias cdnv "cd ~/.config/nvim"

# Prompt
function fish_prompt
          set_color green
          printf "%s" (whoami)

          set_color normal
          printf " in "

          set_color blue
          printf "%s" (prompt_pwd)

          set_color normal
          printf "%s \$ "
end
