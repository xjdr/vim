syn match javaError "<<<\|\.\.\|=>\|||=\|&&=\|\*\/"
syn match javaFuncDef "[^-]->"

syn match javaVarDecl "^\s\+\u\w\+\(\[\d*]\)*\(\s\+\w\+\s*=\)\@="
hi link javaVarDecl Function

syn match javaCastOper "(\u\w\+)"
hi link javaCastOper Constant

syn match javaLocalMethodInvoc "\s\@<=\w\+(\@="
hi link javaLocalMethodInvoc Operator

syn match javaOperator    "[][()]"
syn match javaBraces    "[{}]"
hi link javaBraces Identifier
