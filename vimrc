" Lets try to get better at vim
syntax on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
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

" change filetypes for common files
augroup xjeffrose
  au BufNewFile,BufRead *.groovy  setf groovy
  au BufNewFile,BufRead *.gradle  setf groovy
  au BufNewFile,BufRead *.scala set filetype=scala
  au BufNewFile,BufRead *.python set filetype=python sw=2 sts=2 et
  au BufNewFile,BufRead *.json setfiletype javascript
  au BufNewFile,BufRead BUILD set filetype=python sw=2 sts=2 et
  au BufNewFile,BufRead *.md set filetype=markdown softtabstop=4 shiftwidth=4

  autocmd Filetype markdown setlocal spell textwidth=80
  autocmd Filetype gitcommit,mail setlocal spell textwidth=76 colorcolumn=77
augroup END
