" Color charts
" ------------------------------
" Name            Hex       Term
" --------------  --------  ----
" yellow_light    #ffd757   221
" yellow_regular  #ffd700   220
" yellow_dark     #d7af00   178
" green_light     #87d757   113
" green_regular   #5fd700   76
" green_dark      #5f8700   64
" orange_light    #ffaf5f   215
" orange_regular  #ff8700   208
" orange_dark     #d75f00   166
" blue_light      #5fafd7   74
" blue_regular    #00afd7   38
" blue_dark       #005f87   24
" violet_light    #af87af   139
" violet_regular  #875f87   96
" violet_dark     #5f005f   53
" brown_light     #d7af5f   179
" brown_regular   #af8700   136
" brown_dark      #875f00   94
" red_lightest    #ff0000   196
" red_light       #d70000   160
" red_regular     #af0000   124
" red_dark        #870000   88
" red_darkest     #5f0000   52
" white           #ffffff   231
" gray_lightest   #d0d0d0   252
" gray_light      #bcbcbc   250
" gray_regular    #878787   102
" gray_dark       #585858   240
" gray_darkest    #303030   236
" black           #000000   16
" ------------------------------

if has("gui_running")
    set background=dark
endif
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "alder"

if !exists("g:alder_enable_italic")
  let g:alder_enable_italic = 0
endif

if !exists("g:alder_transparent_background")
  let g:alder_transparent_background = 0
endif

if has("gui_running")
  let s:yellow_light    = "#ffd757"
  let s:yellow_regular  = "#ffd700"
  let s:yellow_dark     = "#d7af00"
  let s:green_light     = "#87d757"
  let s:green_regular   = "#5fd700"
  let s:green_dark      = "#5f8700"
  let s:orange_light    = "#ffaf5f"
  let s:orange_regular  = "#ff8700"
  let s:orange_dark     = "#d75f00"
  let s:blue_light      = "#5fafd7"
  let s:blue_regular    = "#00afd7"
  let s:blue_dark       = "#005f87"
  let s:violet_light    = "#af87af"
  let s:violet_regular  = "#875f87"
  let s:violet_dark     = "#5f005f"
  let s:brown_light     = "#d7af5f"
  let s:brown_regular   = "#af8700"
  let s:brown_dark      = "#875f00"
  let s:red_lightest    = "#ff0000"
  let s:red_light       = "#d70000"
  let s:red_regular     = "#af0000"
  let s:red_dark        = "#870000"
  let s:red_darkest     = "#5f0000"
  let s:white           = "#ffffff"
  let s:gray_lightest   = "#d0d0d0"
  let s:gray_light      = "#bcbcbc"
  let s:gray_regular    = "#878787"
  let s:gray_dark       = "#585858"
  let s:gray_darkest    = "#303030"
  let s:black           = "#000000"

  let s:mode = "gui"
else
  if &t_Co == 256
    let s:yellow_light    = "221"
    let s:yellow_regular  = "220"
    let s:yellow_dark     = "178"
    let s:green_light     = "113"
    let s:green_regular   = "76"
    let s:green_dark      = "64"
    let s:orange_light    = "215"
    let s:orange_regular  = "208"
    let s:orange_dark     = "166"
    let s:blue_light      = "74"
    let s:blue_regular    = "38"
    let s:blue_dark       = "24"
    let s:violet_light    = "139"
    let s:violet_regular  = "96"
    let s:violet_dark     = "53"
    let s:brown_light     = "179"
    let s:brown_regular   = "136"
    let s:brown_dark      = "94"
    let s:red_lightest    = "196"
    let s:red_light       = "160"
    let s:red_regular     = "124"
    let s:red_dark        = "88"
    let s:red_darkest     = "52"
    let s:white           = "231"
    let s:gray_lightest   = "252"
    let s:gray_light      = "250"
    let s:gray_regular    = "102"
    let s:gray_dark       = "240"
    let s:gray_darkest    = "236"
    let s:black           = "16"
  else
    let s:yellow_light    = "LightYellow"
    let s:yellow_regular  = "Yellow"
    let s:yellow_dark     = "DarkYellow"
    let s:green_light     = "LightGreen"
    let s:green_regular   = "Green"
    let s:green_dark      = "DarkGreen"
    let s:orange_light    = "LightCyan"
    let s:orange_regular  = "Cyan"
    let s:orange_dark     = "DarkCyan"
    let s:blue_light      = "LightBlue"
    let s:blue_regular    = "Blue"
    let s:blue_dark       = "DarkBlue"
    let s:violet_light    = "SlateBlue"
    let s:violet_regular  = "Violet"
    let s:violet_dark     = "Purple"
    let s:brown_light     = "LightMagenta"
    let s:brown_regular   = "Magenta"
    let s:brown_dark      = "DarkMagenta"
    let s:red_lightest    = "Orange"
    let s:red_light       = "LightRed"
    let s:red_regular     = "Red"
    let s:red_dark        = "DarkRed"
    let s:red_darkest     = "Brown"
    let s:white           = "White"
    let s:gray_lightest   = "White"
    let s:gray_light      = "LightGray"
    let s:gray_regular    = "Gray"
    let s:gray_dark       = "DarkGray"
    let s:gray_darkest    = "Black"
    let s:black           = "Black"
  endif

  if g:alder_transparent_background == 1
    let s:gray_darkest = "NONE"
  endif

  let s:mode = "cterm"
endif

function! s:Hi(group, ...)
  let l:fg = a:0 >=1 && strlen(a:1) ? a:1 : "NONE"
  let l:bg = a:0 >=2 && strlen(a:2) ? a:2 : "NONE"
  let l:attr = a:0 >= 3 && strlen(a:3) ? a:3 : ""

  if g:alder_enable_italic == 0
    let l:attr = join(filter(split(l:attr, ","), "v:val !=? 'italic'"), ",")
  endif

  let l:attr = strlen(l:attr) ? l:attr : "NONE"

  return join(["hi", a:group, s:mode."fg=".l:fg, s:mode."bg=".l:bg, s:mode."=".l:attr], " ")
endfunction


" Basic highlighting
" ------------------
exe s:Hi("Normal", s:gray_lightest, s:gray_darkest)

exe s:Hi("Comment", s:gray_regular, s:gray_darkest, "italic")
"       *Comment         any comment

exe s:Hi("Constant", s:yellow_regular, s:gray_darkest)
"       *Constant        any constant
"        String          a string constant: "this is a string"
"        Character       a character constant: 'c', '\n'
"        Number          a number constant: 234, 0xff
"        Boolean         a boolean constant: TRUE, false
"        Float           a floating point constant: 2.3e10

exe s:Hi("Identifier", s:blue_light, s:gray_darkest)
"       *Identifier      any variable name
"        Function        function name (also: methods for classes)

exe s:Hi("Statement", s:white, s:gray_darkest, "bold")
"       *Statement       any statement
"        Conditional     if, then, else, endif, switch, etc.
"        Repeat          for, do, while, etc.
"        Label           case, default, etc.
"        Operator        "sizeof", "+", "*", etc.
"        Keyword         any other keyword
"        Exception       try, catch, throw

exe s:Hi("PreProc", s:violet_light, s:gray_darkest)
"       *PreProc         generic Preprocessor
"        Include         preprocessor #include
"        Define          preprocessor #define
"        Macro           same as Define
"        PreCondit       preprocessor #if, #else, #endif, etc.

exe s:Hi("Type", s:green_light, s:gray_darkest, "bold")
"       *Type            int, long, char, etc.
"        StorageClass    static, register, volatile, etc.
"        Structure       struct, union, enum, etc.
"        Typedef         A typedef

exe s:Hi("Special", s:orange_light, s:gray_darkest)
"       *Special         any special symbol
"        SpecialChar     special character in a constant
"        Tag             you can use CTRL-] on this
"        Delimiter       character that needs attention
"        SpecialComment  special things inside a comment
"        Debug           debugging statements

exe s:Hi("Underlined", s:blue_light, s:gray_darkest, "underline")
"       *Underlined      text that stands out, HTML links

exe s:Hi("Ignore")
"       *Ignore          left blank, hidden  |hl-Ignore|

exe s:Hi("Error", s:white, s:red_regular, "bold")
"       *Error           any erroneous construct

exe s:Hi("Todo", s:gray_regular, s:yellow_light, "bold")
"       *Todo            anything that needs extra attention; mostly the
"                        keywords TODO FIXME and XXX


" Syntax Highlighting
" -------------------
"exe s:Hi("String")
"exe s:Hi("Character")
"exe s:Hi("Conditional")
"exe s:Hi("Label")
"exe s:Hi("Repeat")
"exe s:Hi("Keyword")
"exe s:Hi("Exception")

"exe s:Hi("Function")

"exe s:Hi("Typedef")
"exe s:Hi("Include")
"exe s:Hi("Define")
"exe s:Hi("Macro")
"exe s:Hi("Precondit")
"exe s:Hi("SpecialComment")

"exe s:Hi("Delimiter")
"exe s:Hi("Debug")
exe s:Hi("SpecialChar", s:orange_dark, s:gray_darkest)
exe s:Hi("Title", s:yellow_light, s:gray_darkest, "bold")

exe s:Hi("Boolean", s:orange_dark, s:gray_darkest)
"exe s:Hi("Number")
"exe s:Hi("Float")
"exe s:Hi("Operator")
"exe s:Hi("Tag")
"exe s:Hi("Ignore")

exe s:Hi("MatchParen", s:white, s:violet_light)

"exe s:Hi("StorageClass")
"exe s:Hi("Structure")
exe s:Hi("WildMenu", s:gray_darkest, s:yellow_regular)

exe s:Hi("DiffAdd", s:gray_lightest, s:green_dark)
exe s:Hi("DiffChange", "", s:blue_dark)
exe s:Hi("DiffDelete", s:red_darkest, s:red_dark)
exe s:Hi("DiffText", s:blue_light, s:black, "reverse")

" User Interface
" --------------
exe s:Hi("Cursor", s:black, s:gray_lightest)
exe s:Hi("Search", s:white, s:green_dark)
"exe s:Hi("IncSearch")
exe s:Hi("ColorColumn", "", s:gray_dark)
exe s:Hi("SignColumn", s:gray_dark, s:gray_light)

exe s:Hi("WarningMsg", s:red_light, s:gray_darkest)
exe s:Hi("ErrorMsg", s:white, s:red_regular)
"exe s:Hi("ModeMsg")
exe s:Hi("MoreMsg", s:green_light, s:gray_darkest, "bold")
exe s:Hi("Question", s:green_light, s:gray_darkest, "bold")
exe s:Hi("Directory", s:blue_light, s:gray_darkest)
exe s:Hi("SpecialKey", s:gray_dark, s:gray_darkest)
"exe s:Hi("Titled")
exe s:Hi("NonText", s:gray_dark, s:gray_darkest)
"exe s:Hi("CursorLineNr")

exe s:Hi("PmenuSel", s:white, s:gray_dark)
exe s:Hi("PmenuSBar", s:gray_dark, s:gray_dark)
exe s:Hi("PmenuThumb", s:gray_regular, s:gray_regular)

exe s:Hi("Visual", s:white, s:gray_regular)
exe s:Hi("Pmenu", s:gray_light, s:black)
exe s:Hi("Linenr", s:gray_dark, s:gray_darkest)
exe s:Hi("VertSplit", s:gray_darkest, s:gray_regular, "bold")
exe s:Hi("StatusLine", s:black, s:gray_lightest, "italic")
exe s:Hi("StatusLineNC", s:gray_regular, s:gray_dark)
exe s:Hi("Folded", s:gray_light, s:gray_darkest, "bold,underline")
exe s:Hi("FoldColumn", s:gray_dark, s:black)


" diff colors
" -----------
hi link diffFile Special
hi link diffNewFile diffFile

exe s:Hi("diffAdded", s:green_dark)
exe s:Hi("diffRemoved", s:red_light)

" gitcommit colors
" ----------------
hi link gitEmail SpecialChar
hi link gitEmailDelimiter gitEmail
hi link gitcommitComment Comment
hi link gitcommitHeader gitcommitComment
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment

exe s:Hi("gitcommitSelectedType", s:green_light)
exe s:Hi("gitcommitDiscardedType", s:yellow_light)
exe s:Hi("gitcommitUnmergedType", s:red_light)
exe s:Hi("gitcommitSelectedFile", s:green_light, "", "bold")
exe s:Hi("gitcommitDiscardedFile", s:yellow_light, "", "bold")
exe s:Hi("gitcommitUnmergedFile", s:red_light, "", "bold")
exe s:Hi("gitcommitUntrackedFile", s:violet_light, "", "bold")


" XML colors
" ----------
hi link xmlTag Identifier
hi link xmlEndTag xmlTag
hi link xmlTagName xmlTag
hi link xmlString String

" HTML colors
" -----------
hi link htmlTag xmlTag
hi link htmlEndTag xmlEndTag
hi link htmlTagName xmlTagName
hi link htmlSpecialTagName xmlTagName
hi link htmlString xmlString
hi link htmlSpecialChar PreProc
hi link Javascript Normal

" CSS Colors
" ----------
hi link cssIdentifier Normal
hi link cssClassName Normal
hi link cssTagName Normal
hi link cssBraces Normal
hi link cssRenderProp Keyword
hi link cssBoxProp cssRenderProp
hi link cssUIProp cssRenderProp
hi link cssColorProp cssRenderProp
hi link cssFontProp cssRenderProp
hi link cssTextProp cssRenderProp
hi link cssGeneratedContentProp cssRenderProp
hi link cssValueLength Boolean
hi link cssPseudoClassId Identifier

" Javascript colors
" following syntax from https://github.com/pangloss/vim-javascript
hi link jsBraces normal
hi link jsLabel Identifier
hi link jsThis Identifier
hi link jsReturn Statement

" PHP colors
" ----------
hi link phpVarSelector Identifier
hi link phpIdentifier Identifier
hi link phpParent Normal
hi link phpFunctions Function
hi link phpSpecial Special
hi link phpMemberSelector Keyword
hi link phpBoolean Boolean
hi link phpNumber Number

" Ruby colors
" -----------
hi link rubyClass Keyword
hi link rubyDefine Keyword
