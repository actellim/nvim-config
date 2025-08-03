local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>dg', function()
    vim.cmd('!doxygen')
    print("Doxygen documentation generated.")
  end, { desc = "Doxygen: Generate Docs" })

  vim.keymap.set('n', '<leader>do', function()
    local opener = "xdg-open"
    vim.fn.jobstart({ opener, "html/index.html" })
    print("Opening Doxygen documentation...")
  end, { desc = "Doxygen: Open Docs" })

end

return M
