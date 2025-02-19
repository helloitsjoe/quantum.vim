" vim:fdm=marker

" Initialization {{{
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "quantum"

" This function is based on one from https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui  : "NONE")
endfunction
" }}}

" Color Pallete {{{
if &background ==# 'dark'
  let s:foreground  = '#D7D7DB'
  let s:fg_sec      = '#C1C0C0'
  let s:status_line = 'blueviolet'
  " let s:fg_alt      = 'purple'
  let s:fg_alt      = '#939295'
  let s:comment     = '#737373'
  let s:guides      = '#4A4A4F'
  let s:visual      = '#38383D'
  let s:background  = '#181525' " '#111522'
  let s:border      = '#1b1b1d'

  let s:highlight   = '#434347'
  let s:line        = '#303034'
  let s:search      = '#58585C'
  let s:virtualtext = '#4A4A4F'

  " Color definitions
  let s:pink = '#FF7DE9' 
  let s:blue = '#75BFFF' 
  let s:blueviolet = '#6B89FF' 
  let s:green = '#87DE74' 
  let s:purple = '#B98EFF'
  let s:orange = '#FC9867' 
  let s:darkgreen = '#004422'
  let s:darkergreen = '#002211'
  let s:darkred = '#330000'
  let s:mediumgreen = '#00AA00'

  " An Old Hope
  " let s:pink = '#eb3d54' 
  " red: '#eb3d54',
  " let s:blueviolet = '#4fb4d8'
  " let s:green = '#78bd65'
  " let s:purple = '#e5cd52'
  " yellow: '#e5cd52',
  " let s:orange = '#ef7c2a' 

  let s:red = 'red' 
  let s:yellow = 'yellow'


  let s:keyword     = s:pink " pink
  let s:special     = s:blue " light blue (fn args)
  let s:string      = s:blueviolet
  let s:console     = s:purple
  let s:type        = s:pink " const
  let s:function    = s:green " fn names
  let s:constant    = s:green " require, module
  let s:boolean     = s:orange
  let s:operator    = s:fg_alt
  let s:import      = s:pink
  let s:diffadd     = s:darkgreen
  let s:diffdelete  = s:darkred
  let s:difftext    = s:darkgreen
  let s:diffchange    = s:darkergreen
  " let s:difftext    = s:yellow
  " let s:diffchange  = '#997700'
  " let s:difftext    = '#4466DD'
  " let s:diffchange  = '#223377'

  let s:error       = '#EB5368'
  let s:warning     = '#FFD866'

  " Visual highlight
  let s:fg_visual   = s:foreground
  let s:bg_visual   = '#3B44BB'

  " This is kinda neat too
  " let s:fg_visual   = s:background
  " let s:bg_visual   = s:special
else
  let s:foreground  = '#38383D'
  let s:fg_sec      = '#4A4A4F'
  let s:fg_alt      = '#535351'
  let s:comment     = '#737373'
  let s:guides      = '#D7D7DB'
  let s:visual      = '#DBDBDB'
  let s:background  = '#FFFFFF'
  let s:border      = '#B1B1B3'

  let s:highlight   = '#DCDCDD'
  let s:line        = '#F1F1F2'
  let s:search      = '#C4C4C6'
  let s:virtualtext = '#B1B1B3'

  let s:keyword     = '#DD00A9'
  let s:special     = '#0074E8'
  let s:string      = '#003EAA'
  let s:function    = '#058B00'
  let s:type        = '#8000D7'
  let s:constant    = '#E84521'
  let s:error       = '#d70022'
  let s:warning     = '#A47F00'
endif

" }}}

" Highlight Groups (see `:help highlight-groups`) {{{
call s:h("ColorColumn", { "bg": s:border })
call s:h("Conceal", { "fg": s:visual })
call s:h("Cursor", { "fg": s:background, "bg": s:special })
call s:h("CursorIM", {})
call s:h("CursorColumn", { "bg": s:guides })
if &diff 
  highlight CursorLine gui=underline guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
elseif &background ==# 'dark'
  highlight CursorLine gui=NONE guifg=NONE guibg='#303034' cterm=NONE ctermfg=NONE ctermbg=NONE
else
  highlight CursorLine gui=NONE guifg=NONE guibg='#F1F1F2' cterm=NONE ctermfg=NONE ctermbg=NONE
endif
call s:h("Directory", { "fg": s:fg_alt })

" Diff colors
call s:h("DiffAdd", { "bg": s:diffadd, "fg": "#00FF00" })
call s:h("DiffChange", { "bg": s:diffchange, "fg": s:difftext })
call s:h("DiffDelete", { "bg": s:diffdelete, "fg": 'darkred' })
call s:h("DiffText", { "bg": s:difftext, "fg": "seagreen" })

call s:h("ErrorMsg", { "fg": s:error })
call s:h("VertSplit", { "fg": s:border })
call s:h("Folded", { "fg": s:fg_alt })
call s:h("FoldColumn", {})
call s:h("SignColumn", { "bg": s:background })
call s:h("IncSearch", { "fg": s:background, "bg": s:string })
call s:h("LineNr", { "fg": s:string })
call s:h("CursorLineNr", { "fg": s:fg_sec })
call s:h("MatchParen", { "fg": s:foreground, "bg": s:comment, "gui": "underline" })
call s:h("ModeMsg", {})
call s:h("MoreMsg", {})
call s:h("NonText", { "fg": s:visual })
call s:h("Normal", { "fg": s:foreground, "bg": s:background })
call s:h("Pmenu", { "fg": s:fg_sec, "bg": s:visual })
call s:h("PmenuSel", { "fg": s:foreground, "bg": s:comment })
call s:h("PmenuSbar", { "bg": s:visual })
call s:h("PmenuThumb", { "bg": s:comment })
call s:h("Question", { "fg": s:constant })
call s:h("QuickFixLine", { "fg": s:background, "bg": s:string })
call s:h("Search", { "bg": s:search })
call s:h("SpecialKey", { "fg": s:guides })
call s:h("SpellBad", { "fg": s:error, "gui": "undercurl", "sp": s:error }) 
call s:h("SpellCap", { "fg": s:warning })
call s:h("SpellLocal", { "fg": s:special })
call s:h("SpellRare", { "fg": s:special })
call s:h("StatusLine", { "fg": s:status_line, "bg": s:border })
call s:h("StatusLineNC", { "fg": s:guides, "bg": s:border })
call s:h("TabLine", { "fg": s:fg_alt, "bg": s:background })
call s:h("TabLineFill", { "fg": s:fg_alt, "bg": s:background })
call s:h("TabLineSel", { "fg": s:string })
call s:h("Terminal", { "fg": s:foreground, "bg": s:background })
call s:h("Title", { "fg": s:string }) 
" call s:h("Visual", { "fg": s:fg_visual, "bg": s:bg_visual })
highlight Visual guibg=black cterm=reverse 
call s:h("VisualNOS", {})
call s:h("WarningMsg", { "fg": s:warning })
call s:h("WildMenu", { "fg": s:background, "bg": s:string })
" }}}

" Syntax Groups (see `:help group-name`) {{{
call s:h("Comment", { "fg": s:comment, "gui": "italic" })
call s:h("Constant", { "fg": s:constant }) " require, module
call s:h("String", { "fg": s:string })
call s:h("Character", { "fg": s:string })
call s:h("Number", { "fg": s:constant })
call s:h("Boolean", { "fg": s:boolean })
call s:h("Float", { "fg": s:constant })
call s:h("Identifier", { "fg": s:foreground })
call s:h("Function", { "fg": s:function })
call s:h("Statement", { "fg": s:keyword })
call s:h("Conditional", { "fg": s:keyword })
call s:h("Repeat", { "fg": s:keyword })
call s:h("Label", { "fg": s:keyword })
call s:h("Operator", { "fg": s:operator })
call s:h("Keyword", { "fg": s:keyword })
call s:h("Exception", { "fg": s:keyword })
call s:h("PreProc", { "fg": s:keyword })
call s:h("Include", { "fg": s:import })
call s:h("Define", { "fg": s:keyword })
call s:h("Macro", { "fg": s:keyword })
call s:h("PreCondit", { "fg": s:keyword })
call s:h("Type", { "fg": s:console, "gui": 'italic' }) " console
call s:h("StorageClass", { "fg": s:type, "gui": 'italic' }) " const
call s:h("Structure", { "fg": s:type })
call s:h("Typedef", { "fg": s:type })
call s:h("Special", { "fg": s:fg_alt })
call s:h("SpecialChar", { "fg": s:special })
call s:h("Tag", {})
call s:h("Delimiter", { "fg": s:fg_alt }) " parens/brackets
call s:h("SpecialComment", { "fg": s:fg_alt })
call s:h("Debug", { "fg": s:warning })
call s:h("Underlined", { "gui": "underline" })
call s:h("Ignore", {})
call s:h("Error", { "fg": s:error, "sp": s:error })
call s:h("Todo", { "fg": s:warning, "gui": 'bold' })
" }}}

" Language Highlights {{{
  " elixir-editors/vim-elixir {{{
    call s:h("elixirPseudoVariable", { "fg": s:fg_sec, "gui": "italic" })
    call s:h("elixirAtom", { "fg": s:special })
  " }}}

  " pangloss/vim-javascript {{{
    call s:h("jsFuncArgs", { "fg": s:special, "gui": "italic" })
    call s:h("jsThis", { "fg": s:fg_sec, "gui": "italic" })
    call s:h("jsSuper", { "fg": s:fg_sec, "gui": "italic" })

    hi link jsParen SpecialChar
    hi link jsVariableDef SpecialChar
    hi link jsModuleKeyword SpecialChar
    hi link jsSpreadExpression SpecialChar
    hi link jsTemplateExpression SpecialChar
    hi link jsDestructuringBlock SpecialChar
    hi link jsObjectShorthandProp SpecialChar
    hi link jsBracket SpecialChar
    hi link jsObjectValue SpecialChar
    hi link jsParenIfElse SpecialChar
    hi link jsDestructuringAssignment SpecialChar
    hi link jsDestructuringPropertyValue SpecialChar
    hi link jsDot Keyword
    hi link jsSpreadOperator Keyword
    hi link jsTemplateBraces Keyword
    hi link jsFuncBlock Type
    hi link jsFuncArgExpression Type
    hi link jsxTagName Function
    hi link jsxTagName Function
    hi link jsObjectKey Function
    hi link jsObjectProp Function
    hi link jsOperatorKeyword Function

    hi link jsClassKeyword  Type
    hi link jsGlobalObjects Type
    hi link jsPrototype     Type
    hi link jsFunction      Keyword
    hi link jsArrowFunction Operator
    hi def link Noise       Delimiter
  " }}}

  " HerringtonDarkholme/yats {{{
    hi link typescriptUnaryOp Boolean
    hi link typescriptParens Delimiter
    hi link typescriptVariable Keyword
    hi link typescriptOperator Keyword
    hi link typescriptParenExp Keyword
    hi link typescriptTypeReference Type
    hi link typescriptIdentifierName Type
    hi link typescriptIdentifierName Type
    hi link typescriptDefaultImportName Type
    hi link typescriptCall SpecialChar
    hi link typescriptMember SpecialChar
    hi link typescriptObjectLabel SpecialChar
    hi link typescriptConditionalParen SpecialChar
    hi link typescriptVariableDeclaration SpecialChar
    hi link typescriptProp Function
    hi link typescriptGlobal Function
    hi link typescriptClassName Function
    hi link typescriptAliasDeclaration Function
    hi link typescriptMemberOptionality Function
  " }}}

" Ruby
call s:h("rubySymbol", { "fg": s:special })
hi link rubyClassName   Function
hi link rubyModuleName  Function
hi link RubyConstant    Constant

" HTML
call s:h("htmlTagName", { "fg": s:special, "gui": "italic" })
call s:h("htmlLink", { "fg": s:function, "gui": "underline" })
hi link htmlTitle   Identifier
hi link htmlArg     Keyword
hi link htmlTag     Delimiter
hi link htmlEndTag  Delimiter
hi link htmlH1      Identifier
" }}}

" Plugin Highlights {{{
  " scrooloose/nerdtree {{{
    hi link NERDTreeOpenable    Directory
    hi link NERDTreeClosable    String
    hi link NERDTreeUp          Directory
    hi link NERDTreeDir         Directory
    hi link NERDTreeFile        Directory
    hi link NERDTreeDirSlash    NonText
  " }}}

  " mhinz/vim-signify {{{
    call s:h("SignifySignAdd", { "fg": s:function })
    call s:h("SignifySignChange", { "fg": s:warning })
    call s:h("SignifySignDelete", { "fg": s:error })
  " }}}

  " airblade/vim-gitgutter {{{ 
    hi link GitGutterAdd    SignifySignAdd
    hi link GitGutterChange SignifySignChange
    hi link GitGutterDelete SignifySignDelete
  " }}}

  " RRethy/vim-illuminate {{{
    call s:h("illuminatedWord", { "bg": s:highlight })
  " }}}

  " dense-analysis/ale {{{
    call s:h("ALESignColumnWithoutErrors", {})
    hi link ALEError            CocErrorHighlight
    hi link ALEWarning          CocWarningHighlight
    hi link ALEInfo             CocInfoHighlight
    hi link ALEStyleError       CocErrorHighlight
    hi link ALEStyleWarning     CocWarningHighlight
    hi link ALEErrorSign        Error
    hi link ALEWarningSign      WarningMsg
    hi link ALEInfoSign         SpecialChar
    hi link ALEStyleErrorSign   Keyword
    hi link ALEStyleWarningSign SpecialChar
  " }}}

  " neoclide/coc.nvim {{{
    call s:h("CocHighlightText", { "bg": s:highlight })
    call s:h("CocCodeLens", { "fg": s:virtualtext })
    call s:h("CocErrorHighlight", { "gui": "undercurl", "sp": s:error })
    call s:h("CocWarningHighlight", { "gui": "undercurl", "sp": s:warning })
    call s:h("CocInfoHighlight", { "gui": "undercurl", "sp": s:special })
    call s:h("CocHintHighlight", { "gui": "undercurl", "sp": s:function })
    call s:h("CocGitChangeRemovedSign", { "fg": s:string })
    hi link CocErrorSign            Error
    hi link CocWarningSign          WarningMsg
    hi link CocInfoSign             SpecialChar
    hi link CocHintSign             Function
    hi link CocGitAddedSign         SignifySignAdd
    hi link CocGitChangedSign       SignifySignChange
    hi link CocGitRemovedSign       SignifySignDelete
    hi link CocGitTopRemovedSign    SignifySignDelete
  " }}}

  " tpope/vim-fugitive {{{
    hi link diffAdded                   SignifySignAdd
    hi link diffRemoved                 SignifySignDelete
    hi link fugitiveHash                String
    hi link fugitiveSymbolicRef         Structure
    hi link fugitiveUntrackedModifier   Function
    hi link fugitiveUnstagedModifier    WarningMsg
    hi link fugitiveStagedModifier      SpecialChar
  " }}}
" }}}

" Nvim Terminal {{{
if has("nvim")
  let g:terminal_color_0 = s:background
  let g:terminal_color_1 = s:error
  let g:terminal_color_2 = s:function
  let g:terminal_color_3 = s:warning
  let g:terminal_color_4 = s:string
  let g:terminal_color_5 = s:type
  let g:terminal_color_6 = s:special
  let g:terminal_color_7 = s:foreground
  let g:terminal_color_8 = s:comment
  let g:terminal_color_9 = s:keyword
  let g:terminal_color_10 = s:function
  let g:terminal_color_11 = s:warning
  let g:terminal_color_12 = s:string
  let g:terminal_color_13 = s:type
  let g:terminal_color_14 = s:special
  let g:terminal_color_15 = s:fg_alt
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
endif
" }}}"

" gitcommit {{{
call s:h("gitcommitOnBranch", {})
call s:h("gitcommitBranch", { "fg": s:type })
call s:h("gitcommitDiscardedType", { "fg": s:error })
call s:h("gitcommitSelectedType", { "fg": s:special })
call s:h("gitcommitHeader", {})
call s:h("gitcommitDiscardedFile", { "fg": s:error })
call s:h("gitcommitSelectedFile", { "fg": s:special })
call s:h("gitcommitFile", {})
call s:h("gitcommitSummary", { "fg": s:foreground })
call s:h("gitcommitOverflow", { "fg": s:warning })
hi link gitcommitComment        Comment
hi link gitcommitUnmerged       SignifySignDelete
hi link gitcommitUntrackedFile  SignifySignAdd
hi link gitcommitUnmergedFile   SignifySignDelete
hi link gitcommitNoBranch       gitcommitBranch
hi link gitcommitUntracked      gitcommitUntrackedFile
hi link gitcommitDiscarded      gitcommitComment
hi link gitcommitSelected       gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow  gitcommitSelectedFile
hi link gitcommitUnmergedArrow  gitcommitUnmergedFile
" }}}
