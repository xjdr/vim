set softtabstop=2
set shiftwidth=2
set expandtab

set makeprg=.env/bin/nosetests
set errorformat=%-C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m,%-G%.%#

map <LocalLeader>tt :make<Return>:copen<Return>
map <LocalLeader>tl :make %<Return>:copen<Return>
map <LocalLeader>nn :cnext<Return>
map <LocalLeader>np :cprevious<Return>
map <LocalLeader>cl :ccl<Return>

