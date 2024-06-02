" use vim-plug from junegunn/vim-plug to manager plugin
call plug#begin()

" session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autoload = "yes"
let g:session_autosave = "yes"
" use when different terminals has problem to load
nnoremap ,os :OpenSession! default <CR>
nnoremap ,ss :SaveSession! default <CR>

" tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'princejoogie/dir-telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-frecency.nvim'
" Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files <cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fs <cmd>Telescope grep_string<cr>

nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" also supprot workspace args, recently used
nnoremap <leader>fr <cmd>Telescope frecency<cr>

" commonly used directory
nnoremap <leader>ff <cmd>Telescope find_files search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>
nnoremap <leader>fg <cmd>Telescope live_grep search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>
nnoremap <leader>fs <cmd>Telescope grep_string search_dirs={"/home/bo.fu/mapping/map-tools/lat/"}<cr>

" Telescope dir first
nnoremap <leader>fdf <cmd>Telescope dir find_files <cr>
nnoremap <leader>fdg <cmd>Telescope dir live_grep<cr>

" github
Plug 'tpope/vim-fugitive'
set diffopt+=vertical

" color
"Plug 'flazz/vim-colorschemes' " color
"Plug 'folke/tokyonight.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"colorscheme vim
"colorscheme molokai
"colorscheme tokyonight-night
"colorscheme tokyonight
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon
"colorscheme catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin-mocha

" nerdtree
Plug 'preservim/nerdtree'
nnoremap ,nt :NERDTree %<CR>
nnoremap ,n :NERDTreeToggle<CR>
"let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

" easy align
Plug 'junegunn/vim-easy-align'

" commenter
Plug 'scrooloose/nerdcommenter'

" show marks a, b, c
Plug 'chentoast/marks.nvim'
nnoremap ,m :MarksListAll<CR>

" move around
Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

" mark words
Plug 'inkarkat/vim-ingo-library' "vim-mark dependence
Plug 'inkarkat/vim-mark'
" color-words, default 6 to extend to 18;  \m & mark move around
"let g:mwDefaultHighlightingPalette = 'extended'
let g:mwAutoLoadMarks = 1
map <F9> <leader>/
map <F10> <leader>?
map <F11> <leader>*
map <F12> <leader>#

" match quotes andd brackts
Plug 'Raimondi/delimitMate'

" vim tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" lsp manager
Plug 'williamboman/mason.nvim'

" lsp server config
Plug 'williamboman/mason-lspconfig.nvim'

" nvim lsp config
Plug 'neovim/nvim-lspconfig'

" cmp
Plug 'hrsh7th/cmp-nvim-lsp'  " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer' " buffer as source
Plug 'hrsh7th/nvim-cmp' "auto completion plugin

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"use pyright
"pyproject.toml
"[tool.pyright]
"venvPath="/home/<username>/.cache/pypoetry/virtualenvs"
"venv="<venv-name>"
"pyrightconfig.json
"venvPath": ".",
"venv": ".venv",

call plug#end()


"" Map leader
let mapleader='\'

" tabs
set expandtab

"" auto indentation bases on file types
autocmd FileType text setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" file
"filetype indent plugin on
"set smartindent
"set autoindent
set wrapscan
set wrap
set textwidth=80

set statusline=%F%m%r\ %=col:%c,\ %l/%L\ %p%%

" Show relative line numbers
set relativenumber

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

" set nvim tab color
"TabLineSel - is the current (so to say) active tab label.
"TabLine - are the labels which are not currently active.
"TabLineFill - is the remaining of the tabline where there is no labels (background).
hi TabLineSel ctermfg=black ctermbg=red
hi TabLine ctermfg=black ctermbg=gray



lua << EOF
require("nvim-treesitter.configs").setup{
highlight = {
enable = true,
},
indent = {enable = true}
}

require("mason").setup()
require("mason-lspconfig").setup {
ensure_installed = { "pyright" },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright'}
for _, lsp in ipairs(servers) do
lspconfig[lsp].setup {
        capabilities = capabilities
}
end

-- Set up nvim-cmp.
local cmp = require('cmp')
cmp.setup({
snippet = {
-- REQUIRED - you must specify a snippet engine
expand = function(args)
vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
end,
},
window = {
completion = cmp.config.window.bordered(),
documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
['<C-b>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.abort(),
['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
['<Tab>'] = cmp.mapping(function(fallback)
if cmp.visible() then
cmp.select_next_item()
elseif luasnip.expand_or_jumpable() then
luasnip.expand_or_jump()
else
fallback()
end
end, { 'i', 's' }),
['<S-Tab>'] = cmp.mapping(function(fallback)
if cmp.visible() then
cmp.select_prev_item()
elseif luasnip.jumpable(-1) then
luasnip.jump(-1)
else
fallback()
end
end, { 'i', 's' }),
}),
sources = cmp.config.sources({
{ name = 'nvim_lsp' },
{ name = 'vsnip' }, -- For vsnip users.
-- { name = 'luasnip' }, -- For luasnip users.
-- { name = 'ultisnips' }, -- For ultisnips users.
-- { name = 'snippy' }, -- For snippy users.
}, {
{ name = 'buffer' },
})
})

require('telescope').load_extension('fzf')
require("telescope").load_extension("frecency")

require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  -- builtin_marks = { ".", "<", ">", "^" },
  builtin_marks = { },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions.
  -- higher values will have better performance but may cause visual lag,
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- disables mark tracking for specific buftypes. default {}
  excluded_buftypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "0",
    virt_text = "",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}
EOF
