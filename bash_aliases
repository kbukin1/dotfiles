# ABBREVIATIONS
alias a="alias"
alias c="clear"
alias h="history | tail -n30"
alias grep="grep --colour=auto"

alias dir="ls -l"
alias ls="ls -h -F --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias po="popd"
alias pu="pushd"

alias gv="ghostview"
alias od="od -tx4 -Ax"
alias od2="xxd -g4"
alias bc="bc -q"
alias tkdiff="~/usr/bin/tkdiff"
alias bjobsw="bjobs -UF"
alias vi="/home/utils/vim-9.0.0630/bin/vim"
alias qsh="qsub -P kepler -q o_pri_interactive_cpu_2G  -Is bash"
alias cp="cp -i"
alias p4="/home/utils/p4-2016.1/bin/p4"
alias p4diff="env P4DIFF=diff p4 diff"

alias qd="/home/utils/gdb-10.1/bin/gdb -q"
alias pwd=/bin/pwd
alias ssh="/home/utils/openssh-8.1p1/bin/ssh -q -o StrictHostKeyChecking=accept-new"
alias scp="scp -q"
alias tmux=/home/utils/tmux-3.3a/bin/tmux
alias git=/home/utils/git-2.38.0/bin/git

g() {
    cd `cat ~/.saved_dir/$1`;
}
s() {
    pwd > ~/.saved_dir/$1;
}

#alias dos2unix=""perl -pi -e 's/\cM//g;'""
#alias unix2dos=""perl -pi -e 's/\n/\cM\n/m;'""

bkill_grep() {
    bjobs | grep $1 | perl -pe 's/(\d+).*/$1/' | xargs bkill
}

