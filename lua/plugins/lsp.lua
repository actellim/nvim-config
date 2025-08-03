return {
  -- Plugin 1: mason.nvim (The Installer)
  -- No dependencies, we can let this be the latest version.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Plugin 2: mason-lspconfig.nvim (The Bridge)
  -- This needs to be pinned to a version that is compatible with lspconfig v0.1.*
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "lua_ls" }
      })
    end,
  },

  -- Plugin 3: nvim-lspconfig (The Configurator)
  -- This remains pinned to the version compatible with your Neovim v0.9.5
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- This config function now ONLY worries about setting up lspconfig itself.
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup servers
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })

      -- Disable Completion in markdown.
      vim.api.nvim_create_autocmd("FileType", {
	      pattern = "markdown",
	      callback = function()
		      require('cmp').setup.buffer { enabled = false }
	      end,
	      desc = "Disable nvim-cmp for Markdown",
      })

      -- Keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
        end,
      })
    end,
  },
}
