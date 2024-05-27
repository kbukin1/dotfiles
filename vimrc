" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif

" provides tab-completion for file-realted tasks
set path+=**

" display all matching files when we tab complete
set wildmenu

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"Bundle 'Valloric/YouCompleteMe'

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

set background=dark
"colorscheme base16-default
"colorscheme elford
"colorscheme gruvbox

colorscheme solarized
let g:solarized_diffmode="high"
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=0
"let g:solarized_contrast = "low"
"let g:solarized_underline=0

"if &diff
"  colorscheme evening
"  " set diffopt+=iwhite
"endif

set noerrorbells
set vb
set t_vb=
set hlsearch

syntax enable
syntax on

set backspace=indent,eol,start " allow unrestricted over everything in insert mode
set autoindent	               " always set autoindenting on
set history=50	               " keep 50 lines of command line history
set ruler		                   " show the cursor position all the time
set showcmd		                 " display incomplete commands
set incsearch	                 " do incremental searching
set wildignore=*.o,*.obj
set showmatch
set cursorline                 " highlight current line
set expandtab                  " use spaces instead of tabs

set sw=4 ai noea
set ts=4
set shiftwidth=4
set tabstop=4
set softtabstop=4

set splitbelow
set splitright

set relativenumber
set number

if has('folding')
  set foldmethod=indent  " faster than syntax
  set foldlevelstart=99  " start unfolded
endif

if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j " remove comment leader when joining comments
endif
set formatoptions+=n   " smart auto-indenting inside numbered lists

" Spell-check Markdown files and Git Commit Messages
autocmd FileType markdown setlocal spell
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable dictionary auto-completion in Markdown files and Git Commit Messages
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell

set hidden                " allows you to hide buffers with unsaved changes without being prompted
" set laststatus=2          " always show status line
set lazyredraw            " don't update screen during macro replay
set nojoinspaces          " don't autoinsert two spaces after '.', '?', '!' for join command
set scrolloff=3           " start scrolling 3 lines   before edge of viewport
set sidescrolloff=3       " start scrolling 3 columns before edge of viewport

set shortmess+=A          " ignore swapfile message
set shortmess+=I          " no splash screen
set shortmess+=W          " don't echo [written] when writing
set shortmess+=a          " use abbreviations in messages, e.g. [RO] instead of [readonly]


"map <buffer> <C-K> :ClangFormat<cr>
"map <C-K> :pyf /home/utils/llvm-6.0.1/bin/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /home/utils/llvm-6.0.1/bin/clang-format.py<cr>

"map <C-K> :pyf /home/utils/llvm-4.0.1/share/clang/clang-format.py<cr>
"imap <C-K> <c-o>:pyf /home/utils/llvm-4.0.1/share/clang/clang-format.py<cr>

"if exists('+colorcolumn')
"  " highlight up to 255 columns (this is the current vim max) beyond
"  " 'textdidth'
"  let &l:colorcolumn='+' . join(range(0,254), ',+')
" endif


"set cul                                      " highlight current line
"hi CursorLine term=none cterm=none ctermbg=11 " adjust color
"hi CursorLineNr    term=bold cterm=bold ctermfg=012 gui=bold
hi CursorLineNr    term=bold cterm=bold ctermfg=012 gui=bold
" fancy cursor highlight:
"hi CursorLine                             ctermbg=237 ctermfg=grey guibg=#3a3a3a cterm=none gui=none
"hi CursorLineNr                           ctermfg=white ctermbg=magenta guibg=#3a3a3a cterm=none gui=none

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"atch OverLength /\%81v.\+/

"set undofile
"set undodir=~/.vim/undodir

"
" set Tlist_Ctags_Cmd = /home/kbukin/usr/bin/ctags

command! -nargs=1 Ss let @/ = <q-args>|set hlsearch

set sidescroll=1

if &bg == "dark"
    highlight MatchParen ctermbg=darkblue guibg=blue
endif



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

"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
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
    autocmd BufNewFile,BufRead Makeppfile set filetype=make
    " For dot (graphviz) files that use .gv
    autocmd BufRead,BufNewFile *.gv set filetype=dot
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

"set statusline=%F%m%r%h%w\ [%l/%L,\ %v]\ [%p%%]\ %=[TYPE=%Y]\ [FMT=%{&ff}]\ %{\"[ENC=\".(&fenc==\"\"?&enc:&fenc).\"]\"}

noremap <Up> <nop>      " disable arrows
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

"call vundle#end()            " required
"filetype plugin indent on    " required
filetype plugin on

" vimwiki
let wiki_1 = {}
let wiki_1.path   = '~/docs/wiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext    = 'md'

let wiki_2 = {}
let wiki_2.path   = '~/work/trains/doc/notes'
let wiki_2.syntax = 'markdown'
let wiki_2.ext    = 'md'
 
let g:vimwiki_list = [wiki_1, wiki_2]

" let g:vimwiki_list = [{'path': '~/docs/private/', 'syntax': 'markdown', 'ext': 'md'},
"                     \ {'path': '~/docs/nvbpfd/'},
"                     \ {'path': '~/docs/nvuring/'},
"                     \ {'path': '~/docs/test/'},
"                     \ ]
