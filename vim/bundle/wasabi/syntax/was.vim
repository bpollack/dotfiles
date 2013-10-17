" Vim syntax file
" Language:	Fog Creek Wasabi
" Maintainer:	Daniel Wagner <daniel@wagner-home.com>
" Version:	$Revision: 1.2 $
" Thanks to Jay-Jay <vim@jay-jay.net> for a syntax sync hack, hungarian
" notation, and extra highlighting.
" Thanks to patrick dehne <patrick@steidle.net> for the folding code.
" Thanks to Dean Hall <hall@apt7.com> for testing the use of classes in
" VBScripts which I've been too scared to do.
" Thanks to Daniel Wagner <daniel@wagner-home.com> for some updates to the
" folding code and addition of several Wasabi-specific features

" Quit when a syntax file was already loaded
if version < 600
  syn clear
elseif exists("b:current_syntax")
  "finish
endif

if !exists("main_syntax")
  let main_syntax = 'was'
endif

if version < 600
  source <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
endif
unlet b:current_syntax

syn cluster htmlPreProc add=WasabiInsideHtmlTags
syn case ignore " probably set by the HTML syntax highlighter, but let's not rely on that

" Wasabi-specific things
syn match WasabiIfDef       contained "'#\(A\|P\|E\)\(\s\|$\)"
syn match WasabiIfDef       contained "'#\(Else\|EndIf\)"
syn match WasabiIfDef       contained "'#\(Else\)\?If\s"
syn match WasabiAttribute   contained "<\(\(program\|file\):\s*\)\=[^ 	(]\+\(([^)]\+)\)\=\(,\s\+[^ 	(]\+\(([^)]\+)\)\=\)*>"
syn keyword WasabiAttribute contained PictureOf
syn keyword WasabiStatement contained Union In Is To Result ByRef ByVal Step
syn keyword WasabiFunction  contained GetArray GetArrayRef

" Colored variable names, if written in hungarian notation
" Subtly admonish the mixture of hungarian and non-hungarian notation
hi WasabiVariableSimple     term=standout   ctermfg=3   guifg=#665050
hi WasabiVariableHungarian  term=standout   ctermfg=3   guifg=#666666
syn match WasabiVariableSimple      contained "\C\<\l\(\l\|\u\|\d\|_\)*\>"
syn match WasabiVariableHungarian   contained "\C\<\(c\|f\|b\|dt\|d\|ix\|n\|s\|rg\|o\|rs\|err\|pg\|pre\|dict\|cmd\|u\|fxn\|col\|api\|instance\|list\)\+\(\u\w*\)*\>"

" Functions and methods that are in VB but will cause errors in an ASP page
" This is helpful if you're porting VB code to ASP
" I removed (Count, Item) because these are common variable names in Wasabi
" Also removed Static, as that is now a valid modifier in Wasabi
syn keyword WasabiError contained Val Str CVar CVDate DoEvents GoSub GoTo
syn keyword WasabiError contained Stop LinkExecute Add Type LinkPoke
syn keyword WasabiError contained LinkRequest LinkSend Declare Optional Sleep
syn keyword WasabiError contained ParamArray Erl TypeOf Like LSet RSet Mid StrConv
" It may seem that most of these can fit into a keyword clause but keyword takes
" priority over all so I can't get the multi-word matches
syn match WasabiError contained "\<Def[a-zA-Z0-9_]\+\>"
syn match WasabiError contained "^\s*Open\s\+"
syn match WasabiError contained "Debug\.[a-zA-Z0-9_]*"
syn match WasabiError contained "^\s*[a-zA-Z0-9_]\+:"
syn match WasabiError contained "[a-zA-Z0-9_]\+![a-zA-Z0-9_]\+"
syn match WasabiError contained "^\s*#.*$"
syn match WasabiError contained "\<End\>\|\<Exit\>"
syn match WasabiError contained "\<On\s\+Error\>\|\<On\>\|\<Error\>\|\<Resume\s\+Next\>\|\<Resume\>"
syn match WasabiError contained "\<Option\s\+\(Base\|Compare\|Private\s\+Module\)\>"
" This one I want 'cause I always seem to mis-spell it.
syn match WasabiError contained "Respon\?ce\.\S*"
syn match WasabiError contained "Respose\.\S*"
" When I looked up the VBScript syntax it mentioned that Property Get/Set/Let
" statements are illegal, however, I have recived reports that they do work.
" So I commented it out for now.
" syn match WasabiError contained "\<Property\s\+\(Get\|Let\|Set\)\>"

" Wasabi Reserved Words.
syn match WasabiStatement contained "\<On\s\+Error\s\+\(Resume\s\+Next\|goto\s\+0\)\>\|\<Next\>"
syn match WasabiStatement contained "\<On\s\+Exit\>"
syn match WasabiStatement contained "\<End\s\+\(If\|Select\|Class\|Interface\|Function\|Sub\|With\|Lambda\|Property\|Try\|Enum\)\>"
syn match WasabiStatement contained "\<Exit\s\+\(Do\|For\|Sub\|Function\|Property\|Select\)\>"
syn match WasabiStatement contained "\<Option\s\+\(Explicit\|Timing\s\+\(Start\|Stop\)\|Using\|Include\|Import\|Default Namespace\)\>"
syn match WasabiStatement contained "\<For\s\+Each\>\|\<For\(\s\+Dim\)\?\>"
syn match WasabiStatement contained "\<Set\>\|\<ReDim\(\s\+Preserve\)\?\>"
syn keyword WasabiStatement contained Call Const Dim Do Loop Erase And Until Optional
syn keyword WasabiStatement contained If Then Else ElseIf Or Lambda ParamArray Shared
syn keyword WasabiStatement contained Private Public Protected Inherits Implements
syn keyword WasabiStatement contained Abstract Internal Static Override Overridable Sealed
syn keyword WasabiStatement contained Global Randomize + - = <= >= <> * & / \
syn keyword WasabiStatement contained Select Case While With Wend Not As New
syn keyword WasabiStatement contained Enum Class Interface Property Get Set Let Default Sub Function
syn keyword WasabiStatement contained Throw Try Catch Finally Global Return

" Wasabi Functions
syn keyword WasabiFunction contained Abs Array Asc Atn CBool CByte CCur CDate CDbl
syn keyword WasabiFunction contained Chr CInt CLng Cos CreateObject CSng CStr Date
syn keyword WasabiFunction contained DateAdd DateDiff DatePart DateSerial DateValue
syn keyword WasabiFunction contained Date Day Exp Filter Fix FormatCurrency
syn keyword WasabiFunction contained FormatDateTime FormatNumber FormatPercent
syn keyword WasabiFunction contained GetObject Hex Hour InputBox InStr InStrRev Int
syn keyword WasabiFunction contained IsArray IsDate IsEmpty IsNull IsNumeric
syn keyword WasabiFunction contained IsObject Join LBound LCase Left Len LoadPicture
syn keyword WasabiFunction contained Log LTrim Mid Minute Month MonthName MsgBox Now
syn keyword WasabiFunction contained Oct Replace RGB Right Rnd Round RTrim
syn keyword WasabiFunction contained ScriptEngine ScriptEngineBuildVersion
syn keyword WasabiFunction contained ScriptEngineMajorVersion
syn keyword WasabiFunction contained ScriptEngineMinorVersion Second Sgn Sin Space
syn keyword WasabiFunction contained Split Sqr StrComp StrReverse String Tan Time Timer
syn keyword WasabiFunction contained TimeSerial TimeValue Trim TypeName UBound UCase
syn keyword WasabiFunction contained VarType Weekday WeekdayName Year Me Mod
syn keyword WasabiFunction contained SByte Int16 Int32 Int64 Byte UInt16 UInt32 UInt64 Single Double Decimal Char Boolean
syn match   WasabiFunction contained "\[\(\w\+\.\)*\w\+\]"

" Wasabi Methods
syn keyword WasabiMethods contained Add AddFolders BuildPath Clear Close Copy
syn keyword WasabiMethods contained CopyFile CopyFolder CreateFolder CreateTextFile
syn keyword WasabiMethods contained Delete DeleteFile DeleteFolder DriveExists
syn keyword WasabiMethods contained Exists FileExists FolderExists
syn keyword WasabiMethods contained GetAbsolutePathName GetBaseName GetDrive
syn keyword WasabiMethods contained GetDriveName GetExtensionName GetFile
syn keyword WasabiMethods contained GetFileName GetFolder GetParentFolderName
syn keyword WasabiMethods contained GetSpecialFolder GetTempName Items Keys Move
syn keyword WasabiMethods contained MoveFile MoveFolder OpenAsTextStream
syn keyword WasabiMethods contained OpenTextFile Raise Read ReadAll ReadLine Remove
syn keyword WasabiMethods contained RemoveAll Skip SkipLine Write WriteBlankLines
syn keyword WasabiMethods contained WriteLine
syn match WasabiMethods contained "OurResponse\.\w*"
syn match WasabiMethods contained "Response\.\w*"
" Colorize boolean constants:
syn keyword WasabiMethods contained True False Nothing Empty

" Wasabi Number Constants
" Integer number, or floating point number without a dot.
syn match  WasabiNumber	contained	"\<\d\+\>"
" Floating point number, with dot
syn match  WasabiNumber	contained	"\<\d\+\.\d*\>"
" Floating point number, starting with a dot
syn match  WasabiNumber	contained	"\.\d\+\>"

" String and Character Contstants
" removed (skip=+\\\\\|\\"+) because VB doesn't have backslash escaping in
" strings (or does it?)
syn region  WasabiString	contained	  start=+"+  end=+"+ keepend
syn region  WasabiString	contained	  start=+<<<+  end=+>>>+ keepend
syn region  WasabiString	contained	  start=+<<\[+  end=+\]>>+ keepend

" Wasabi Comments
syn region  WasabiComment	contained start="^REM\s\|\sREM\s" end="$" contains=WasabiTodo keepend
syn match WasabiComment contained "\(^'\|\s'\).\{-}$" contains=WasabiTodo,WasabiIfDef,HTMLTags
" misc. Commenting Stuff
syn keyword WasabiTodo contained	TODO FIXME UNDONE

" Cosmetic syntax errors commonly found in VB but not in Wasabi
" Wasabi doesn't use line numbers
syn region  WasabiError	contained start="^\d" end="\s" keepend
" Wasabi also doesn't have type defining variables
syn match   WasabiError  contained "[a-zA-Z0-9_][\$&!#]"ms=s+1
" Since 'a%' is a VB variable with a type and in Wasabi you can have 'a%>'
" I have to make a special case so 'a%>' won't show as an error.
syn match   WasabiError  contained "[a-zA-Z0-9_]%\($\|[^>]\)"ms=s+1
" Catch ... When is on the wiki, but not implemented, so mark it as an error.
syn keyword WasabiError contained When

" Top Cluster
syn cluster WasabiTop contains=WasabiStatement,WasabiFunction,WasabiMethods,WasabiNumber,WasabiString,WasabiComment,WasabiError,WasabiVariableHungarian,WasabiVariableSimple,WasabiVariableComplex,WasabiIfDef,WasabiAttribute

" Folding
syn region WasabiFold start="\(^\|:\)\s*\(<[^>]*>\s*\)\=\(\(public\|private\)\s\+\)\=\(abstract\s\+\)\=class\s\+\[\=\w\+" end="\(^\|:\)\s*end\s\+class\>" contains=@WasabiTop,WasabiFold,HTMLTags fold contained keepend extend
syn region WasabiFold start="\(^\|:\)\s*\(<[^>]*>\s*\)\=\(default\s\+\)\=\(\(private\|public\)\s\+\(static\)\=\)\=\(default\s\+\)\=\(sub\|function\|property\s\+\(Get\|Set\|Let\)\)\s\+\w\+" end="\(^\|:\)\s*end\s\+\(function\|sub\|property\)\>" contains=@WasabiTop,HTMLTags fold contained keepend extend

syn region HTMLTags matchgroup=Delimiter start='%>' end='<%\(\s*=\)\=' contained contains=WasabiInsideHtmlTags,@htmlTop

" Define Wasabi delimeters
" <%= func("string_with_%>_in_it") %> This is illegal in ASP syntax.
syn region WasabiInsideHtmlTags keepend matchgroup=Delimiter start=+<%=\=+ end=+%>+ contains=@WasabiTop,WasabiFold
syn region WasabiInsideHtmlTags keepend matchgroup=Delimiter start=+<script\s\+language="\=vbscript"\=[^>]*\s\+runatserver[^>]*>+ end=+</script>+ contains=@WasabiTop

" Synchronization
" syn sync match WasabiSyncGroup grouphere WasabiInsideHtmlTags "<%"
" This is a kludge so the HTML will sync properly
syn sync match htmlHighlight grouphere htmlTag "%>"


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_was_syn_inits")
  if version < 508
    let did_was_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  "HiLink Wasabi		Special
  HiLink WasabiLineNumber	Comment
  HiLink WasabiNumber		Number
  HiLink WasabiError		Error
  HiLink WasabiStatement	Statement
  HiLink WasabiString		String
  HiLink WasabiComment		Comment
  HiLink WasabiTodo		Todo
  HiLink WasabiFunction		Identifier
  HiLink WasabiMethods		PreProc
  HiLink WasabiEvents		Special
  HiLink WasabiTypeSpecifier	Number
  HiLink WasabiIfDef		PreCondit
  HiLink WasabiAttribute	PreProc

  delcommand HiLink
endif

let b:current_syntax = "was"

if main_syntax == 'was'
  unlet main_syntax
endif

" vim: ts=8:sw=2:sts=0:noet
