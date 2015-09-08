"pathogon 插件管理包
execute pathogen#infect()

"语法和缩进
set nocompatible 
filetype on 
syntax on
set hlsearch
filetype plugin indent on

"tab相关设置
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"颜色方案
set t_Co=256
colorscheme desert
set colorcolumn=120

"鼠标所在行高亮
set cursorline
hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

"字符编码设置
set encoding=utf-8                                                              
set fileencoding=utf-8                                                          
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1         
set termencoding=utf-8                                                          
set langmenu=zh_CN.UTF-8                                                        
set laststatus=2
language message zh_CN.UTF-8                                                    

"airline插件设置，bottom状态栏
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_c = '%F'

"vim-dict插件设置
autocmd filetype javascript set dictionary+=~/.vim/bundle/vim-dict/dict/javascript.dic
autocmd filetype css set dictionary+=~/.vim/bundle/vim-dict/dict/css.dic
autocmd filetype php set dictionary+=~/.vim/bundle/vim-dict/dict/php.dic

"nerdTree插件设置
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

"lubanr-commenter插件设置，主要是公司名称，作者名称等信息
let g:CompanyName = "Lubanr.com"
let g:AuthorName = "吕宝贵"
let g:AuthorEmail = "lbaogui@lubanr.com"

