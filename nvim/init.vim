"""
" Natalie's
"      __                _
"   /\ \ \___  _____   _(_)_ __ ___
"  /  \/ / _ \/ _ \ \ / / | '_ ` _ \
" / /\  /  __/ (_) \ V /| | | | | | |
" \_\ \/ \___|\___/ \_/ |_|_| |_| |_|
"
" config.
"""

filetype plugin indent on    " required
syntax on

" keyboard special
command! -nargs=+ SurroundBuffer normal ciw<args><Esc>P
nnoremap å :SurroundBuffer<Space>

set termguicolors

set exrc secure " source local init.vim file if present

set number " line numbers

set mouse=a " enable mouse

set rtp+=/usr/local/opt/fzf

set backspace=indent,eol,start

set tabstop=4     " how many columns a tab counts for
set softtabstop=4 " how many spaces should be treated as a tab
set shiftwidth=4  " how far an indent is with reindent operations
set expandtab     " tab becomes spaces
set autoindent    " applies indent of current line to the next one
set smartindent   " reacts to syntax/style of code

set colorcolumn=80 " ruler at col 80 and 100
set cursorline     " highlight current line

set clipboard=unnamedplus " use system clipboard

set laststatus=2          " make statusline appear even with single window
set statusline=%f         " filename
set statusline+=\ %r%m    " readonly, modified flags
set statusline+=%=        " right align the next part
set statusline+=%y        " filetype
set statusline+=\ (%l,%c) " line number, col number

set hlsearch  " highlight found words on search
set incsearch " jump to best fit
set showmatch " highlight matching parentheses

set showcmd " show commands as they are typed
let mapleader = "\<Space>" " set leader key to space

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Turn off search highlighting with space.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Autoinstall vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" " Specify plugin directory
call plug#begin()
  " Built-in LSP
  "   run `:help lsp` for more information
  Plug 'neovim/nvim-lspconfig'

  Plug 'morhetz/gruvbox'

  Plug 'kabouzeid/nvim-lspinstall'

  " Neovim Completion Manager
  "   run `:help ncm2` for more information
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'

  "" Completion Sources
  """ General Purpose
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'

  """ Python
  "Plug 'ncm2/ncm2-jedi'

  """" Python Docstrings
  "Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

  """ Snippets
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-refactor'
  Plug 'nvim-treesitter/playground'

  " nvim-cmp
  "   run `:help compe` for more information
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Telescope
  "   run `:help telescope` for more information

  "" Dependencies
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'

  Plug 'nvim-telescope/telescope.nvim'

  " NerdTree (file browser)
  "   run `:help nerdtree` for more information
  Plug 'preservim/nerdtree'

  " TagBar (browse tags of source code files)
  "   run `:help tagbar` for more information
  Plug 'preservim/tagbar'

  " Fugitive (git wrapper for vim)
  "   run `:help fugitive` for more information
  Plug 'tpope/vim-fugitive'
  " For :GBrowse
  Plug 'tpope/vim-rhubarb'

  " FZF
  "   run `:help fzf` for more information
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Markdown
  " Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

  " Vim Merge Request
  Plug 'google/vim-maktaba'
  Plug 'google/vim-glaive'
  Plug 'LucHermitte/lh-vim-lib'
  Plug 'omrisarig13/vim-mr-interface'

  " Floaterm
  Plug 'voldikss/vim-floaterm'

  " Sounds
  Plug 'skywind3000/vim-keysound'

  " TMUX navigation
  Plug 'alexghergh/nvim-tmux-navigation'

  " Color picker
  Plug 'KabbAmine/vCoolor.vim'

  " Blamer layer
  Plug 'APZelos/blamer.nvim'

  " Telescope zoxide
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'jvgrootveld/telescope-zoxide'

  " status bar
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'

  " Clang format
  Plug 'rhysd/vim-clang-format'

  " Exlixir support
  Plug 'elixir-editors/vim-elixir'

  " Jupyter integration
  Plug 'luk400/vim-jukit'

  " Markdown preview
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

  " Commenting
  Plug 'numToStr/Comment.nvim'

  " Color highlighting for fun & for joy
  Plug 'norcalli/nvim-colorizer.lua'

" Initialize the plugin system
call plug#end()

lua <<EOF
-- Set up nvim-cmp.
local cmp = require'cmp'

require'colorizer'.setup()

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

      -- For `mini.snippets` users:
      -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
      -- insert({ body = args.body }) -- Insert at cursor
      -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
      -- require("cmp.config").set_onetime({ sources = {} })
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
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

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
)
equire("cmp_git").setup() ]]--

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
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()


require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "rust" },
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = false,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}

require('Comment').setup()

--[[ LSP ]]

local lspconfig = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').default_capabilities()

--- ccls for C/C++
lspconfig.ccls.setup{
  capabilities = capabilities,
}
vim.diagnostic.config({virtual_text = false})
vim.diagnostic.config({signs = false})
-- vim.diagnostic.config({virtual_text = true})
-- vim.diagnostic.config({signs = true})

--- bashls for Bash scripts
lspconfig.bashls.setup{
  capabilities = capabilities,
  cmd_env = {
    GLOB_PATTERN = "**/*@(.sh|.inc|.bash|.command)"
  }
}

--- pylsp for Python
lspconfig.pylsp.setup{
  capabilities = capabilities,
}

-- rust-analyzer for Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})


vim.o.completeopt = "menuone,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- PyDocstring
--vim.g.pydocstring_formatter = "google"
--vim.g.pydocstring_templates_path = "~/.config/nvim/resources/pydoc"

-- Vim jukit
vim.g.jukit_mappings = 0

-- Instant Markdown
-- Uncomment to override defaults:
-- let g:instant_markdown_slow = 1
-- let g:instant_markdown_autostart = 0
-- let g:instant_markdown_open_to_the_world = 1
-- let g:instant_markdown_allow_unsafe_content = 1
-- let g:instant_markdown_allow_external_content = 0
-- let g:instant_markdown_mathjax = 1
-- let g:instant_markdown_mermaid = 1
-- let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
-- let g:instant_markdown_autoscroll = 0
-- let g:instant_markdown_port = 8888
-- let g:instant_markdown_python = 1
EOF

" HotKeys
"   Can see keybindings with `:Telescope keymaps`

"" Map escape to terminal exit keys.
" tnoremap <Leader><Esc> <C-\><C-n>
" tnoremap <Leader><Leader> <C-\><C-n>:q<CR>
inoremap jk <Esc>
let g:floaterm_keymap_toggle = '«'

" Use ctrl-[hjkl] to navigate between panes
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Blamer settings
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 1
let g:blamer_prefix = ' >>> '
let g:blamer_delay = 1000
let g:blamer_relative_time = 1

" Lsp keybindings, many pulled from
" https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils/issues/50
nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gv :vs<CR><cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gs :sp<CR><cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gnt :sp<CR><cmd>lua vim.lsp.buf.definition()<CR><C-W>T
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>w <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <A-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <A-m> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <A-r> <cmd>lua vim.lsp.buf.rename()<CR>

"" Run Telescope with ,,
nnoremap <Leader><Leader> :Telescope<CR>

"" I prefer to use FZF for finding files. Can always access this through
"" Telescope
" nnoremap <Leader>f :Telescope find_files<CR>
"" Run FZF with <space> f
nnoremap <Leader>f :FZF<CR>

"" Run Telescope live grep with <space> g
nnoremap <Leader>g :Telescope live_grep<CR>

"" Run Telescope LSP definitions with <space> d
nnoremap <Leader>d :Telescope lsp_definitions<CR>

"" Run Telescope LSP references with<space> r
nnoremap <Leader>r :Telescope lsp_references<CR>

"" Run Telescope TreeSitter with <space> s
nnoremap <Leader>s :Telescope treesitter<CR>

nnoremap <Leader>z :Telescope zoxide<CR>

"" Toggle NerdTree with <space> n
nnoremap <Leader>n :NERDTreeToggle<CR>

"" Toggle Tagbar with <space> b
nnoremap <Leader>b :TagbarToggle<CR>

""" Copy current file path to clipboard
nnoremap <Leader>p :let @+=expand('%')<CR>
""" Abs path
nnoremap <Leader>pa :let @+=expand('%:p') <CR>

""" Open current document in markdown preview with <space> m
nnoremap <Leader>m :MarkdownPreview<CR>

" nvim-tmux navigation
nnoremap <silent> <C-h> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>
nnoremap <silent> <C-j> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>
nnoremap <silent> <C-k> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>
nnoremap <silent> <C-l> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>
nnoremap <silent> <C-\> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>
nnoremap <silent> <C-Space> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>

colorscheme gruvbox

lua << END

local colors = {
  blue     = '#549699',
  cyan     = '#94b3a8',
  black    = '#353535',
  white    = '#b7a996',
  red      = '#ED8796',
  violet   = '#D183E8',
  grey     = '#303030',
  camel    = "#DFA82A",
  sage     = "#A8A521",
  green    = "#9dd08e",
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.camel },
    b = { fg = colors.black, bg = colors.sage },
    c = { fg = colors.black, bg = nil},
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  command = { a = { fg = colors.black, bg = colors.green } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2},
    },
    lualine_b = { { 'filename', file_status = true, path = 1 } },
    lualine_c = {},
    lualine_x = {{ 'branch', icon = '∆' }, 'diff'},
    lualine_y = { 'filesize', 'progress'},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
END

" TODO:
" https://stackoverflow.com/questions/8584182/how-to-refresh-in-nerdtree-plugin


