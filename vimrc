"=============================================================================
" vimrc --- Entry file for vim
" Copyright (c) 2016-2020 Shidong Wang & Contributors
" Author: Shidong Wang < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

" Note: Skip initialization for vim-tiny or vim-small.
if 1
    let g:_spacevim_if_lua = 0
    if has('lua')
        if has('win16') || has('win32') || has('win64')
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'\lua'
            let s:str = s:plugin_dir . '\?.lua;' . s:plugin_dir . '\?\init.lua;'
        else
            let s:plugin_dir = fnamemodify(expand('<sfile>'), ':h').'/lua'
            let s:str = s:plugin_dir . '/?.lua;' . s:plugin_dir . '/?/init.lua;'
        endif
        silent! lua package.path=vim.eval("s:str") .. package.path
        if empty(v:errmsg)
            let g:_spacevim_if_lua = 1
        endif
    endif
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
endif
" vim:set et sw=2


" map <C-s> :w<CR>
" map <A-a> ggVG
" map <A-c> "+y
" map <A-v> "+p
" map <A-1> <C-]>
" map <A-2> <C-T>
" imap <C-CR> <Esc>i<CR><Esc>O

let mapleader=","            " 设置leader键
set wrap                     " 设置自动换行显示
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set guifont=Monospace\ Bold\ 12 " 字体设置
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
" set autoindent               " 自动对齐
" set backspace=2              " 设置退格键可用
" set cindent shiftwidth=4     " 自动缩进4空格
" set smartindent              " 智能自动缩进

" Doxygen 注释
let g:DoxygenToolkit_commentType="C"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:DoxygenToolkit_authorName = "huatuo"
let g:DoxygenToolkit_versionString = "1.0.0"

" YouCompleteMe
" C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 跳转快捷键
" nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
" nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
" nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" Emmet
let g:user_emmet_expandabbr_key = '<leader>e'

" Calc
nnoremap <LEADER>c :call Calc()<CR>

" 替换
:nmap <leader>h :%s/\<<c-r>=expand("<cword>")<cr>\>//gODOD

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go to define
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! GoToDef()
    if filereadable(getcwd() . '/tags')  " 优先使用ctag
        exe "norm \<C-]>"
    else  " 其次使用YCM
        exec 'YcmCompleter GoToDefinitionElseDeclaration'
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reg clear
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Regclear()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
      call setreg(r, [])
    endfor
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Json 格式化
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! Jsonf :execute '%!python -m json.tool'
  \ | :execute '%!python2 -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group().decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 彩虹括号
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

"/usr/share/vim/vim81/rgb.txt
let g:rainbow_guifgs = ['gray', 'lightblue', 'lightgreen', 'yellow', 'IndianRed']
let g:rainbow_ctermfgs = ['gray', 'lightblue', 'lightgreen', 'yellow', 'magenta']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MarkdownPreview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不" 自动关闭预览窗口
let g:mkdp_auto_close = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时" 更新预览
let g:mkdp_refresh_slow = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! FormatFile()
    exec "w"
    if &filetype == 'javascript'
        exec 'call JsBeautify()'
	elseif &filetype == 'json'
        exec 'call JsonBeautify()'
	elseif &filetype == 'jsx'
        exec 'call JsxBeautify()'
	elseif &filetype == 'html'
        exec 'call HtmlBeautify()'
	elseif &filetype == 'css'
        exec 'call CSSBeautify()'
    endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly Run
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!gcc % -o %<'
        exec '! ./%<'
	elseif &filetype == 'cpp'
        exec '!g++ -std=c++11 % -o %<'
        exec '! ./%<'
    elseif &filetype == 'python'
        exec '!python %'
    elseif &filetype == 'go'
        exec "!go run %"
    elseif &filetype == 'javascript'
        exec "!node %"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!bash ./%
	elseif &filetype == 'dosbatch'
        :! ./%
    endif
endfunc


