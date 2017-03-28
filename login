# .login file
# $Id: //hw/nv/env/.login#6 $

if ($?prompt) then
    if (($OSTYPE == "Linux") || ($OSTYPE == "Win32")) then
        stty erase "^?" 
    else
        stty erase "^H" 
    endif
    stty intr "^C"
    stty kill "" 
endif

if ($TERM == "dumb") then
    setenv TERM vt100
endif

if ($?TMUX) then
    setenv TERM xterm-256color
endif

