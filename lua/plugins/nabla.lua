return {
  -- Block 1: Use Mason to ensure the tree-sitter CLI is installed, as per the docs.
  -- Lazy.nvim is smart enough to merge this with your other Mason config.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "tree-sitter-cli" },
    },
  },

  -- Block 2: The nabla.nvim plugin itself.
  {
    "jbyuki/nabla.nvim",

    -- This is the most important part. We explicitly state that nabla
    -- depends on nvim-treesitter. This forces the correct load order.
    dependencies = { "nvim-treesitter/nvim-treesitter",
    		     "williamboman/mason.nvim",},

    config = function()
	    vim.api.nvim_create_autocmd({ "FileType" }, {
		    pattern = { "markdown", "tex" },
		    callback = function()
			    require("nabla").enable_virt({
				    autogen = true,
				    silent = true,
			    })
		    end,
		    desc = "Enable Nabla virtual text for math rendering",
	    })
    end,
  },
}
