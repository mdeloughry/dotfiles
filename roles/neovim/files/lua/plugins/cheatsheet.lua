-- Command palette and keybinding discovery
return {
  -- Legendary - command palette
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    dependencies = {
      "kkharji/sqlite.lua",
    },
    keys = {
      { "<leader>P", "<cmd>Legendary<cr>", desc = "Command Palette" },
      { "<leader>?", "<cmd>Legendary keymaps<cr>", desc = "Search Keymaps" },
    },
    opts = {
      extensions = {
        lazy_nvim = true,
        which_key = { auto_register = true },
      },
    },
  },
}
