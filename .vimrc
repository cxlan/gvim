set nu
set nowrap
set autochdir
" ignorecase
set ic 
" 共享剪切板到Mac 
set clipboard=unnamed 
syntax on

set background=dark
set termguicolors
try
    " colorscheme material-monokai
    colorscheme chito
catch
    colorscheme desert
endtry
let g:materialmonokai_italic=1
let g:airline_theme='materialmonokai'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/
" cd ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'gmarik/vundle'

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
Bundle 'Shougo/vimproc'
Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-laravel'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
Plugin 'Valloric/YouCompleteMe'

" Laravel & Lumen Plugins
Plugin 'jwalton512/vim-blade'
Plugin 'tpope/vim-dispatch'             "| Optional
Plugin 'tpope/vim-projectionist'        "|
Plugin 'roxma/nvim-completion-manager'  "|
Plugin 'noahfrederick/vim-composer'     "|
Plugin 'noahfrederick/vim-laravel'
if !has('nvim')
    Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'wdalmut/vim-phpunit.git'
"
" autocmd  FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
" let g:phpcomplete_index_composer_command='composer dumpautoload --optimize'
" PHP Autocomplete plugin
"
" scripts not on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" ...
call vundle#end()

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

"F3 打开NERDTree
nmap <F3> :%s/\r\n/\r/g<CR>
"F5 打开NERDTree
nmap <F5> :NERDTreeToggle<CR>
"" F7 打开当前文件所在目录
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

" 保存只读文件
cnoremap sw w !sudo tee % >/dev/null
