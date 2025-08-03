local M = {}

function M.setup()
  -- Make all yank (y) and delete (d) operations use the system clipboard
  vim.opt.clipboard = "unnamedplus"

  -- ESSENTIAL AND RECOMMENDED SETTINGS:

  -- Tab and Indentation settings
  vim.opt.tabstop = 2 			-- Tab width is 2 spaces.
  vim.opt.shiftwidth = 2 		-- Number of spaces to use for auto-indent.
  vim.opt.expandtab = true  		-- Spaces in lieu of tabs.

  -- Make line numbers default
  vim.opt.number = true
  vim.opt.relativenumber = true

  -- Add a hilight to the cursor line
  vim.opt.cursorline = true

  -- Enable mouse mode
  vim.opt.mouse = 'a'

  -- Enable break indent
  vim.opt.breakindent = true

  -- Save undo history
  vim.opt.undofile = true

  -- Decrease update time
  vim.opt.updatetime = 250
  vim.opt.timeoutlen = 300

  -- Conceal level for nabla and treesitter
  vim.opt.conceallevel = 2

  -- Override for makefiles
  vim.api.nvim_create_autocmd("FileType", {
	  pattern = "make",
	  callback = function()
	  vim.bo.expandtab = false
	  vim.bo.tabstop = 8
	  vim.bo.shiftwidth = 8
  end,
  desc = "Use real tabs for Makefiles",
  })

end

return M
