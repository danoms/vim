""higlight function names
"syn match cCustomParen 	"(" contains=c contains=cCppParen
"syn match cCustomFunc 	"(/w/+/s*(" contains=cCustomParen
"
"hi def link cCustomFunc Function
"
"hi Function term=bold gui=bold



"Higlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
hi def link cCustomFunc Function
