" use vim-plug from junegunn/vim-plug to manager plugin
call plug#begin()

" session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'princejoogie/dir-telescope.nvim'

" github
Plug 'tpope/vim-fugitive'

" color
Plug 'flazz/vim-colorschemes'

" nerdtree
Plug 'preservim/nerdtree'

" easy align
Plug 'junegunn/vim-easy-align'

" commenter
Plug 'scrooloose/nerdcommenter'

" show marks a, b, c
Plug 'kshenoy/vim-signature'

" move around
Plug 'easymotion/vim-easymotion'

" color words
Plug 'inkarkat/vim-ingo-library' "vim-mark dependence
Plug 'inkarkat/vim-mark'

" simple autocomplete
Plug 'lifepillar/vim-mucomplete'

" match quotes andd brackts
Plug 'Raimondi/delimitMate'

call plug#end()


"" Map leader
let mapleader='\'


set statusline=%F%m%r\ %=col:%c,\ %l/%L\ %p%%

" Show relative line numbers
set relativenumber

" color
colorscheme molokai

" highlight in visual mode selection
highlight Visual cterm=bold ctermbg=Blue ctermfg=NONE
hi Comment ctermfg=LightBlue
"" highlight searching
set hlsearch
highlight Search cterm=italic,underline
" no highlight search
nnoremap // :noh<CR>

" open bash
nnoremap <silent> ,b :vsp ~/.bashrc<CR>
nnoremap ,bs :wa <Bar>!source ~/.bashrc<CR>

" open vimrc
nnoremap <silent> ,v :vsp $MYVIMRC<CR>
nnoremap ,vs :wa<Bar>source $MYVIMRC<CR>

" open tmux
nnoremap <silent> ,t :vsp ~/.tmux.conf <CR>

" set autochdir - auto change dir to the file director
" above may cause plugin not work, then use the following
" autocmd BufEnter * silent! lcd %:p:h

" session
let g:session_autoload = "yes"
let g:session_autosave = "yes"

"save left hand aha
inoremap jk <esc>

"add triple quote
nnoremap \" o"""<esc>o"""<esc>ka
inoremap \" """<esc>o"""<esc>ka
nnoremap \' o"""<esc>o"""<esc>ka
inoremap \' """<esc>o"""<esc>ka

" add quote and upper
nnoremap ," viw<esc>a"<esc>bi"<esc>ww
nnoremap ,' viw<esc>a'<esc>bi'<esc>ww

" move line
nnoremap <C-J> o<Esc> kk
nnoremap <C-K> O<Esc> 


" Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files <cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"nnoremap <leader>ff <cmd>Telescope find_files search_dirs={"~/github/algorithm/"}<cr>
nnoremap <leader>fdf <cmd>Telescope dir find_files <cr>
nnoremap <leader>fdg <cmd>Telescope dir live_grep<cr>
nnoremap <leader>fdb <cmd>Telescope dir buffers<cr>
nnoremap <leader>fdo <cmd>Telescope dir oldfiles<cr>
nnoremap <leader>fds <cmd>Telescope dir grep_string<cr>
nnoremap <leader>fdh <cmd>Telescope dir help_tags<cr>

" nerdtree
nnoremap ,nt :NERDTree %<CR>
nnoremap ,n :NERDTreeToggle<CR>
"let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

" easymotion
map <Leader> <Plug>(easymotion-prefix)

" color-words, default 6 to extend to 18;  \m & mark move around
"let g:mwDefaultHighlightingPalette = 'extended'
let g:mwAutoLoadMarks = 1
map <F9> <leader>/
map <F10> <leader>?
map <F11> <leader>*
map <F12> <leader>#

" autocomplete
set completeopt-=preview
set completeopt+=menuone,noselect
let g:mucomplete#enable_auto_at_startup = 0
nnoremap ,ac ::MUcompleteAutoToggle<CR>

" session
let g:session_autoload = "yes"
let g:session_autosave = "yes"

" diff
nnoremap ,f :diffthis<CR>
nnoremap ,ff :diffo<CR>

" execute current line and write output to the current line
map <F2> !!sh<CR><Esc>
" open the file under the cursor in a new vertical split window
" works on nonexist files as well (create a new one)
nnoremap <F7> :vsp <C-r><C-f> <cr>
nnoremap <F8> :tabe <C-r><C-f> <cr>



" run cmd
nnoremap ,p   :wa <Bar> :lcd %:p:h<Bar>!python %<CR>
nnoremap ,pp   :wa <Bar> :lcd %:p:h<Bar>!python % &> %.out &<CR>
nnoremap ,o  :wa <Bar> :vsp %.out <CR>
"
" use when different terminals has problem to load 
nnoremap ,os :OpenSession! default <CR>
nnoremap ,ss :SaveSession! default <CR>

" abbreviation
ab SH #!/usr/bin/env bash
ab PY #!/usr/bin/env python
ab TD **[TODO]**

ab cout std::cout << " bf 0 " << 0 << std::endl;
ab CD createDays.py

ab PLT import pylab as plt
ab NP import numpy as np
ab NPT import numpy.testing as npt
ab PD import pandas as pd
ab MP import multiprocessing as mp

ab IF if __name__=='__main__':
