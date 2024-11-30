set print pretty on
set pagination off
set history save on
set confirm off

catch throw
handle SIGALRM nopass

set follow-fork-mode child
#set follow-fork-mode parent

set debug-file-directory /usr/lib/debug

#layout asm
#layout regs

#set disassemble-next-line on
set breakpoint pending on

# catch syscall ptrace
#target remote tcp:10.31.217.156:6443

#source /home/kbukin/usr/share/peda/peda.py

# gdb on arm does not process the rest
set disassembly-flavor intel
