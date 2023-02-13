""""""""""""""""""""""""""""""""""""""""""""
" Vundle configuration
""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins on GitHub
" Plugin 'tpope/vim-fugitive'
" Plugin 'Shougo/deoplete.nvim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'fatih/vim-go'
Bundle 'uarun/vim-protobuf'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'neoclide/coc.nvim'

" Plugins on Vim repo
Bundle 'SuperTab'
Bundle 'solarnz/thrift.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" Get out of VI's compatible mode..
"--------------------------------------------------------------------
set nocompatible

"--------------------------------------------------------------------
" Sets how many lines of history VIM has to remember
"--------------------------------------------------------------------
set history=700

"--------------------------------------------------------------------
" Enable filetype plugin
"--------------------------------------------------------------------
" filetype on
filetype plugin on
filetype indent on

"--------------------------------------------------------------------
" Set to auto read when a file is changed from the outside
"--------------------------------------------------------------------
set autoread

"--------------------------------------------------------------------
" Have the mouse enable all the time:
"
" vimrc_example.vim says "In many terminal emulators
" the mouse works just fine, thus enable it.", but I
" find this setting is a real evil in some terminal!
"--------------------------------------------------------------------
"set mouse=a

"--------------------------------------------------------------------
" Set mapleader
"
" ',' is easy to touch.
"--------------------------------------------------------------------
let mapleader = ","
let g:mapleader = ","

"--------------------------------------------------------------------
" Set fold
"
" setl fen (setlocal foldenable)
"--------------------------------------------------------------------
set foldenable
set fdm=manual

" Special for c,cpp source code
"au FileType c,cpp setl fdm=syntax | setl fen | setl foldnestmax=1
"au FileType c,cpp setl fdm=syntax | setl fen

" Remember fold view when close file
"au BufWinLeave * silent mkview
"au BufWinEnter * silent loadview

""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" Set terminal color to 256, if you want use gvim color scheme
" Need plugin CSApprox
"--------------------------------------------------------------------
"set t_Co=256

"--------------------------------------------------------------------
" Use other color scheme
" If you work under terminal,use plugin CSApprox and set color to 256
"--------------------------------------------------------------------
"colo desertEx
"colo vividchalk
set background=dark
"colorscheme solarized

"--------------------------------------------------------------------
" Font
"--------------------------------------------------------------------
"set guifont=fixsys:h12:cANSI
"set guifont=Consolas:h14
"set guifont=Courier_New:h11:cANSI

"--------------------------------------------------------------------
" Enable syntax hl
"--------------------------------------------------------------------
syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""
" VIM usrinterface
""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" Set 7 lines to the curors - when moving vertical..
"--------------------------------------------------------------------
set so=7

"--------------------------------------------------------------------
" When calling commands such as p,y, put contents
" into system clipboard
"--------------------------------------------------------------------
set clipboard+=unnamed 

"--------------------------------------------------------------------
" Make sure it can save viminfo
"--------------------------------------------------------------------
set viminfo+=!         

"--------------------------------------------------------------------
" Turn on Wild menu
"--------------------------------------------------------------------
set wildmenu

"--------------------------------------------------------------------
" Always show current position
"--------------------------------------------------------------------
set ruler

"--------------------------------------------------------------------
" The commandbar is 2 high
"--------------------------------------------------------------------
set cmdheight=2

"--------------------------------------------------------------------
" Show line number
"--------------------------------------------------------------------
set nu

"--------------------------------------------------------------------
" Show matching bracets
"--------------------------------------------------------------------
set showmatch

"--------------------------------------------------------------------
" 1. Add <> pattern match for HTML
" 2. Add =,; pattern match for languages like c, c++,java
"--------------------------------------------------------------------
au FileType html,xml set mps+=<:>
au FileType c,cpp,cc,java set mps+==:;

"--------------------------------------------------------------------
" Hightlight search things
"--------------------------------------------------------------------
set hlsearch

"--------------------------------------------------------------------
" Increase Search
"--------------------------------------------------------------------
set incsearch

"--------------------------------------------------------------------
" Not wrap scan
"--------------------------------------------------------------------
set nowrapscan

"--------------------------------------------------------------------
" Set backspace
"--------------------------------------------------------------------
"set cursorline
set backspace=eol,start,indent
set matchpairs+=<:>

"--------------------------------------------------------------------
" Set colorcolumn
"--------------------------------------------------------------------
"set colorcolumn=100 " The code width line
"highlight ColorColumn ctermbg=DarkGray guibg=LightGray
"highlight clear SpellBad
"highlight SpellBad cterm=underline,italic gui=underline,italic

"--------------------------------------------------------------------
" Allow the left and right arrow keys, as well as h and l,
" to wrap when used at beginning or end of lines.
"--------------------------------------------------------------------
"set whichwrap+=<,>,h,l,[,]

"--------------------------------------------------------------------
" Format the statusline
"
" Some of the settings list below:
" %F                    file name
" %m                    file edit status
" %r                    readonly flag
" %Y                    file type
" %{&fileformat}        file encoding
" %b                    current cursor char ASCII code
" %B                    current cursor char hex code
" %l                    line number
" %c                    column number
" %V                    virtual column number
" %p                    line number percent
" %%                    percent
" %L                    total line number
"--------------------------------------------------------------------
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

"--------------------------------------------------------------------
" If display the status line for the last window
"
" 0: Never
" 1: Only when there are at least two windows
" 2: Always
"--------------------------------------------------------------------
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""
"Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""
set nobackup

"""""""""""""""""""""""""""""""""""""""""""""""
" Buffer related
"""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" viminfo setting
"--------------------------------------------------------------------
"       !       When included, save and restore global variables that start
"               with an uppercase letter, and don't contain a lowercase
"               letter.  Thus "KEEPTHIS and "K_L_M" are stored, but "KeepThis"
"               and "_K_L_M" are not.  Nested List and Dict items may not be
"               read back correctly, you end up with an empty item.
"
"       "       Maximum number of lines saved for each register.  Old name of
"               the '<' item, with the disadvantage that you need to put a
"               backslash before the ", otherwise it will be recognized as the
"               start of a comment!
"
"       %       When included, save and restore the buffer list.  If Vim is
"               started with a file name argument, the buffer list is not
"               restored.  If Vim is started without a file name argument, the
"               buffer list is restored from the viminfo file.  Buffers
"               without a file name and buffers for help files are not written
"               to the viminfo file.
"               When followed by a number, the number specifies the maximum
"               number of buffers that are stored.  Without a number all
"               buffers are stored.
"
"       '       Maximum number of previously edited files for which the marks
"               are remembered.  This parameter must always be included when
"               'viminfo' is non-empty.
"               Including this item also means that the jumplist and the
"               changelist are stored in the viminfo file.
"
"       /       Maximum number of items in the search pattern history to be
"               saved.  If non-zero, then the previous search and substitute
"               patterns are also saved.  When not included, the value of
"               'history' is used.
"
"       :       Maximum number of items in the command-line history to be
"               saved.  When not included, the value of 'history' is used.
"
"       <       Maximum number of lines saved for each register.  If zero then
"               registers are not saved.  When not included, all lines are
"               saved.  '"' is the old name for this item.
"               Also see the 's' item below: limit specified in Kbyte.
"
"       @       Maximum number of items in the input-line history to be
"               saved.  When not included, the value of 'history' is used.
"
"       c       When included, convert the text in the viminfo file from the
"               'encoding' used when writing the file to the current
"               'encoding'.  See viminfo-encoding.
"
"       f       Whether file marks need to be stored.  If zero, file marks ('0
"               to '9, 'A to 'Z) are not stored.  When not present or when
"               non-zero, they are all stored.  '0 is used for the current
"               cursor position (when exiting or when doing ":wviminfo").
"
"       h       Disable the effect of 'hlsearch' when loading the viminfo
"               file.  When not included, it depends on whether ":nohlsearch"
"               has been used since the last search command.
"
"       n       Name of the viminfo file.  The name must immediately follow
"               the 'n'.  Must be the last one!  If the "-i" argument was
"               given when starting Vim, that file name overrides the one
"               given here with 'viminfo'.  Environment variables are expanded
"               when opening the file, not when setting the option.
"
"       r       Removable media.  The argument is a string (up to the next
"               ',').  This parameter can be given several times.  Each
"               specifies the start of a path for which no marks will be
"               stored.  This is to avoid removable media.  For MS-DOS you
"               could use "ra:,rb:", for Amiga "rdf0:,rdf1:,rdf2:".  You can
"               also use it for temp files, e.g., for Unix: "r/tmp".  Case is
"               ignored.  Maximum length of each 'r' argument is 50
"               characters.
"
"       s       Maximum size of an item in Kbyte.  If zero then registers are
"               not saved.  Currently only applies to registers.  The default
"               "s10" will exclude registers with more than 10 Kbyte of text.
"               Also see the '<' item above: line count limit.
"
"--------------------------------------------------------------------
"       Example:
"           :set viminfo='50,<1000,s100,:0,n~/vim/viminfo
"
"       '50             Marks will be remembered for the last 50 files you
"                       edited.
"       <1000           Contents of registers (up to 1000 lines each) will be
"                       remembered.
"       s100            Registers with more than 100 Kbyte text are skipped.
"       :0              Command-line history will not be saved.
"       n~/vim/viminfo  The name of the file to use is "~/vim/viminfo".
"       no /            Since '/' is not specified, the default will be used,
"                       that is, save all of the search history, and also the
"                       previous search and substitute patterns.
"       no %            The buffer list will not be saved nor read back.
"       no h            'hlsearch' highlighting will be restored.
"
"--------------------------------------------------------------------
set viminfo='10,\"100,:20,%,n~/.viminfo

"--------------------------------------------------------------------
" Set cursor back to place where it is when last closing file
"--------------------------------------------------------------------
au BufReadPost * if line("'\"") > 0 | if line("'\"") <= line("$") | exe("norm '\"") | else | exe "norm $" | endif | endif

"""""""""""""""""""""""""""""""""""""""""""""""
" Files and Encodings
"""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" Sets the character encoding used inside Vim.
" It applies to text in the buffers, registers,
" Strings in expressions, text stored in the
" viminfo file, etc.
"--------------------------------------------------------------------
scriptencoding utf-8
set encoding=utf-8

"--------------------------------------------------------------------
" When 'fileencoding' is different from 'encoding', conversion will be
" done when writing the file.  For reading see below.
"
" When 'fileencoding' is empty, the same value as 'encoding' will be
" used (no conversion when reading or writing a file).
"
" Conversion will also be done when 'encoding' and 'fileencoding' are
" both a Unicode encoding and 'fileencoding' is not utf-8.  That's
" because internally Unicode is always stored as utf-8.
"
" WARNING: Conversion can cause loss of information!  When
" 'encoding' is "utf-8" or another Unicode encoding, conversion
" is most likely done in a way that the reverse conversion
" results in the same text.  When 'encoding' is not "utf-8" some
" characters may be lost!
"--------------------------------------------------------------------
"set fileencoding=
"
"--------------------------------------------------------------------
" This is a list of character encodings considered when starting to edit
" an existing file. 
"
" When a file is read, Vim tries to use the first mentioned character encoding. 
" If an error is detected, the next one in the list is tried. 
"
" When an encoding is found that works, 'fileencoding' is set to it. If all fail,
" 'fileencoding' is set to an empty string, which means the value of 'encoding'
" is used.
"
" The special value "ucs-bom" can be used to check for a Unicode BOM
" (Byte Order Mark) at the start of the file.  It must not be preceded
" by "utf-8" or another Unicode encoding for this to work properly.
" An entry for an 8-bit encoding (e.g., "latin1") should be the last,
" because Vim cannot detect an error, thus the encoding is always
" accepted.
"--------------------------------------------------------------------
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" Set smartindent
"--------------------------------------------------------------------
set smartindent

"--------------------------------------------------------------------
" Set autoindent
"--------------------------------------------------------------------
set autoindent

"--------------------------------------------------------------------
" Set C-style indent
"
" :N    Place case labels N characters from the indent of the switch().
"
" gN    Place C++ scope declarations N characters from the indent of the
"       block they are in.  (default 'shiftwidth').  A scope declaration
"       can be "public:", "protected:" or "private:".
"--------------------------------------------------------------------
set cindent
set cinoptions+=g1,:0

" GNU style indenting
"set cinoptions+={2

"--------------------------------------------------------------------
" Nowrap lines
"--------------------------------------------------------------------
set nowrap

"--------------------------------------------------------------------
" Line width and auto line break
"--------------------------------------------------------------------
set lbr
au FileType c,cpp,java,python set tw=100

"--------------------------------------------------------------------
" Tab and space
"--------------------------------------------------------------------
set softtabstop=4
set shiftwidth=4

au FileType go set softtabstop=8
au FileType go set shiftwidth=8

au FileType c,cpp set softtabstop=2
au FileType c,cpp set shiftwidth=2

au BufRead,BufNewFile *.sql,*.html,*.jsp,*.tpl,*.htm set softtabstop=2 shiftwidth=2
"au BufRead,BufNewFile *.js set syntax=jquery
au BufRead,BufNewFile *.textproto set syntax=protobuf

set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""
" Spell check and ctags
"""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------------------------------------------------
" ctags setting
"--------------------------------------------------------------------

set tags=tags;/
"set autochdir

" Call AutoLoadCTagsAndCScope()
" See http://vifix.cn/blog/vim-auto-load-ctags-and-cscope.html
function! AutoLoadCTagsAndCScope()
    let max = 10
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'GTAGS')
            execute 'cs add ' . dir . 'GTAGS ' . glob("`pwd`")
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if filereadable(dir . 'cscope.out')
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf

nmap <leader>ct :call AutoLoadCTagsAndCScope()<CR>

"--------------------------------------------------------------------
" Spell check
"--------------------------------------------------------------------
"set spell

"""""""""""""""""""""""""""""""""""""""""""""""
" Quick Fix
"""""""""""""""""""""""""""""""""""""""""""""""
"nmap <leader>cn :cn<cr>
"nmap <leader>cp :cp<cr>
"nmap <leader>cw :cw 10<cr>

"""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
"""""""""""""""""""""""""""""""""""""""""""""""

" Select text and search it
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" Windows Ctrl+A
nmap <C-a> ggvG$

" Quick open current file in split window
map <leader>w :sp<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" abbr
iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>

" specifies the key sequence that toggles the 'paste' option.
set pastetoggle=<F9>

"""""""""""""""""""""""""""""""""""""""""""""""
" Auto Complete
"""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu

"--------------------------------------------------------------------
" f: file name auto complete
" l: line auto complete
" d: dict auto complete
" ]: tag auto complete
"--------------------------------------------------------------------
imap <C-]>  <C-X><C-]>
imap <C-F>  <C-X><C-F>
imap <C-D>  <C-X><C-D>
imap <C-L>  <C-X><C-L>

"--------------------------------------------------------------------
" Auto Brackets Complete
"--------------------------------------------------------------------
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

" au:autocmd
au FileType c,cpp,java,go :inoremap " ""<ESC>i
au FileType c,cpp,java,go :inoremap ' ''<ESC>i

"au FileType html,xml :inoremap < <><ESC>i
"au FileType html,xml :inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" --------------------------- tagbar ------------------------------ "
let g:tagbar_compact=1
let g:tagbar_width=30
let g:tagbar_autoshowtag = 1
let g:tagbar_left=1
let g:tagbar_sort=0
let g:tagbar_iconchars = ['+', '>']
" nnoremap <silent> <C-T> :TagbarToggle<CR>
nnoremap <silent> T :TagbarToggle<CR>
"au BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.java,*.go call tagbar#autoopen()

" neocomplete
" let g:neocomplete#enable_at_startup=1
" let g:deoplete#enable_at_startup = 1

" --------------------------- nerdtree ------------------------------ "
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
" nnoremap <silent> <C-F> :NERDTreeToggle<CR>
nnoremap <silent> F :NERDTreeToggle<CR>

" Auto quit NERDTree when vim is quited
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" --------------------------- vim-gutentags ------------------------------ "
" The gutentags is used to auto generate tag, it is still usefull for most,
" as it is quite fast, although the match result maybe wrong at sometimes.
" Usage:
" (1) go to definition of current word: Ctrl-];
" (2) go back: Ctrl-t

let g:gutentags_enabled = 0
augroup auto_gutentags
    au FileType c,cpp,javascript,python,java,scala,sh,groovy,vim let g:gutentags_enabled=1
augroup plug#end

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.repo', '.git']

" gutentags默认工程目录标识为`['.git', '.hg', '.svn', '.bzr', '_darcs', '_darcs', '_FOSSIL_', '.fslckout']`
" gutentags_add_default_project_roots为1（默认为1）时会自动追加到gutentags_project_root
let g:gutentags_add_default_project_roots = 0

let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  'CMakeLists.txt',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.pb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\]

" --------------------------- cpp highlight ------------------------------ "
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 0
let g:cpp_experimental_template_highlight = 0
let g:cpp_concepts_highlight = 0
