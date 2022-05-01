set nu
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set nowb 
set noswapfile 
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

syntax enable 
syntax on 
set cindent
set hlsearch
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
"colorscheme one
"set background=dark " for the dark version

"use ctags to jump
set tags=tags;
set tags+=~/.vim/systags

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:tagbar_ctags_bin = 'ctags'                       "tagbar以来ctags插件
let g:tagbar_left = 0                                          "让tagbar在页面左侧显示，默认右边
let g:tagbar_width = 40                                     "设置tagbar的宽度为30列，默认40
let g:tagbar_autofocus = 0                                "这是tagbar一打开，光标即在tagbar页面内，默认在vim打开的文件内
let g:tagbar_sort = 0                                         "设置标签不排序，默认排序

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
                \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
                \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
            \ }

let g:winManagerWidth = 30
let g:winManagerWindowLayout = "FileExplorer"
"let g:winManagerWindowLayout = "BufExplorer"
"let g:winManagerWindowLayout = "FileExplorer|BufExplorer"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"cscope setting
"set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
       let cscope_file=findfile("cscope.out", ".;")
       let cscope_pre=matchstr(cscope_file, ".*/")
       if !empty(cscope_file) && filereadable(cscope_file)
           exe "cs add" cscope_file cscope_pre
       endif
     endif
endif

"nmap <silent> <F3> :WMToggle<CR>        
"nmap <silent> <F4> :TagbarToggle<CR>        

" move among buffers in vim-airline
map <C-E> :bnext<CR>
map <C-A> :bprev<CR>
map <C-L> :blast<CR>
map <C-H> :bfirst<CR>
map <C-K> :bdelete<CR>
"map <C-N> :WMToggle<CR>
"map <C-M> :TagbarToggle<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> wm :WMToggle<CR>
nnoremap <silent> tb :TagbarToggle<CR>

au VimEnter * WMToggle
au VimEnter *  Tagbar

"nmap wm :WMToggle<cr> 
"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Nerdcomment Create default mappings
let g:NERDCreateDefaultMappings = 1
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
" hot keys map
" 把默认的leader从“\”改为“,”
let mapleader=","
nmap <C-W> <plug>NERDCommenterToggle
" ,ca，在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
" ,cc，注释当前行
" ,c，切换注释/非注释状态
" ,cs，以”性感”的方式注释
" ,cA，在当前行尾添加注释符，并进入Insert模式
" ,cu，取消注释
" Normal模式下, 几乎所有命令前面都可以指定行数. 比如输入 6,cs 的意思就是以性感方式注释光标所在行开始6行代码
" Visual模式下执行命令，会对选中的特定区块进行注释/反注释
" ,c<space>  加上/解开注释, 智能判断
" ,cy   先复制, 再注解(p可以进行黏贴)

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"==============================================================================
" 插件配置
"==============================================================================

" 插件开始的位置
call plug#begin('~/.vim/plugged')

" 下面两个插件要配合使用，可以自动生成代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" 插件结束的位置，插件全部放在此行上面
call plug#end()

