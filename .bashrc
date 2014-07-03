shopt -s autocd
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/activate.sh

White='\[\033[37m\]'
ResetColor="\[\033[0m\]"            # Text reset
GIT_PROMPT_END=" ${ResetColor} $ "

source ~/dotfiles/bash-git-prompt/gitprompt.sh
source ~/.django_bash_completion.sh

export PATH=/usr/local/cuda-5.5/bin:/home/local/3PILLAR/rszabo/.local/bin:/usr/local/bin:/usr/local/sbin:/home/local/3PILLAR/rszabo/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export LD_LIBRARY_PATH=/usr/local/cuda-5.5/lib64:
export PYLEARN2_DATA_PATH=/home/ubuntu/data
