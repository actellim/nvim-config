return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = {"nvim-neotest/nvim-nio"} },
		},
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')

      -- This tells dap how to use the debugpy adapter installed by Mason
      dap.adapters.python = function(cb, config)
        cb({
          type = 'executable',
          command = vim.fn.stdpath("data") .. '/mason/bin/debugpy',
          args = { '-m', 'debugpy.adapter' },
        })
      end

      -- This tells dap what a Python launch configuration looks like
      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file',
          program = '${file}', -- This will launch the current file
          pythonPath = function()
            return '/usr/bin/python' -- Or your virtualenv python
          end,
        },
      }

			dapui.setup()

			dap.listeners.after.event_initialized['dapui_config'] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated['dapui_config'] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited['dapui_config'] = function()
				dapui.close()
			end

			vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: Continue'})
			vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: Step Over' })
			vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: Step Into' })
			vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP: Step Out' })
			vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, { desc = 'DAP: Toggle Breakpoint' })
			vim.keymap.set('n', '<Leader>B', function()
				dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
			end, { desc = 'DAP: Set Conditional Breakpoint' })
			vim.keymap.set('n', '<Leader>lp', function()
				dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end, { desc = 'DAP: Set Log Point' })
			vim.keymap.set('n', '<Leader>dr', dap.repl.open, { desc = 'DAP: Open REPL' })
			vim.keymap.set('n', '<Leader>dl', dap.run_last, { desc = 'DAP: Run Last' })
		end,
	},
}


