call plug#begin()
Plug 'Olical/conjure'
Plug 'wlangstroth/vim-racket'
Plug 'bakpakin/janet.vim'
Plug 'gpanders/nvim-parinfer'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Olical/aniseed'
Plug 'hylang/vim-hy'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dense-analysis/ale'
Plug 'monkoose/matchparen.nvim'
Plug 'neomake/neomake'
Plug 'cohama/lexima.vim' 
Plug 'feline-nvim/feline.nvim'
call plug#end()

lua << EOF
require("catppuccin").setup {
    flavour = "latte" -- mocha, macchiato, frappe, latte
}
EOF
colorscheme catppuccin

let maplocalleader = " " 
:inoremap fd <esc>
:xnoremap fd <esc> 

imap <C-L> λ

set termguicolors
set number
set colorcolumn=80

"set background=light
"colorscheme PaperColor

lua << END
require('feline').setup()
END

" Shortcut to send buffer to interpreter 
let maplocalleader = " " 
:noremap ba :w !bash
:noremap py :w !python
:noremap ra :w !racket
:noremap fi :w !fish 
:noremap pe :w !perl
