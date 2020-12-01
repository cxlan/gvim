set nu
set nowrap
set ruler " 显示用户自定义规则
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M:%S\")}   "状态显示格式
set showcmd " 显示快捷CMD命令
set autochdir
" ignorecase
set ic 
" 共享剪切板到Mac 
set clipboard=unnamed 
syntax on

set background=dark
set termguicolors
" let g:materialmonokai_italic=1
" let g:airline_theme='materialmonokai'

set nocompatible              " be iMproved, required
filetype off                  " required

au BufRead,BufNewFile *.go set filetype=go

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/
" cd ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git
" set rtp+=~/.vim/bundle/
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
" Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Tabular'
Plugin 'posva/vim-vue'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
" PHP Autocomplete plugin
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-laravel'
" Plugin 'm2mdas/phpcomplete-extended-symfony'

Plugin 'Valloric/YouCompleteMe'

" Laravel & Lumen Plugins
Plugin 'tpope/vim-dispatch'             "| Optional
Plugin 'tpope/vim-projectionist'        "|
Plugin 'noahfrederick/vim-composer'     "|
Plugin 'noahfrederick/vim-laravel'
Plugin 'jwalton512/vim-blade'
Plugin 'vim-airline/vim-airline'

"airline config
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Plugin 'roxma/nvim-completion-manager'  "|
" if !has('nvim')
"     Plugin 'roxma/vim-hug-neovim-rpc'
" endif

Plugin 'wdalmut/vim-phpunit.git'
Plugin 'Jimeno0/vim-chito', {'rtp': 'vim/'}
"
" autocmd  FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:phpcomplete_index_composer_command='composer dumpautoload --optimize'
" PHP Autocomplete plugin
"
" scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tasn/vim-tsx'
" Wordpress Plugin
Plugin 'dsawardekar/wordpress.vim'
Plugin 'scrooloose/nerdcommenter'
" git pluging
Plugin 'junegunn/gv.vim'
"
" ...
call vundle#end()
" Jsx configuration
try
    " 自动查找文件夹文件配置
    set runtimepath^=~/.vim/bundle/ctrlp.vim
    " 注释的时候自动加个空格, 强迫症必配
    let g:NERDSpaceDelims=1
catch
endtry

let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
try
    " colorscheme material-monokai
    colorscheme chito
catch
    colorscheme desert
endtry
"let g:ycm_python_binary_path = '/usr/bin/python'
"let g:ycm_server_python_interpreter = '/usr/bin/python'
"
"" 自动补全配置
let g:ycm_complete_in_comments = 1 "在注释中自动补全
let g:ycm_complete_in_strings = 1 "在字符串输入也能补全
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostaics_ui = 0
" 跳转到定义处，分屏打开
let g:ycm_goto_buffer_command = 'horizontal-split'
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" F2取消高亮
nmap <F2> :nohlsearch<CR>:echo <CR>
" F3删掉windows换行符^M
nmap <F3> :%s/\r\(\n\)/\1/g<CR>:echo <CR>
" F4高亮当前光标所在列
nmap <F4> :call SetColorColumn()<CR>:echo <CR>
function! SetColorColumn()
    let col = virtcol(".")
    let ccs = split(&cc,',')
    if count(ccs, string(col)) <= 0
        let op = "+"
    else
        let op = "-"
    endif
    exec "set cc".op."=".col
endfunction
" F5 打开NERDTree
nmap <F5> :NERDTreeToggle<CR>
" F7 打开当前文件所在目录
nmap <F7> :NERDTreeFind<CR>

""设置缩进 
set shiftwidth=4
set sts=4
set tabstop=4       " 统一缩进4个空字符
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4

set noswapfile
set encoding=utf-8
set fileencoding=utf-8

set cursorline

"---------------------------------------------------------------------------
" 括号自动补全
" http://www.linuxgem.org/tip/bracket-auto-closing-in-vim.html
"---------------------------------------------------------------------------
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR> 
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


" 保存只读文件
cnoremap sw w !sudo tee % >/dev/null
