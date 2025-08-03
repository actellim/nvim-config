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
    priority = 1000,

    config = function()
      vim.cmd.colorscheme "ofirkai-darkblue"
    end,
  },
}
