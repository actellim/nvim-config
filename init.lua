vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "›",
      config = "♪",
      event = "⚡",
      ft = "📄",
      init = "⚙",
      keys = "🗝",
      plugin = "◎",
      runtime = "▸",
      require = "▸",
      source = "S",
      start = "★",
      task = "✓",
      lazy = "⏳",
    },
  },
})

require("core.keymaps").setup()
require("core.options").setup()
