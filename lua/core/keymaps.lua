local M = {}

function M.setup()
  local opts = { noremap = true, silent = true }

  --Dox
  vim.keymap.set('n', '<leader>dg', function()
    vim.cmd('!doxygen')
    print("Doxygen documentation generated.")
  end, { desc = "Doxygen: Generate Docs" })

  vim.keymap.set('n', '<leader>do', function()
    local opener = "xdg-open"
    vim.fn.jobstart({ opener, "html/index.html" })
    print("Opening Doxygen documentation...")
  end, { desc = "Doxygen: Open Docs" })
  
  -- LSP
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

  -- Diagnostics
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

end

return M
