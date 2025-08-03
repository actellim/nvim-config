return {
  {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "andrew-george/telescope-themes" },
    },
    config = function()
      require("telescope").load_extension "themes"
      require("telescope").setup({
        extensions = {
          themes = {
            enable_live_preview = true,
            persist = {
              enabled = true,
              path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
            },
          },
        },
      })
    end,
  },

  {
    "ofirgall/ofirkai.nvim",
    name = "ofirkai",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "ofirkai-darkblue"
      vim.api.nvim_set_hl( 0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl( 0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl( 0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl( 0, "LineNr", { fg = "#3f478f", bg = "NONE" })
      vim.api.nvim_set_hl( 0, "CursorLineNr", { fg = "#909ef5", bg = "NONE" })
      vim.api.nvim_set_hl( 0, "VertSplit", { bg = "NONE" })
      vim.api.nvim_set_hl( 0, "Pmenu", { bg = "NONE" })
      vim.api.nvim_set_hl( 0, "StatusLine", { bg = "#131426" })
      vim.api.nvim_set_hl( 0, "StatusLineNC", { bg = "#131426" })
    end,
  },
}
