set makeprg=gradle
set errorformat=
  \%-G:%.%\\+,
  \%E%f:\ %\\d%\\+:\ %m\ @\ line\ %l\\,\ column\ %c.,%-C%.%#,%Z%p^,
  \%E%>%f:\ %\\d%\\+:\ %m,%C\ @\ line\ %l\\,\ column\ %c.,%-C%.%#,%Z%p^,
  \%-G\\s%#,
  \%-GBUILD\ SUCCESSFUL#,
  \%-GTotal\ \time:\ %.%#

map <LocalLeader>jc :w<CR> :compiler javac<CR> :make -cp .:lib/* %<CR>:copen<CR>
map <LocalLeader>gt :make test<Return>:copen<Return>
map <LocalLeader>nn :cnext<Return>
map <LocalLeader>np :cprevious<Return>
map <LocalLeader>cl :ccl<Return>

