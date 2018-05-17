[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -r ~/.bash_prompt ]] && . ~/.bash_prompt

shopt -s cdspell
shopt -s dirspell

ulimit -c unlimited
ulimit -n 8192

#export PS1='\h:\W\$'

export PATH="\
/home/utils/Python-2.7.8/bin\
:/home/utils/p4-2016.1/bin\
:/home/utils/vim-7.4.712/bin\
:/home/utils/git-2.17.0/bin\
:/home/utils/tmux-2.3/bin\
:/home/utils/ghc-8.0.2/bin\
:~/usr/bin\
:/usr/local/lsf/bin\
:/home/utils/openssh-7.1p2/bin\
:/home/nv/bin\
:$PATH"


# LSF stuff
LSF="/usr/local/lsf"
export LSF_LIBDIR="$LSF/lib"
export LSF_SERVERDIR="$LSF/etc"
export LSB_DEFAULTPROJECT="sw_nv5x"
export LSB_DEFAULTQUEUE="o_pri_cpu_.9G"

export P4CONFIG=.p4config
#export P4CLIENT=kbukin
export P4PORT=p4hw:2001
export P4DIFF=vimdiff
export P4EDITOR=vim

export LESS="--quit-if-one-screen --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4"

unset HISTFILE
#export MALLOC_CHECK_=3

