"""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""
function! Blade(...)
    let l:old_makeprg = &makeprg
    setlocal makeprg=blade
    execute "make " . join(a:000)
    let &makeprg=old_makeprg
endfunction
command! -complete=dir -nargs=* Blade call Blade('<args>')
""""""""""""""vimrc config set""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""
set nobackup       " no backup files
set noswapfile     " no swap files
set nowritebackup  " only in case you don't want a backup file while editing
set noundofile     " no undo files
" => General Options "{{{ 
"set guifont=DejaVu\ Sans\ YuanTi\ Mono\ 10
" Session 
set sessionoptions-=curdir
set sessionoptions+=sesdir

" 高亮当前行
"set cursorline
set nocursorcolumn

" 使用非兼容模式
set nocompatible  

" 设置文字编码自动识别
"set fencs=utf-8,gb18030 
set fencs=utf-8

" 有关搜索的选项
set hls
set incsearch   
"set ic smartcase 

" 输入的命令显示出来
set showcmd

" 历史记录行数
set history=200

" 当文件在外部被修改时，自动读取
set autoread 

" 一直启动鼠标
"set mouse=a

" 设置mapleader
let mapleader = ";"
let g:mapleader = ";"

" 快速重载vim配置文件
map <leader>s :w<cr>:source ~/.vimrc<cr> 
map <leader>e :e! ~/.vimrc<cr>

" 快速重载bash_profile配置文件
map <leader>f :w<cr>:source ~/.bash_profile<cr> 
map <leader>a :e! ~/.bash_profile<cr>

" 当.vimrc被修改时，重载之
autocmd! bufwritepost vimrc source ~/.vimrc 

" 自动跳转到上一次打开的位置
autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\ exe "normal! g'\"" |
			\ endif 


"}}} 
" => Colors and Fonts "{{{ 
set t_Co=256
" 语法高亮
syntax on

" 字体
set gfn=Vera\ Sans\ YuanTi\ Mono:h10
"set gfn=Droid\ Sans\ Fallback:h10

" GUI
"if has("gui_running")
	"set guioptions-=T
	"let psc_style='cool'
"endif 

if has('gui_running')
    set background=light
else
    set background=dark
endif
"}}}
" => other UI options"{{{
" Tab缩进
set smarttab
set tabstop=4 
set expandtab 

" 自动缩进 
set smartindent 
set shiftwidth=4
set autoindent 
set cindent 
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

" 显示行号
set number 

" 显示光标位置 
set ruler 

" wild菜单 
set wildmenu 

" 上下移动时，留3行
set so=3

" set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" set magic on 
set magic 

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" 括号匹配
set showmatch 

" How many tenths of a second to blink
set mat=2

" 状态栏 使用airline这个废弃
""set laststatus=2
""function! CurDir()
""	let curdir = substitute(getcwd(), '/home/peter', "~/", "g")
""	return curdir
""endfunction
""set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 


" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 命令窗口大小
set cmdheight=1
"}}}
" => Files "{{{
" 文件编码 
"set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big-5,ucs,latin1
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big-5,ucs,latin1
set termencoding=utf-8
set encoding=utf-8

" 启动文件类型插件
filetype on 
filetype plugin on 
filetype indent on 

" 文件类型
set ffs=unix,dos
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" 不备份文件
set nobackup
set nowritebackup
"}}}
" => MISC"{{{
"}}}
" => Plugins "{{{
" 自动完成 
set completeopt=longest,menu

" for taglist
nmap <F10> :TlistToggle <CR> 
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1 
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim

nmap <F9> :NERDTreeToggle <CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <C-F1> :NERDTreeFind<CR>
"设置NERDTree的宽度,默认为30"
let NERDTreeWinSize=30
"let NERDTreeChDirMode=2  "选中root即设置为当前目录
""let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
"let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头  0传统+-|号

" MiniBufExpl 
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne=0
"解决窗口变小的问题
let g:miniBufExplForceSyntaxEnable=1 
let g:bufExplorerMaxHeight=30

let g:f4=1
nmap <F4> :call Do_switch_F4()<CR> 
"nmap <F4> :MiniBufExplorer<cr> :UMiniBufExplorer<cr>
function! Do_switch_F4()
    if g:f4
        :MiniBufExplorer
        :UMiniBufExplorer
        let g:f4=0
    else
        :CMiniBufExplorer
        let g:f4=1
    endif
endfunction
"nmap <M-F4> :CMiniBufExplorer<cr> 

" SuperTab
noremap <F1> <c-w><c-p>
"noremap <F2> <c-w><c-w>
noremap <C-F2> :cprevious<CR>
noremap <F2> :cnext<CR>
""noremap <F3> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR><c-w><c-l>
noremap <C-F4> :set nu!<CR>:set paste!<CR>


" for AutoComplete
"let g:AutoComplPop_NotEnableAtStartup = 1
"nmap <F10> :AutoComplPopEnable
"nmap <C-F10> :AutoComplPopDisable

" for echofunc
"set tags+=~/.vim/systags 
nmap <M-F9> :!ctags --append=yes -f ~/.vim/systags --fields=+lS
nmap <C-F9> :!ctags -R --fields=+lS
let g:EchoFuncLangsUsed = ["c", "cpp", "java"] 
"}}}
" => DIY的一些语法高亮"{{{
"hi Mark ctermbg=Red ctermfg=Green 
"syntax region unKnown start='???' end='???'
"hi def link unKnown Mark
" Test line:  ??? >...< ???
"match Mark '???'
"}}} 
" => 快捷键"{{{
" Buffer 
set hidden
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bb :b#<cr> 
nmap <leader>bls :buffers<cr>
nmap <leader>b1 :b1<cr>
nmap <leader>b2 :b2<cr>
nmap <leader>b3 :b3<cr>
nmap <leader>b4 :b4<cr>
nmap <leader>b5 :b5<cr>
nmap <leader>b6 :b6<cr>
nmap <leader>b7 :b7<cr>
nmap <leader>b8 :b8<cr>
nmap <leader>b9 :b9<cr> 
nmap <leader>c  :q<cr>

noremap <F6> :bp<cr>
noremap <F7> :bn<cr
nnoremap <S-F6> :bd#<CR>

""nmap <F3> :vimgrep <cword> **/*.cpp **/*.h<cr> :copen <cr>
"nmap <F3> mZ :grep -Rn <cword> **/*.cpp **/*.c **/*.h **/*.java 2>/dev/null<cr><cr> :copen <cr>
"nmap <F3> mZ :grep -Rn <cword> ./ 2>/dev/null<cr><cr> :copen <cr> 

set grepformat=%f:%l:%m
"set grepprg=


"}}}

set tags=tags;
set autochdir

"ADD zero ling
"nmap <silent> to :call append('.', '')<CR>j
"nmap <silent> tO :call append(line('.')-1, '')<CR>k
"to 光标下插入空白行，并跳动空白行，tO则在光标上插入
nnoremap to :<C-u>call <SID>InsertEmptyLines('o')<CR>
nnoremap tO :<C-u>call <SID>InsertEmptyLines('O')<CR>

function! s:InsertEmptyLines(op)
if a:op == 'o'
    exe 'normal! ' . v:count1 . "o\<Esc>"
else
    exe 'normal! ' . v:count1 . "O\<Esc>"
    if v:count1 > 1
        exe 'normal! ' . (v:count1-1) . 'k'
    endif
endif
endfunction
"tt在光标下插入空白行，光标不动，ta在光标上插入一行
map tt o<Esc>k 
map ta O<Esc>j

"Ctrl+<F12>自动保存并更新tags
"map <C-F12> :wa<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F12> :wa<CR>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"   假如’cscopetag’被设置，然后诸如”:tag”和ctrl+]和”vim
"   -t”等命令会始终使用|:cstag|而不是默认的:tag行为。通过设置’cst’，你将始终同时查找cscope数据库和tags文件。默认情况是关闭的，
":set cst  
set nocst
"csto’的值决定了|:cstag|执行查找的顺序。假如’csto’被设置为0，那么cscope数据将会被优先查找，假如cscope没有返回匹配项，然后才会查找tag文件。反之，则查找顺序相反。默认值是0
"set csto=1
map <F12> :call Do_CsTag()<CR>
nmap <C-x>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-x>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-x>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-x>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-x>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-x>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-x>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-x>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function! Do_CsTag()
"let dir = getcwd()
"使用绝对路径
let dir = getpwd()
if filereadable("tags")
    if(g:iswindows==1)
        let tagsdeleted=delete(dir."\\"."tags")
    else
        let tagsdeleted=delete("./"."tags")
    endif
    if(tagsdeleted!=0)
        echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
        return
    endif
endif

if has("cscope")
    silent! execute "cs kill -1"
endif

if filereadable("cscope.files")
    if(g:iswindows==1)
        let csfilesdeleted=delete(dir."\\"."cscope.files")
    else
        let csfilesdeleted=delete("./"."cscope.files")
    endif
    if(csfilesdeleted!=0)
        echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
        return
    endif
endif

if filereadable("cscope.out")
    if(g:iswindows==1)
        let csoutdeleted=delete(dir."\\"."cscope.out")
    else
        let csoutdeleted=delete("./"."cscope.out")
    endif
    if(csoutdeleted!=0)
        echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
        return
    endif
endif

if(executable('ctags'))
    "silent!  execute !ctags -R --c-types=+p --fields=+S *"
    silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
endif

if(executable('cscope') && has("cscope") )
    if(g:iswindows!=1)
        silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
    else silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files" 
    endif
    silent! execute "!cscope -b"
    execute "normal :"

    if filereadable("cscope.out")
        execute "cs add cscope.out"
    endif
endif
endfunction
"设置一键编译
map <F6> :wa<CR> :make clean<CR> :make all<CR>
"自动补全
if has("autocmd")
filetype plugin indent on
" 括号自动补全
func! AutoClose()
    :inoremap ( ()<ESC>i
    :inoremap " ""<ESC>i
    :inoremap ' ''<ESC>i
    :inoremap { {}<ESC>i
    :inoremap [ []<ESC>i
    :inoremap ) <c-r>=ClosePair(')')<CR>
    :inoremap } <c-r>=ClosePair('}')<CR>
    :inoremap ] <c-r>=ClosePair(']')<CR>
endf
func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=80
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
augroup END
" Auto close quotation marks for PHP, Javascript, etc, file
au     FileType php,javascript,c,cpp exe AutoClose()
endif
"
set shortmess=atI
"ctags 加入系统头文件：ctags -I __THROW --file-scope=yes --langmap=c:+.h
"--languages=c,c++ --links=yes --c-kinds=+p --fields=+S  -R -f ~/.vim/systags
"/usr/include /usr/local/include
set tags+=/data1/pengzhangjie/bigfiles/tags
set tags+=/root/github/Cplusplus/tags
"加入C++库头文件
set path+=/usr/local/include/
set path+=/usr/local/include/c++/4.9.2/
set path+=/home/pengzhangjie/workspace/fts/trunk/blade_root/thirdparty/
set path+=/home/pengzhangjie/workspace/fts/trunk/blade_root/app_common/
set path+=.
set autoindent 
set smartindent
" auto completion 设置自动补齐 
filetype plugin indent on 
set completeopt=longest,menu 
if has("autocmd") && exists("+omnifunc") 
autocmd Filetype * 
            \ if &omnifunc == "" | 
            \   setlocal omnifunc=syntaxcomplete#Complete | 
            \ endif 
endif 
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
"Shift-Insert 快捷键在粘帖系统剪贴板中的内容
inoremap <S-Insert><ESC>:setl paste<CR>gi<C-R>+<ESC>:setl nopaste<CR>gi
"新建标签  
map <M-F2> :tabnew<CR>  
""列出当前目录文件  
"map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F5编译运行
map <F5> :make clean<CR>:make all<CR>
""map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "! ./%<"
elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "! ./%<"
elseif &filetype == 'java' 
    exec "!javac %" 
    exec "!java %<"
elseif &filetype == 'sh'
    :!./%
endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
exec "w"
exec "!g++ % -g -o %<"
exec "!gdb ./%<"
endfunc
"set fold
" 基于缩进或语法进行代码折叠
" "set foldmethod=indent
set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
set nofoldenable
" " za 打开/关闭当前折叠
" " zA 循环地打开/关闭当前折叠
" " zo 打开当前折叠
" " zc 关闭当前折叠
" " zM 关闭所有折叠
" " zR 打开所有折叠
set foldmethod=syntax
set foldlevel=200
"ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__
"--file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p
"--c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags /usr/include/*
"/usr/include/sys/* /usr/include/bits/*  /usr/include/netinet/*
"/usr/include/arpa/* /usr/include/boost/* /usr/include/c++/*

set path+=/root/github/Cplusplus/OpenSourceProject/muduo
set path+=/root/github/Cplusplus/include
" vundle {
" 如果在windows下使用的话，设置为
set rtp+=$HOME/.vim/bundle/vundle/
"let Vundle manage Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
""Bundle 'UltiSnips'
""Bundle 'fholgado/minibufexpl.vim'  "这个插件开关插件不正常
Bundle 'minibufexpl.vim'
Bundle 'echofunc.vim'
Bundle 'chusiang/vim-sdcv'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
"Plugin 'jeaye/color_coded'
Plugin 'rdnetto/YCM-Generator'
Plugin 'mileszs/ack.vim'
Plugin 'a.vim'
Plugin 'taglist.vim'
Bundle 'gg/python.vim'
Bundle 'xml.vim'
Plugin 'edkolev/tmuxline.vim'
Bundle 'fatih/vim-go'
Bundle 'solarnz/thrift.vim'
Bundle 'uarun/vim-protobuf'
Bundle 'Shougo/vimshell.vim'
Bundle 'klen/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Bundle 'SirVer/ultisnips'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
"Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'magic-dot-files/TagHighlight'
"Bundle 'tpope/vim-unimpaired'


"klen/python-mode
" Pathogen load
"filetype off
"call pathogen#infect()
"call pathogen#helptags()


"--------------vim-go
set nocompatible              " be iMproved, required
filetype off                  " required

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin indent on
syntax on

"let g:airline#extensions#hunks#enabled=1
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#fnamemod = ':t'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1 
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.space = "\ua0"
" Let airline do the work
set noshowmode
let g:airline#extensions#tabline#buffer_min_count =2

let g:airline_symbols.space = "\ua0"
let g:airline_exclude_filename = []
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=0
let Powerline_symbols='fancy'
let g:bufferline_echo=0
set laststatus=2
set linespace=0


  " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"let g:airline_section_z='%3p%% %#__accent_bold#%#__accent_yellow#%4l%#__restore__#:%3v'''

  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"  "let g:airline_symbols.linenr = '¶'
"  let g:airline_symbols.paste = 'ρ'
"  "let g:airline_symbols.paste = 'Þ'
"  "let g:airline_symbols.paste = '∥'
"  let g:airline_symbols.whitespace = 'Ξ'
"Mapping for quick search word."
nmap <leader>w :call SearchWord()<CR>
"Bundle 'bufexplorer.zip'
"安装插件
":BundleInstall 
"清理插件
":BundleList         -列举列表(也就是.vimrc)中配置的所有插件
":BundleInstall      -安装列表中的全部插件
":BundleInstall!     -更新列表中的全部插件
":BundleSearch foo   -查找foo插件
":BundleSearch! foo  -刷新foo插件缓存
":BundleClean        -清除列表中没有的插件
":BundleClean!       -清除列表中没有的插件

"syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/','/root/muduo/muduo']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"whether to show balloons
let g:syntastic_enable_balloons = 1
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"...
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" " 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>
" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" " 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>
"YCM set
" YCM 补全菜单配色
" " 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" " 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_tag_files=1 
let g:ycm_global_ycm_extra_conf = '/home/pengzhangjie/.ycm_extra_conf.py'
" " 引入 C++ 标准库tags
set tags+=~/.vim/systags 
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1
" 开启 YCM 标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
set tags+=/usr/include/c++/4.4.7/stdcpp.tags
"OmniCppComplete 的默认补全快捷键为 <C-x><C-o>，不太方便，我重新设定为
"<leader>;
inoremap <leader>; <C-x><C-o>
"基于语义的代码导航
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"自动添加文件头信息"
"
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."),"\#########################################################################")
        call append(line(".")+1, "\# Author: pzhjie(http://pzhjie.com pzhjie@gmail.com)")
        call append(line(".")+2, "\# Created Time: ".strftime("%c"))
        call append(line(".")+3, "\# File Name: ".expand("%"))
        call append(line(".")+4, "\# Description: ")
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."),    "     All rights reserved .")
        call append(line(".")+1,  "     ")
        call append(line(".")+2,  "     Author:\t\tpengzj")
        call append(line(".")+3,  "     Created Time:\t".strftime("%c"))
        call append(line(".")+4,  "     File Name:\t\t".expand("%"))
        call append(line(".")+5,  "     Description:\t")
        call append(line(".")+6,  "     Last Modified:\t".strftime("%c"))
        call append(line(".")+7,  "     ")
        call append(line(".")+8,  "     History: ")
        call append(line(".")+9,  "     <table>")
		call append(line(".")+10, "     Revision	Author			Date		Description")
		call append(line(".")+11, "     --------	------			----		-----------")
        call append(line(".")+12, "     </table>")
        call append(line(".")+13, " ************************************************************************/")
    endif
endfunction

"autocmd BufNewFile *.py,*.cc,*.sh,*.java,*.h,*.hpp,*.cpp exec ":call SetTitle()"

" modify the last modified time of a file
function! SetLastModifiedTime(lineno)
    let modif_time = strftime('%a %b %d %H:%M:%S %Y', getftime(bufname('%')))
    let modif_time = strftime("%c")
    if a:lineno == "-1"
        let line = getline(8)
    else
        let line = getline(a:lineno)
    endif    
    "如果找不到Last Modified就直接退出，不更新文件头"
    if -1==stridx(line, 'Last Modified') 
        return 
    endif
    if line =~ '^////\sLast Modified'
        let line = substitute( line,':\s\+.*\d\{4\}', ':'.modif_time, "" )
    else
        let line = '     Last Modified: '.modif_time
    endif
    if a:lineno == "-1"
        call setline(8, line)
    else
        call append(a:lineno, line)
    endif
endfunction

"""''""'''')''"""")"
" map the SetLastModifiedTime command automatically
au BufWrite *.py,*.java,*.h,*.cpp,*.hpp call SetLastModifiedTime(-1)


" 设置vim的本色方案
syntax enable
set background=dark
"set background=light
"colorscheme wombat
"colorscheme desert
""colorscheme molokai
colorscheme solarized
set guifont=Source_Code_Pro_Light:h13

"快速注释"
" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>
"使用 /something 查找
"使用 cs 替换第一个，然后按 <Esc> 键
"使用 n.n.n.n.n. 查找以及替换余下匹配项

"复制与粘贴
"windows下字体显示问题导致airline特殊符号无法显示
"STL与系统函数 高亮未验证
"同一个文件多次打开，会产生多个缓冲，并相互影响
"Ack.vim主要用来在项目里全局搜索某个单词,比如搜索函数名的时候.
"rking/ag.vim"
"mileszs/ack.vim
"imap <C-I> <Esc> 绑定esc键
"map! <C-\> <ESC>:q<CR>退出文件 
"查看文件位置快捷键
nnoremap <leader>po 1<C-G>
nnoremap <leader>install :PluginInstall<CR>
nnoremap <leader>se :Ack -i <C-W> <CR>
"切换粘贴模式
set runtimepath^=~/.vim/bundle/ag

"重启ycm"
nnoremap <leader>re :YcmRestartServer<CR>
" vp doesn't replace paste buffer
"form http://blog.jobbole.com/87481/"---------有问题不能工作
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  ""return "p@=RestoreRegister()<CR>"
  call RestoreRegister()
  return "p@"
endfunction
vmap <silent> <expr> p <sid>Repl()
"需要增加重构插件，全局替换"
"
let g:projectA_path="/home/pengzhangjie/src/blade_root/app_projects"

"ack.vim 全局搜索--ignore-file
nmap <F3> :Ack --nosmart-case <cword> /home/pengzhangjie/src/blade_root/app_projects . <cr>
