" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
syntax enable
set background=dark
"colorscheme base16-default
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme elford
colorscheme solarized
if &diff
  colorscheme evening
endif

if &diff
  " diff mode
  set diffopt+=iwhite
endif

set noerrorbells
set vb
set t_vb=
set hlsearch
" set number

autocmd Filetype gitcommit setlocal spell textwidth=72

syntax on

set autoindent		" always set autoindenting on
" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set wildignore=*.o,*.obj

set sw=2 ai noea
set ts=2
set shiftwidth=2

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

set expandtab

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"atch OverLength /\%81v.\+/

"set undofile
"set undodir=~/.vim/undodir

"
" set ruler
set showmatch
" set Tlist_Ctags_Cmd = /home/kbukin/usr/bin/ctags

if &bg == "dark"
    highlight MatchParen ctermbg=darkblue guibg=blue
endif

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

autocmd Syntax *.cpp call EnhanceCppSyntax()


function! s:insert_gates()
    let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
    execute "normal i#ifndef " . gatename
    execute "normal o#define " . gatename . "   "
    execute "normal Go#endif /* " . gatename . " */"
    normal k0
endfunction
autocmd  BufNewFile *.{h,hpp} call <SID>insert_gates()

" map S diw"0P

"map <C-J> <C-W>j
"map <C-K> <C-W>k


"set mouse=a "allow mouse support

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if &t_Co > 2 || has("gui_running")
if has("gui_running")
  syntax on
  set hlsearch
  "set diffexpr=MyDiff()
  function MyDiff()
    let opt = ''
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    silent execute '!C:\tools\vim\vim61\diff -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
  endfunction
  color murphy
  se guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-100-*-*-m-*-iso8859-2
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

se wrapscan

" syntax on

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
" inoremap ) )<c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" to highlight column 81 and more: >
map ,c :match rightMargin /.\%>1000v/
map ,h :match rightMargin /.\%>81v/
highlight rightMargin term=bold ctermfg=red guifg=red
"match rightMargin /.\%>81v/

map ,e iEaki:e! "ayy@a
map <C-X> :q!
map KL :q!

map <S-Down>  j
map <S-Up>    k
map <S-Left>  h
map <S-Right> l

map K :n

" Start of my customizations from Ira's original

if has("autocmd")
    autocmd BufNewFile,BufRead *.v,*.vt,*.vx imap {{ obeginendO
    autocmd BufNewFile,BufRead *.[^chpv]* imap {{ o{}O.>>$s
    autocmd BufNewFile,BufRead *.vr* imap {{ o{}O.>>$s
    autocmd BufNewFile,BufRead *.[chp]* imap {{ o{}O
"    autocmd BufNewFile,BufRead *.vx set filetype=viva
    autocmd BufNewFile,BufRead *.vr* set filetype=vera
endif " has("autocmd")

map ,k :se isk=@,48-57,_,192-255

" :ba  ' show all buffers
" nnoremap <silent> zz :exec "normal! zz" . float2nr(winheight(0)*0.1) . "\<Lt>C-E>"<CR>

" set rnu
" au InsertEnter * :set nu
" au InsertLeave * :set rnu
" au FocusLost * :set nu
" au FocusGained * :set rnu
"
" wrapping lines in vimdiff
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

