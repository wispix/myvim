syntax on
set number
set relativenumber
set clipboard=unnamed
set encoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set bg=dark

let mapleader=" "
inoremap jk <Esc>
nnoremap S :w<CR>
nnoremap Q :q<CR>

nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>\| :split<CR>
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j

set nocompatible "required for vundle
filetype off "required for vundle

"--------------
"--- vundle ---
"--------------
nnoremap <leader>pi :PluginInstall<CR>
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" gruvbox theme
Plugin 'morhetz/gruvbox'
" 浮动终端
Plugin 'voldikss/vim-floaterm'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"---> Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"---> Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"---> Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"--- defx ---
"
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'Shougo/defx.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

colorscheme gruvbox

" --- defx ---

nnoremap <leader>e :Defx<CR>
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
set pyxversion=3
autocmd FileType defx call s:defx_custom_mappings()
function! s:defx_custom_mappings() abort
    " 配置 enter 键功能
    "nnoremap <silent><buffer><expr> <CR> defx#is_directory()? defx#do_action('open_directory') : defx#do_action('drop')

    " 配置 a 键功能：创建新文件夹
    nnoremap <silent><buffer><expr> a defx#do_action('new_directory')

    " s: 创建新文件
    nnoremap <silent><buffer><expr> s defx#do_action('new_file')
    " r: rename
    nnoremap <silent><buffer><expr> r defx#do_action('rename')

    " 配置 d 键功能
    nnoremap <silent><buffer><expr> d defx#do_action('remove')

    " 配置 m 键功能
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    " c: copy
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    " p : paste
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
     
    " 配置 l 键功能
    nnoremap <silent><buffer><expr> l
        \ defx#is_directory()? 
        \ (defx#is_opened_tree()? 
            \ defx#do_action('close_tree') : 
            \ defx#do_action('open_tree')
        \ ) :
        \ defx#do_action('multi', ['drop'])
endfunction

" --- floaterm ---
nnoremap <leader>t :FloatermNew<CR>
