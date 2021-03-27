function! myspacevim#before() abort
    "通用设置
    call SpaceVim#custom#SPCGroupName(['k'], "+K's setting")
    call SpaceVim#custom#SPC('nmap', ['k', 'l'], ':nohl<CR>', 'no hight light', 0) "取消高亮
    call SpaceVim#custom#SPC('nmap', ['k', 'a'], 'ggVG', 'select all', 0) "全选
    call SpaceVim#custom#SPC('nmap', ['k', 'U'], 'vvgU', 'upper case word', 0) "单词大写
    call SpaceVim#custom#SPC('nmap', ['k', 'u'], 'vvgu', 'lower case word', 0) "单词小写
    call SpaceVim#custom#SPC('nmap', ['k', 'r'], ':e!<CR>', 'refresh', 0) "刷新

    "Doxygen相关
    call SpaceVim#custom#SPCGroupName(['k', 'd'], "Doxygen")
    call SpaceVim#custom#SPC('nmap', ['k', 'd', 'd'], ':Dox<CR>', ':Dox', 0) "Dox
    call SpaceVim#custom#SPC('nmap', ['k', 'd', 'a'], ':DoxAuthor<CR>', ':DoxAuthor', 0) "DoxAuthor
    call SpaceVim#custom#SPC('nmap', ['k', 'd', 'l'], ':DoxLic<CR>', ':DoxLic', 0) "DoxLic
    call SpaceVim#custom#SPC('nmap', ['k', 'd', 'u'], ':DoxUndoc<CR>', ':DoxUndoc', 0) "DoxUndoc
    call SpaceVim#custom#SPC('nmap', ['k', 'd', 'b'], ':DoxBlock<CR>', ':DoxBlock', 0) "DoxBlock

    "对比相关
    call SpaceVim#custom#SPCGroupName(['k', 'c'], "Compare")
    call SpaceVim#custom#SPC('nmap', ['k', 'c', 't'], ':difft<CR>', 'diff this', 0) "diff this
    call SpaceVim#custom#SPC('nmap', ['k', 'c', 'o'], ':diffo<CR>', 'diff off', 0) "diff off
    call SpaceVim#custom#SPC('nmap', ['k', 'c', 'p'], 'dp', 'diff push', 0) "diff push
    call SpaceVim#custom#SPC('nmap', ['k', 'c', 'g'], 'do', 'diff get', 0) "diff get

    "寄存器操作
    call SpaceVim#custom#SPC('nmap', ['r', 'r'], ':reg<CR>', 'show all reg', 0)
    call SpaceVim#custom#SPC('nmap', ['r', 'C'], ':call Regclear()<CR>', 'clear all reg', 0)

    "跳转相关
    call SpaceVim#custom#SPC('nmap', ['j', 'j'], ':sp<Esc><C-w>j<Esc>:call GoToDef()<CR>|', 'spilt jump', 0) "水平分屏跳转
    call SpaceVim#custom#SPC('nmap', ['j', 'g'], ':vsp<Esc><C-w>l<Esc>:call GoToDef()<CR>|', 'spilt jump', 0) "垂直分屏跳转
    nnoremap 1 :call GoToDef()<CR>
    nnoremap 2 <C-o>

    "编辑相关
    " inoremap <C-CR> <Esc>i<CR><Esc>O
    inoremap  <Esc>i<CR><Esc>O

endfunction

function! myspacevim#after() abort
    " 解决终端中方向键问题
    tnoremap <ESC> <C-W>N
    tnoremap <ESC><ESC> <C-W>
    set timeout timeoutlen=1000
    set ttimeout ttimeoutlen=100
endfunction

