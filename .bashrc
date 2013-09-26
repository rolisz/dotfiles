shopt -s autocd
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/activate.sh

White='\[\033[37m\]'
ResetColor="\[\033[0m\]"            # Text reset
GIT_PROMPT_END=" ${ResetColor} $ "

source ~/dotfiles/bash-git-prompt/gitprompt.sh
source ~/.django_bash_completion.sh

