-- Terminal integration
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Horizontal Terminal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Vertical Terminal" },
    { "<leader>tg", function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "curved",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
      })
      lazygit:toggle()
    end, desc = "LazyGit" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    persist_mode = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = false,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Terminal keymaps
    function _G.set_terminal_keymaps()
      local term_opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], term_opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], term_opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], term_opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], term_opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], term_opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], term_opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
