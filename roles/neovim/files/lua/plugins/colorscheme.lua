-- Colorscheme configuration
return {
  -- Catppuccin (primary)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          neotree = true,
          treesitter = true,
          notify = true,
          mini = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          telescope = {
            enabled = true,
          },
          which_key = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
          mason = true,
          harpoon = true,
          flash = true,
        },
        custom_highlights = function(colors)
          return {
            -- Custom highlights for better visibility
            CursorLine = { bg = colors.surface0 },
            CursorLineNr = { fg = colors.lavender },
            -- Avante highlights
            AvanteTitle = { fg = colors.mauve, bold = true },
            AvanteReversedTitle = { bg = colors.mauve, fg = colors.base },
          }
        end,
      })
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- TokyoNight (alternative)
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },
    },
  },

  -- Gruvbox (alternative)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      contrast = "hard",
    },
  },

  -- Tyrone Neon (local theme)
  {
    -- Local plugin living under: ~/.config/nvim/lua/plugins/tyrone-neon
    dir = vim.fn.stdpath("config") .. "/lua/plugins/tyrone-neon",
    name = "tyrone-neon",
    lazy = true,
    priority = 1000,
    config = function()
      require("plugins.tyrone-neon").setup()
      vim.cmd.colorscheme("tyrone-neon")
    end,
  },
}
