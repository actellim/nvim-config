-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp" } },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls", "marksman", "pyright" },
        handlers = {
          -- Use a simple, default setup for all servers.
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Keep our special setup for lua_ls to get completion in our config.
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = { diagnostics = { globals = { "vim" } } }
              },
            })
          end,
        },
      })
    end,
  },
}
