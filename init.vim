call plug#begin()
Plug 'Olical/conjure'
Plug 'HiPhish/awk-ward.nvim'
"Plug 'wlangstroth/vim-racket'
Plug 'bakpakin/janet.vim'
Plug 'gpanders/nvim-parinfer'
"Plug 'NLKNguyen/papercolor-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Olical/aniseed'
Plug 'hylang/vim-hy'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'dense-analysis/ale'
Plug 'monkoose/matchparen.nvim'
"Plug 'neomake/neomake'
Plug 'cohama/lexima.vim'
Plug 'feline-nvim/feline.nvim'
Plug 'jalvesaq/Nvim-R'
Plug 'jalvesaq/cmp-nvim-r'

" This is for Standard ML
Plug 'jez/vim-better-sml'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Trying to get autocomplete for clojure! IT WORKS!! see below also
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy

" Whitespace management
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" Trying to get clojure autocomplete!! IT WORKS see above also!
let g:coc_global_extensions = ['coc-conjure']

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

autocmd FileType r inoremap <buffer> ö <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> ö <Esc>:normal! a %>%<CR>a
autocmd FileType rmd inoremap <buffer> ö <Esc>:normal! a %>%<CR>a

autocmd FileType r inoremap <buffer> å <Esc>:normal! a %<>%<CR>a
autocmd FileType rnoweb inoremap <buffer> å <Esc>:normal! a %<>%<CR>a
autocmd FileType rmd inoremap <buffer> å <Esc>:normal! a %<>%<CR>a

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'conjure' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'cmp_zotcite' },
      { name = 'cmp_nvim_r' },
      { name = 'nvim_lsp' },
      { name = 'async_clj_omni' },
      { name = 'path', option = { trailing_slash = true } }
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
--  require'lspconfig'.clojure_lsp.setup{}
  require'lspconfig'.r_language_server.setup{}
EOF


lua << EOF
require("catppuccin").setup {
    flavour = "latte" -- mocha, macchiato, frappe, latte
}
EOF
colorscheme catppuccin

let mapleader = ","

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

set mouse=i
set hidden
