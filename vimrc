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
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=*.pyc,*.class,*.o,*.a
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set hls
set viminfo=%,'50,\"100,:100,n~/.viminfo "info to save accross sessions
set hidden

set background=dark

:highlight Type ctermfg=118
:highlight Function ctermfg=202
:highlight Statement ctermfg=153

:highlight Comment ctermfg=magenta
:highlight Pmenu ctermbg=black ctermfg=magenta

cmap w! %!sudo tee > /dev/null %
imap <C-d> <ESC>:r! date<CR>kJ$a

set softtabstop=2
set shiftwidth=2
set expandtab

noremap 1 :tabnext 1<CR>
noremap 2 :tabnext 2<CR>
noremap 3 :tabnext 3<CR>
noremap 4 :tabnext 4<CR>
noremap 5 :tabnext 5<CR>
noremap 6 :tabnext 6<CR>
noremap 7 :tabnext 7<CR>
noremap 8 :tabnext 8<CR>
noremap 9 :tablast<CR>

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

hi User1 ctermfg=green ctermbg=black
hi User2 ctermfg=yellow ctermbg=black
hi User3 ctermfg=red ctermbg=black
hi User4 ctermfg=blue ctermbg=black
hi User5 ctermfg=white ctermbg=black

set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%* "file format
set statusline +=%3*%y%* "file type
set statusline +=%2*%m%* "modified flag
set statusline +=%4*\ %<%F%* "full path
set statusline +=%1*%=%5l%* "current line
set statusline +=%2*/%L%* "total lines
set statusline +=%1*%4v\ %* "virtual column number

function! ExecuteInShell(cmd)
  let t:last_shell_cmd = a:cmd
  if (system("tmux list-panes | wc -l | grep -Eo '(\\d+)'") > 1)
    execute(":silent !tmux send-keys -t 1 ".a:cmd." Enter" )
  else
    execute(":!".a:cmd)
  endif
  redraw!
endfunction

function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" keyboard shortcuts
nnoremap <leader><space> :call StripTrailingWhitespaces()<CR>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

