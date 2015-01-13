execute pathogen#infect()
syntax on
filetype plugin indent on
set background=dark

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
" set relativenumber                                                   " show line numbers
" set number
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set hls
set viminfo=%,'50,\"100,:100,n~/.viminfo "info to save accross sessions
set hidden
set background=dark

:highlight Comment ctermfg=magenta
:highlight Pmenu ctermbg=black ctermfg=magenta

cmap w!! %!sudo tee > /dev/null %

imap <C-d> <ESC>:r! date<CR>kJ$a
imap <C-o> <ESC>:bn<CR>
imap <C-k> <ESC>:bp<CR>
map <C-o> <ESC>:bn<CR>
map <C-k> <ESC>:bp<CR>

set softtabstop=4
set shiftwidth=4
set expandtab

" change filetypes for common files
augroup filetypedetect
au BufNewFile,BufRead *.md set filetype=markdown softtabstop=4 shiftwidth=4
au BufNewFile,BufRead *.scala set filetype=scala
augroup END

autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set tags=~/.java-8-tags
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd Filetype java map <F9> :make<Return>:copen<Return>
autocmd Filetype java map <F10> :cprevious<Return>
autocmd Filetype java map <F11> :cnext<Return>

au BufNewFile,BufRead *.groovy  setf groovy
au BufNewFile,BufRead *.gradle  setf groovy

hi User1 ctermfg=green ctermbg=black
hi User2 ctermfg=yellow ctermbg=black
hi User3 ctermfg=red ctermbg=black
hi User4 ctermfg=blue ctermbg=black
hi User5 ctermfg=white ctermbg=black

set statusline=
set statusline +=%1*\ %n\ %* "buffer number
set statusline +=%5*%{&ff}%* "file format
set statusline +=%3*%y%* "file type
set statusline +=%4*\ %<%F%* "full path
set statusline +=%2*%m%* "modified flag
set statusline +=%1*%=%5l%* "current line
set statusline +=%2*/%L%* "total lines
set statusline +=%1*%4v\ %* "virtual column number
set statusline +=%2*0x%04B\ %* "character under cursor

function! <SID>StripTrailingWhitespaces()
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

" function! Smart_TabComplete()
"   let line = getline('.')                         " current line
"
"   let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                   " line to one character right
"                                                   " of the cursor
"   let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"   if (strlen(substr)==0)                          " nothing to match on empty string
"     return "\<tab>"
"   endif
"   let has_period = match(substr, '\.') != -1      " position of period, if any
"   let has_slash = match(substr, '\/') != -1       " position of slash, if any
"   if (!has_period && !has_slash)
"     return "\<C-X>\<C-P>"                         " existing text matching
"   elseif ( has_slash )
"     return "\<C-X>\<C-F>"                         " file matching
"   else
"     return "\<C-X>\<C-O>"                         " plugin matching
"   endif
" endfunction

" keyboard shortcuts
let mapleader = ','
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap <LocalLeader><space> :call <SID>StripTrailingWhitespaces()<CR>
" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

let NERDTreeIgnore=['\.pyc', '\.o', '\.class', '\.lo']
let NERDTreeHijackNetrw = 0
let g:netrw_banner = 0
let g:VimuxUseNearestPane = 1
let g:CommandTMaxHeight = 15
let g:CommandTMatchWindowAtTop = 1
let g:CommandTCancelMap = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']

" TComment
map <silent> <LocalLeader>cc :TComment<CR>
map <silent> <LocalLeader>uc :TComment<CR>

" Vimux
map <silent> <LocalLeader>rl :wa<CR> :VimuxRunLastCommand<CR>
map <silent> <LocalLeader>vi :wa<CR> :VimuxInspectRunner<CR>
map <silent> <LocalLeader>vk :wa<CR> :VimuxInterruptRunner<CR>
map <silent> <LocalLeader>vx :wa<CR> :VimuxClosePanes<CR>
map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
vmap <silent> <LocalLeader>vs "vy :call VimuxRunCommand(@v)<CR>
nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>

map <silent> <LocalLeader>gr :wa<CR> :VimuxRunCommand 'clear && gradle run'<CR>
map <silent> <LocalLeader>gt :wa<CR> :VimuxRunCommand 'clear && gradle test'<CR>
map <silent> <LocalLeader>gc :wa<CR> :VimuxRunCommand 'clear && gradle compileJava'<CR>
map <silent> <LocalLeader>gj :wa<CR> :VimuxRunCommand 'clear && gradle distZip'<CR>

" NERDTree
 map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
 map <silent> <LocalLeader>nr :NERDTree<CR>
 map <silent> <LocalLeader>nf :NERDTreeFind<CR>

" " CommandT
 map <silent> <LocalLeader>ff :CommandT<CR>
 map <silent> <LocalLeader>fb :CommandTBuffer<CR>
 map <silent> <LocalLeader>fr :CommandTFlush<CR>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

