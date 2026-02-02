-- Which-key: Cheatsheet and keybinding guide
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      show_help = true,
      show_keys = true,
    })

    -- Register key groups
    wk.add({
      -- Top level
      { "<leader>a", desc = "AI/Claude" },
      { "<leader>b", desc = "Buffers" },
      { "<leader>c", desc = "Code" },
      { "<leader>d", desc = "Debug/Delete" },
      { "<leader>e", desc = "Explorer" },
      { "<leader>f", desc = "Find/Files" },
      { "<leader>g", desc = "Git" },
      { "<leader>h", desc = "Harpoon" },
      { "<leader>l", desc = "LSP" },
      { "<leader>p", desc = "Project" },
      { "<leader>s", desc = "Search" },
      { "<leader>t", desc = "Test/Terminal" },
      { "<leader>w", desc = "Window" },
      { "<leader>x", desc = "Diagnostics" },

      -- Buffers
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
      { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer" },
      { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
      { "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer" },

      -- Code
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
      { "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format" },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>cs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },

      -- Explorer
      { "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
      { "<leader>ef", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
      { "<leader>er", "<cmd>Neotree reveal<cr>", desc = "Reveal in Explorer" },

      -- Find/Files
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find Word" },

      -- Git
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
      { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff" },
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk" },
      { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk" },
      { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Blame" },
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },

      -- Harpoon
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Add File" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Menu" },
      { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "File 1" },
      { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "File 2" },
      { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "File 3" },
      { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "File 4" },

      -- LSP
      { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
      { "<leader>lD", vim.lsp.buf.declaration, desc = "Declaration" },
      { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
      { "<leader>lI", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
      { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
      { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },

      -- Project
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>pg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "Search Project" },

      -- Search
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "TODOs" },

      -- Test/Terminal
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical Terminal" },

      -- Window
      { "<leader>wh", "<C-w>h", desc = "Go Left" },
      { "<leader>wj", "<C-w>j", desc = "Go Down" },
      { "<leader>wk", "<C-w>k", desc = "Go Up" },
      { "<leader>wl", "<C-w>l", desc = "Go Right" },
      { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split" },
      { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split" },
      { "<leader>wc", "<cmd>close<cr>", desc = "Close Window" },
      { "<leader>wo", "<cmd>only<cr>", desc = "Close Others" },
      { "<leader>w=", "<C-w>=", desc = "Equal Size" },

      -- Misc
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Search Project" },
      { "<leader>.", "<cmd>Telescope file_browser<cr>", desc = "Browse Files" },
      { "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>?", "<cmd>WhichKey<cr>", desc = "Cheatsheet" },
      { "<leader>n", "<cmd>nohl<cr>", desc = "Clear Highlights" },
      { "<leader>q", "<cmd>qa<cr>", desc = "Quit All" },
    })
  end,
}
