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
Plug 'flazz/vim-colorschemes' " color
"Plug 'folke/tokyonight.nvim'
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

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

" mark words
Plug 'inkarkat/vim-ingo-library' "vim-mark dependence
Plug 'inkarkat/vim-mark'

" simple autocomplete
Plug 'lifepillar/vim-mucomplete'

" match quotes andd brackts
Plug 'Raimondi/delimitMate'

" vim tmux navigator
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"" Map leader
let mapleader='\'


" tabs
set expandtab

"" auto indentation bases on file types
autocmd FileType text setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" file
filetype indent plugin on
set smartindent
set autoindent
set wrapscan
set wrap
set textwidth=240


set statusline=%F%m%r\ %=col:%c,\ %l/%L\ %p%%

" Show relative line numbers
set relativenumber

" color
colorscheme vim
"colorscheme molokai
"colorscheme tokyonight-night
"colorscheme tokyonight
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon
"colorscheme catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
"colorscheme catppuccin-frappe

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
autocmd BufEnter * silent! lcd %:p:h

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


" Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files <cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fs <cmd>Telescope grep_string<cr>

nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>ff <cmd>Telescope find_files search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>
nnoremap <leader>fg <cmd>Telescope live_grep search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>
nnoremap <leader>fs <cmd>Telescope grep_string search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>

" Telescope dir first
nnoremap <leader>fdf <cmd>Telescope dir find_files <cr>
nnoremap <leader>fdg <cmd>Telescope dir live_grep<cr>

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


" fugitive
set diffopt+=vertical

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

nnoremap ,ca :vsp ~/.idle/.repo/my_argo/bin/newBranch.sh<CR>



" move line
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"set splitbelow
"set splitright


" set tab color
"TabLineSel - is the current (so to say) active tab label.
"TabLine - are the labels which are not currently active.
"TabLineFill - is the remaining of the tabline where there is no labels (background).
hi TabLineSel ctermfg=black ctermbg=gray

