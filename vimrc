" Lets try to get better at vim
syntax on
filetype plugin indent on

set background=dark
set softtabstop=2
set shiftwidth=2
set expandtab

set list
set listchars=tab:▸\ ,trail:▫

hi User1 ctermfg=green ctermbg=black
hi User2 ctermfg=yellow ctermbg=black
hi User3 ctermfg=red ctermbg=black
hi User4 ctermfg=blue ctermbg=black
hi User5 ctermfg=white ctermbg=black

set laststatus=2
set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%* "file format
set statusline +=%3*%y%* "file type
set statusline +=%2*%m%* "modified flag
set statusline +=%4*\ %<%F%* "full path
set statusline +=%1*%=%5l%* "current line
set statusline +=%2*/%L%* "total lines
set statusline +=%1*%4v\ %* "virtual column number
