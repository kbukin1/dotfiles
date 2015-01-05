set print pretty on
set pagination off
# add-auto-load-safe-path /home/utils/gcc-4.6.2/lib64/libstdc++.so.6.0.16-gdb.py
catch throw
handle SIGALRM nopass
#set disassembly-flavor intel
#set disassemble-next-line on

# catch syscall ptrace

#target remote tcp:10.31.217.151:6443
