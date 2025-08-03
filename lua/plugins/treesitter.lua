return {
  {
    "nvim-treesitter/nvim-treesitter",
    
    -- This command runs automatically after installing to download and build parsers.
    build = ":TSUpdate",
    
    config = function()
      -- This is the core setup function.
      require('nvim-treesitter.configs').setup {
        -- A list of parsers we want to ensure are installed.
        -- Let's start with a few common ones to verify it's working.
        ensure_installed = { "c", "cpp", "lua", "markdown", "markdown_inline", "latex" },

        -- Automatically install missing parsers when you open a new file type.
        auto_install = true,

        -- The 'highlight' module is what enables the advanced syntax highlighting.
        highlight = {
          enable = true,
        },
      }
    end,
  },
}
