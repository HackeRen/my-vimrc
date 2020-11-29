set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'taglist.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jakwings/vim-colors'
Plugin 'Yggdroot/LeaderF'
Plugin 'Lokaltog/vim-powerline'
Plugin 'hackerenRG/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'majutsushi/tagbar'
Plugin 'a.vim'
Plugin 'ctrlp.vim'
Plugin 'delimitMate.vim'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'zxqfl/tabnine-vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'mbbill/undotree'
Plugin 'farmergreg/vim-lastplace'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'brookhong/cscope.vim'
call vundle#end()            " required

filetype plugin indent on    " required
imap jj <ESC>
imap JJ <ESC>
noremap gd <C-]>
noremap gj <C-]>
noremap gb <C-T>
noremap gb <C-o>

syntax on

"cscope
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <Leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

set lines=45 columns=130 " Configuration file for vim
set modelines=0		" CVE-2007-2438
set tabstop=4

set tags=./tags,../tags/,../../tags,../../../tags,tags,/usr/local/etc/systags
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set nobackup "不需要备份
set undodir=~/.vim/undodir
set undofile
if !isdirectory(&undodir)
	call mkdir(&undodir, 'p', 0700)
endif

au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
au BufWrite /private/etc/pw.* set nowritebackup nobackup

syntax on                       "开启语法高亮

noremap <leader>R :source $MYVIMRC<return>

set wrap
set showcmd
set wildmenu
" set norelativenumber
" set relativenumber              "显示相对行号"
set nu                      	"显示行号 
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条" 
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set cursorline                  "突出显示当前行"
" set cursorcolumn                "突出显示当前列"
set langmenu=zh_CN.UTF-8        "显示中文菜单

set nowrap                      "设置代码不折行"
set fileformat=unix             "设置以unix的格式保存文件"
set cindent                     "设置C样式的缩进格式"
set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
set expandtab 					"转换为空格
set shiftwidth=4                "每一级缩进是多少个空格
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set scrolloff=1                 "距离顶部和底部5行"
set laststatus=2                "命令行为两行"

set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
set noexpandtab                 "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread

" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map ti :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>

"使用F3键快速调出和隐藏它
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1

"显示书签"
let NERDTreeShowBookmarks=1

"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']

"窗口大小"
let NERDTreeWinSize=25

" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 打开vim时自动打开NERDTree
autocmd VimEnter * NERDTree 
wincmd w "自动定位到第一个窗口"
autocmd VimEnter * wincmd w

"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plugin,配置信息如下
"let g:NERDTreeIndicatorMapCustom = {
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ "Unknown"   : "?"
\ }

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1

" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=0

" 分割布局：指定屏幕上可以进行分割布局的区域
set splitbelow               " 允许在下部分割布局
set splitright               " 允许在右侧分隔布局

"let mapleader=" "

" 组合快捷键：
nnoremap <C-J> <C-W><C-J>    " 组合快捷键：- Ctrl-j 切换到下方的分割窗口
nnoremap <C-K> <C-W><C-K>    " 组合快捷键：- Ctrl-k 切换到上方的分割窗口
nnoremap <C-L> <C-W><C-L>    " 组合快捷键：- Ctrl-l 切换到右侧的分割窗口
nnoremap <C-H> <C-W><C-H>    " 组合快捷键：- Ctrl-h 切换到左侧的分割窗口

" taglist 配置
let Tlist_Use_Right_Window = 1          "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1      "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1             "只显示一个文件中的tag，默认为显示多个
"let Tlist_Sort_Type ='name'            "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1   "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32                 "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个

map <Leader>t :TlistToggle<CR>              " 热键设置，我设置成Leader+t来呼出和关闭Taglist

" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'   

" 使indentline生效
let g:indentLine_enabled = 1

" 必须手动输入za来折叠（和取消折叠）
set foldmethod=indent                " 根据每行的缩进开启折叠
set foldlevel=99

" 使用空格键会是更好的选择,所以在你的配置文件中加上这一行命令吧：
nnoremap <space> za

" 希望看到折叠代码的文档字符串？
let g:SimpylFold_docstring_preview=1
" 补全菜单的开启与关闭
set completeopt=longest,menu                    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_min_num_of_chars_for_completion=2             " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_autoclose_preview_window_after_completion=1       " 智能关闭自动补全窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif         " 离开插入模式后自动关闭预览窗口

" 补全菜单中各项之间进行切换和选取：默认使用tab  s-tab进行上下切换，使用空格选取。可进行自定义设置：
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']      " 通过上下键在补全菜单中进行切换
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    " 回车即选中补全菜单中的当前项

" 开启各种补全引擎
let g:ycm_collect_identifiers_from_tags_files=1         " 开启 YCM 基于标签引擎
let g:ycm_auto_trigger = 1                  " 开启 YCM 基于标识符补全，默认为1
let g:ycm_seed_identifiers_with_syntax=1                " 开启 YCM 基于语法关键字补全
let g:ycm_complete_in_comments = 1              " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1               " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 " 注释和字符串中的文字也会被收入补全

" 重映射快捷键
"上下左右键的行为 会显示其他信息,inoremap由i 插入模式和noremap不重映射组成，只映射一层，不会映射到映射的映射
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>           " force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>

nnoremap <leader>md :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处
" map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_confirm_extra_conf=1                  " 关闭加载.ycm_extra_conf.py确认提示

" 将字体设置为Meslo LG S DZ Regular for Powerline 13号大小
"set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h20
language messages zh_CN.utf-8
set helplang=cn 
set ambiwidth=double
" 总是显示状态栏 
let laststatus = 2
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
let g:airline_theme="dark"      " 设置主题
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1      
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
" 设置字体 
set guifont=Powerline_Consolas:h14:cANSI
let g:Powerline_symbols = 'fancy'       " Powerline_symbols为状态栏中的箭头，unicode没有箭头
"let g:Powerline_symbols= 'unicode'

set laststatus=2                " 必须设置为2,否则状态栏不显示
set t_Co=256                    " 开启256颜色之后，colorschema在vim里好看了许多
let g:Powerline_colorscheme='solarized256'  " 状态栏使用了solarized256配色方案

"set fillchars+=stl:\ ,stlnc:\          " 状态栏如果有\\\\\或^^^^^等符号出现，添加此句再删掉此句就好了


" 推荐几种配色，使用哪种只需将其取消注释即可

" 经典的solarized
"colorscheme solarized               " 白色背景
colorscheme breeze " 白色背景

" Tomorrow系列
"colorscheme Tomorrow               " 白色背景
"colorscheme Tomorrow-Night         " 黑色背景,序号看不清
"colorscheme Tomorrow-Night-Bright      " 黑色背景,高对比度，最清晰
"colorscheme Tomorrow-Night-Eighties        " 黑色背景,低对比度

" 其他
"colorscheme desert
"colorscheme molokai
"colorscheme pablo
"colorscheme phd
"colorscheme pablo
"colorscheme slate
"let g:ycm_global_ycm_extra_conf = '/Users/renlanhui/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "##########################################################################")
		call append(line("."), "# File Name: ".expand("%"))
		call append(line(".")+1, "# Author: renlanhui")
		call append(line(".")+2, "# mail: renlanhui@ruijie.com.cn")
		call append(line(".")+3, "# Created Time: ".strftime("%c"))
		call append(line(".")+4, "#########################################################################")
		call append(line(".")+5, "#!/bin/zsh")
		call append(line(".")+6, "")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: renlanhui")
		call append(line(".")+2, "	> Mail: renlanhui@ruijie.com.cn ")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"老板键
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <leader>wq :wq<cr>
nmap <leader>wa :wqa<cr>
noremap <Leader>q :q!<CR>
noremap U 5k
noremap E 5j
noremap W 5w
noremap B 5b
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
inoremap <C-U> <Esc>5<C-y>a
inoremap <C-E> <Esc>5<C-e>a

map S :w<cr>
map Q :q<cr>
map <LEADER>rc :e ~/.vimrc<CR>
noremap = nzz
noremap - Nzz

"窗口切换命令映射
nnoremap <C-TAB> <C-W>w 
inoremap <C-TAB> <C-O><C-W>w 
nnoremap <C-TAB> <C-W>W
inoremap <C-TAB> <C-O><C-W>W
"高亮搜索映射
nnoremap <silent> <F2> :nohlsearch<CR>
inoremap <silent> <F2> <C-O>:nohlsearch<CR>

"少量替换变量
nnoremap <Leader>v viw"0p
inoremap <Leader>v "0p
"tagbar快捷键
nnoremap <F9> :TagbarToggle<CR>
inoremap <F9> <C-O>:TagbarToggle<CR>
"undotree快捷键
nnoremap <F6> :UndotreeToggle<CR>
"会话保存
map <Leader>se :SaveSession! default<CR>
map <Leader>os :OpenSession! default<CR>
let g:session_autoload = 'no'

" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
" 搜索当前单词，依赖 https://github.com/ggreer/the_silver_searcher
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
" 搜索文件
"nnoremap <silent> <c-p> :Files <CR>
"<Leader>f在当前目录搜索文件
"nnoremap <silent> <Leader>f :Files<CR>
nnoremap <Leader>f :Files<CR>
"<Leader>b切换Tags中的
nnoremap <Leader>b :Tags<CR>
"<Leader>b切换Buffer中的文件
" nnoremap <Leader>b :Buffers<CR>
"<Leader>p在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
nnoremap <silent> <Leader>p :Lines<CR>
"<Leader>h在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
nnoremap <silent> <Leader>h :History<CR>
"调用Rg进行搜索，包含隐藏文件
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

let g:session_autosave = 'no'

