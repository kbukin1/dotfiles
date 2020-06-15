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
alias vi="vim"
alias qsh="qsub -P kepler -q o_pri_interactive_cpu_2G  -Is bash"
alias cp="cp -i"
alias p4diff="env P4DIFF=diff p4 diff"

alias qgdb="/home/utils/gdb-8.3.1-2/bin/gdb -q"
alias pwd=/bin/pwd

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

