set print pretty on
set pagination off
set history save on
set confirm off

# add-auto-load-safe-path /home/utils/gcc-4.6.2/lib64/libstdc++.so.6.0.16-gdb.py
catch throw
handle SIGALRM nopass

#set follow-fork-mode child
set follow-fork-mode parent

set debug-file-directory /usr/lib/debug

#layout asm
#layout regs

set disassembly-flavor intel
#set disassemble-next-line on
set breakpoint pending on


# catch syscall ptrace
#target remote tcp:10.31.217.156:6443
#target remote tcp:10.31.218.57:6443
#target remote tcp:10.31.217.151:6443
#target remote tcp:10.31.217.161:6443

#python
#import sys
#sys.path.insert(0, '/home/scratch.kbukin_fermi/opt/src/python')
#from libstdcxx.v6.printers import register_libstdcxx_printers
#register_libstdcxx_printers (None)
#end

#source /home/kbukin/usr/share/peda/peda.py

