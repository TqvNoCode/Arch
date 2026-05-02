return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		-- Debug Code setting for C++
		local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch C++",
				type = "codelldb",
				request = "launch",
				program = function()
					-- Tự động tìm binary cùng tên file hiện tại
					return vim.fn.getcwd() .. "/" .. vim.fn.expand("%:t:r")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}



		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.after.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.after.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Configuration for python
		require("dap-python").setup("~/.local/share/nvim/dap-python/bin/python")

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Set breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue/Start - breakpoint" })
		vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step over - breakpoint" })
		vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into - breakpoint" })
	end,
}
