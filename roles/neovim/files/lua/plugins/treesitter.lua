-- Minimal treesitter configuration
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    init = function()
      -- Blade filetype
      vim.filetype.add({ pattern = { [".*%.blade%.php"] = "blade" } })
    end,
  },

  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
}
