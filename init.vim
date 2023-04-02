call plug#begin()
Plug 'Olical/conjure'
Plug 'wlangstroth/vim-racket'
Plug 'eraserhd/parinfer-rust'
Plug 'bakpakin/janet.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Olical/aniseed'
"Plug 'hylang/vim-hy'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dense-analysis/ale'
Plug 'windwp/nvim-autopairs' 
Plug 'monkoose/matchparen.nvim'
Plug 'neomake/neomake'
call plug#end()

lua << EOF
require("nvim-autopairs").setup {}
EOF

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
:noremap rr :w !R
:noremap fi :w !fish 
