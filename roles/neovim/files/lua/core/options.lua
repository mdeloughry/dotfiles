-- Core Neovim options
local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Cursor
opt.cursorline = true
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.colorcolumn = "120"
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Performance
opt.updatetime = 50
opt.timeoutlen = 300

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10

-- Folding (using treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99

-- Mouse
opt.mouse = "a"

-- Encoding
opt.fileencoding = "utf-8"

-- Misc
opt.showmode = false
opt.conceallevel = 0
opt.shortmess:append("c")
opt.iskeyword:append("-")
opt.formatoptions:remove({ "c", "r", "o" })

-- Neovide specific
if vim.g.neovide then
  opt.guifont = "JetBrainsMono Nerd Font:h14"
end
