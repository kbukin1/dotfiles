[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -r ~/.bash_prompt ]] && . ~/.bash_prompt

shopt -s cdspell
#shopt -s dirspell

#shopt -s histappend
#export HISTFILESIZE=1000000
#export HISTSIZE=1000000

ulimit -c unlimited
ulimit -n 8192

#export PS1='\h:\W\$'

export PATH="\
/home/kbukin/usr/bin\
:/home/nv/bin\
:/usr/local/lsf/bin\
:/home/utils/p4-2016.1/bin\
:$PATH"

#export GENIE_BRANCH_DEFAULT=nvmobile
#export LM_LICENSE_FILE="SNPSLMD_LICENSE_FILE=1711@sac-lic-31:1711@sc-lic-33:1711@sc-lic-32:1711@lic-34:1711@sc-lic-14"

unset HISTFILE

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
export EDITOR=vim
export P4EDITOR=$EDITOR

export LESS="--quit-if-one-screen --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4"
export SNPSLMD_LICENSE_FILE=1711@synopsys-lic-02:1711@dc7-lic-01:1711@dc6-lic-07:1711@dc6-lic-06:1711@dc7-lic-35:1711@lic-34
