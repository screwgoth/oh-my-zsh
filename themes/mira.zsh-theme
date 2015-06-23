# Based on bira zsh theme with nvm, rvm and jenv support
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local nvm_p_i=$(nvm_prompt_info)
if [[ "$nvm_p_i"x == "x" ]]; then
    local nvm_node=''
else
    nvm_node='%{$fg[green]%}‹node-$(nvm_prompt_info)›%{$reset_color%}'
fi

local jenv_p_i=$(type jenv_prompt_info)
if [[ "$jvm_p_i"x == "x" ]]; then
    local jenv_java=''
else
    jenv_java='%{$fg[blue]%}‹$(jenv_prompt_info)›%{$reset_color%}'
fi

local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${nvm_node} ${rvm_ruby} ${jenv_java} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
