fish_vi_key_bindings
fastfetch
set fish_greeting

# Starship
starship init fish | source

# PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Prompt
#function fish_prompt
#  echo -n ' '(prompt_pwd)' '
#end
#
#function fish_mode_prompt
#end

# alias 
alias ls="eza -hg --icons --group-directories-first"
alias la="eza -hg --icons --group-directories-first -A"
alias ll="eza -hg --icons --group-directories-first -l"
alias lla="eza -hg --icons --group-directories-first -l -A"
alias vim="nvim"
alias cdnv="cd ~/.config/nvim"
alias progcpp="cd ~/My\ Files/Programming/C++\ Projects/"
alias progc="cd ~/My\ Files/Programming/C\ Projects/"
alias progco="cd ~/My\ Files/Programming/Courses\ Files/"
alias progp="cd ~/My\ Files/Programming/Python\ Projects/"
