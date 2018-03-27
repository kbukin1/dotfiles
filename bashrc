[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases

export PS1='\h:\W\$'

export PATH="~/usr/bin\
:/home/utils/Python-2.7.8/bin\
:/home/utils/p4-2016.1/bin\
:/home/utils/vim-7.4.712/bin\
:/home/utils/git-2.9.2/bin\
:/home/utils/tmux-2.3/bin\
:/usr/local/lsf/bin\
:/home/utils/openssh-7.1p2/bin\
:$PATH"


# LSF stuff
LSF="/usr/local/lsf"
export LSF_LIBDIR="$LSF/lib"
export LSF_SERVERDIR="$LSF/etc"
export LSB_DEFAULTPROJECT="sw_nv5x"
export LSB_DEFAULTQUEUE="o_pri_cpu_.9G"

export P4CONFIG=.p4config
export P4CLIENT=kbukin
export P4PORT=p4hw:2001

