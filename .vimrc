""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                    Vim 环境下快捷键说明                                                      |
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F1  ：快速显示桌面                                    " Ctrl + c             视图模式选中单个字符                     |
" F2  ：快速显示Dashboard                               " Ctrl + v             视图模式选中正行                         |
" F3  ：快速切换Nerdtree的开启状态，默认开启            " Command + [          切换tmux窗口                             |
" F4  ：快速切换Tagbar的开启状态，默认关闭              " Command + ]          切换tmux窗口                             |
" F5  ：快速切换indentLine对齐线的开启撞他，默认开启    " Command + n          新打开一个iterm2窗口                     |
" F6  ：快速查看Git修改状态，默认关闭                   " Command + w          关闭一个iterm2窗口                       |
" F7  ：                                                " Command + d          纵向切割iterm2窗口                       |
" F8  ：                                                " Shift + Command + d  横向切割iterm2窗口                       |
" F9  ：                                                " Ctrl + w             切换窗口内分区                           |
" F10 ：                                                " Ctrl + a             命令行切换至行首                         |
" F11 ：快速向左切换buffer，并在当前窗口打开buffer      " Ctrl + e             命令行切换至行尾                         |
" F12 ：快速向右切换buffer，并在当前窗口打开buffer      " Shift + r            刷新nerdtree目录树                       |
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Ctags 使用说明（[...]表示可选）                     |
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1)、在项目根目录执行命令生成标签库：ctags [--languages=php] -R .           |
" 2)、从项目根目录打开要编辑的文件                                           |
" 3)、Ctrl + ] 查找函数主题（光标至于函数名称处）                            |
"     Ctrl + t 返回查找处                                                    |
" 4)、ctags 标签库与 ycm 及 gitv 有冲突：需增加vim对ruby和lua脚本的支持      |
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle 方式管理插件
" => https://github.com/gmarik/Vundle.vim#about
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                        " Vim插件管理包，必须
" Plugin 'altercation/vim-colors-solarized'         " Vim配色方案
" Plugin 'tomasr/molokai'                           " Vim配色方案
Plugin 'scrooloose/nerdtree'                      " 左侧导航目录树
Plugin 'majutsushi/tagbar'                        " 右侧标签目录树
Plugin 'bling/vim-airline'                        " 用于配置美观的底部状态栏
Plugin 'Yggdroot/indentLine'                      " 更加美观的显示缩进对齐线
Plugin 'terryma/vim-multiple-cursors'             " Vim支持多重选取并编辑内容:Ctrl+n
Plugin 'rking/ag.vim'                             " 内容搜索
Plugin 'mileszs/ack.vim'                          " 内容搜索
Plugin 'Raimondi/delimitMate'                     " 用于补全括号和引号
Plugin 'anyakichi/vim-surround'                   " 用于快速切换括号/引号或者标签
Plugin 'ShowTrailingWhitespace'                   " 用于高亮显示行尾空格
Plugin 'tpope/vim-fugitive'                       " 将Git集成在Vim中
Plugin 'airblade/vim-gitgutter'                   " 实时显示git更改
Plugin 'gregsexton/gitv'                          " 查看Git详细提交日志(类似gitk)
Plugin 'tpope/vim-commentary'                     " Vim批量注释工具, 可以注释多行和去除多行注释
Plugin 'mattn/emmet-vim'                          " 用于更加方便的编辑html和css代码
Plugin 'kien/ctrlp.vim'                           " 文件快速搜索插件
Plugin 'dyng/ctrlsf.vim'                          " 仿Sublime的全局搜索插件
Plugin 'Valloric/YouCompleteMe'                   " 代码自动补全
Plugin 'msanders/snipmate.vim'                    " 代码自动完成
" Plugin 'drmingdrmer/xptemplate'                   " 强大的代码片段自动补全
Plugin 'godlygeek/tabular'                        " 必须在vim-markdow前加载
Plugin 'plasticboy/vim-markdown'                  " 设置markdown语法高亮
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'scrooloose/syntastic'                     " 语法检查
Plugin 'stephpy/vim-php-cs-fixer'                 " 支持PSR的PHP代码格式化插件
Plugin 'edsono/vim-matchit'                       " 匹配成对的标签，跳转
Plugin 'easymotion/vim-easymotion'                " 跳转到光标后任意位置
Plugin 'leshill/vim-json'
" Plugin 'sjl/gundo.vim'                            " 编辑文件时光机
" Plugin 'mattn/webapi-vim'
" Plugin 'mattn/Gist-vim'                           " Gist代码片段管理
Plugin 'jwalton512/vim-blade'                     " Laravel blade 模板支持

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 启动自动补全
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动时不显示援助索马里儿童的提示
set shortmess=atI
" 语言设置
set langmenu=zh_CN.UTF-8
" 帮助文件使用中文
set helplang=cn
" 禁用折叠
set nofoldenable
" 设置折叠模式
set foldcolumn=4
" 光标遇到折叠就打开
set foldopen=all
" no bomb 去掉UTF-8的bomb头
set nobomb
" 显示行号
set number
" 设置VIM 历史记录最大值
set history=10000
" 当文件在外部被修改，自动加载
set autoread
" 突出显示当前所在位置
set ruler

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 配色方案
colorscheme desert
" colorscheme solarized
" colorscheme molokai
" 当光标所在行移动到文件顶部或者底部的时候，保持5行距离
set scrolloff=5
" Turn on Wild menu 增强模式中的命令行自动完成操作
set wildmenu
" The commandbar height 总是显示状态行
set cmdheight=2
" 可以在没有保存的情况下切换buffer
set hid
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 搜索忽略大小写
set ignorecase
" 搜索模式包含大写字符时不使用'ignorecase' 选项。只有在输入搜索模式并且打开'ignorecase' 选项时才会使用
set smartcase
" 搜索逐字符高亮
set hlsearch
set incsearch
" 不重绘而执行宏 Don't redraw while executing macros
set nolazyredraw
" 搜索时启用vim的正则规则
set magic
" 显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2
" 去掉输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 在处理未保存或只读文件的时候，弹出确认
set confirm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁止生成临时文件, since most stuff is in svn, git anyway...
set nobackup
" 写入期间也不启用备份文件
set nowritebackup
" 不使用swp文件，注意!错误退出后无法恢复
set noswapfile

" persistent undo 持续撤销
try
    set undodir=~/.vim_runtime/undodir
    set undofile
catch
endtry

"自动保存
set autowrite


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开新行时自动缩进
set autoindent
" 打开新行时智能自动缩进
set smartindent
" 打开C 程序自动缩进
set cindent
" 自动换行
set wrap
" 在空白或标点符号的地方换行，并不会插入EOL
set linebreak
" 是一种 word wrap 的功能，从左起算之固定每行的最大字符宽度。超过此宽度就会自动折行并会插入EOL
set textwidth=500
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 插入模式里: 插入 <Tab> 时使用合适数量的空格
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 设置自动缩进为4个空格
set shiftwidth=4
" 设置制表符(tab键)的宽度为4个空格
set tabstop=4
" 将tab替换为空格
nmap tt :%s/\t/    /g<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related 可视和选择模式下配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>   <Home>
cnoremap <C-E>   <End>
cnoremap <C-P>   <Up>
cnoremap <C-N>   <Down>
cnoremap <C-K>   <C-U>

func! Cwd()
    let cwd = getcwd()
    return "e " . cwd
endfunc

func! DeleteTillSlash()
    let g:cmd = getcmdline()
    if MySys() == "linux" || MySys() == "mac"
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    endif
    if g:cmd == g:cmd_edited
        if MySys() == "linux" || MySys() == "mac"
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        endif
    endif
    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" 绑定F11，快速向左切换buffer
map <F11> :bp<CR>
" 绑定F12，快速向右切换buffer
map <F12> :bn<CR>
" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,300 bd!<cr>

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 启动显示状态行(1),总是显示状态行(2)
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.html :call DeleteTrailingWS()

set guitablabel=%t


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>
map <leader>bb :cd ..<cr>

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive " 可选值 inclusive exclusive
"set selectmode=mouse,key


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 启动vim后输入:NERDTree<Enter>,绑定一个快捷键 列出当前目录文件
map <F3> :NERDTreeToggle<CR>
" 锁定不能通过<F3>关闭
"imap <F3> <ESC> :NERDTreeToggle<CR>
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 设置目录树的宽度
let NERDTreeWinSize = 25
" 显示隐藏文件
let NERDTreeShowHidden=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar 打开标签栏
nmap <F4> :TagbarToggle<CR>
" 设置标签栏的宽度
let g:tagbar_width=25
let g:Tb_MaxSize = 2
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let g:tagbar_compact=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlsf 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ag instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_context = '-B 5 -A 3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indentLine 此插件可以显示缩进对齐线，并设置通过<F5>来控制是否显示
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┊'
map <F5> :IndentLinesToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitgutter 同git diff，可实时展现（git版本控制的）文件中修改的行
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_diff_args = '-w'
let g:gitgutter_avoid_cmd_prompt_on_windows = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 500
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
let g:gitgutter_enabled = 0 " 默认不展示
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 1
let g:gitgutter_override_sign_column_highlight = 1
"nnoremap <leader>gs :GitGutterToggle<CR>
map <F6> :GitGutterToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gitv插件，实现了用Vim查看Git的详细提交信息, 只需要打开Vim执行: gitv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-commentary 可以快速注释与反注释多行内容, 但是它的注释符使用的是 commentstring, 默认是 /* %s */
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual模式下 gc 命令可以注释选中的行
" 普通模式下 gcc 指令可以快速注释一行
" gcu 可以撤销注释
autocmd FileType python,shell,php set commentstring=#\ %s
autocmd FileType mako set cms=##\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" molokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:molokai_original = 1
let g:rehash256 = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline 状态栏插件增强设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_x = '%{strftime("%Y/%m/%d %H:%M:%S")}%'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,xml EmmetInstall
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors 配置：选中后，按下c就可以对单词批量修改了
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key='<C-n>' " 在普通模式下，按下 Ctrl-n 开始进入可视模式并选中光标下的单词，继续按 Ctrl-n 选择下一个相同的单词
let g:multi_cursor_prev_key='<C-p>' " Ctrl-p 往回选一个
let g:multi_cursor_skip_key='<C-x>' " Ctrl-x 则跳过下一个相同单词
let g:multi_cursor_quit_key='<Esc>' " <Esc> 退出


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
let g:syntastic_python_checkers=['pylint']
let g:syntastic_html_checkers=['tidy', 'jshint']
let g:syntastic_ignore_files=['.*\.html$', '.*\.htm$']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<Leader><Leader>'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" youcompleteme.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_min_num_of_chars_for_completion = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snipmate 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_owner = "(c) MainPHP"
let g:snips_author = "yedonghai <yedonghai@mainphp.com>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-json 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-blade 配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = ['datetime', 'javascript']
" Define pairs of Blade directives. This variable is used for highlighting and indentation.
let g:blade_custom_directives_pairs = {
  \   'markdown': 'endmarkdown',
  \   'cache': 'endcache',
  \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"将文本复制到OS X剪贴板中
noremap <leader>y "*y
noremap <leader>yy "*Y
"在粘贴OS X剪贴板中的文本时保留缩进
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

