local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General settings group
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close certain filetypes with q
autocmd("FileType", {
  group = general,
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Auto resize splits
autocmd("VimResized", {
  group = general,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Filetype specific settings
local filetypes = augroup("FileTypes", { clear = true })

-- Web development (2 space indent)
autocmd("FileType", {
  group = filetypes,
  pattern = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "astro",
    "svelte",
    "html",
    "css",
    "scss",
    "json",
    "jsonc",
    "yaml",
    "markdown",
    "blade",
    "php",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Go (tabs, 4 space width)
autocmd("FileType", {
  group = filetypes,
  pattern = { "go", "gomod", "gowork" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false
  end,
})

-- Markdown settings
autocmd("FileType", {
  group = filetypes,
  pattern = { "markdown", "mdx" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.opt_local.conceallevel = 2
  end,
})

-- Laravel/Blade
autocmd({ "BufRead", "BufNewFile" }, {
  group = filetypes,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
  end,
})

-- Alpine.js attributes
autocmd({ "BufRead", "BufNewFile" }, {
  group = filetypes,
  pattern = { "*.html", "*.blade.php" },
  callback = function()
    vim.opt_local.iskeyword:append(":")
    vim.opt_local.iskeyword:append("@-@")
  end,
})

-- Auto format on save for certain filetypes
autocmd("BufWritePre", {
  group = filetypes,
  pattern = { "*.go" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
