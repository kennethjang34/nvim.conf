return {
	'mfussenegger/nvim-dap',
	config = function()
		local dap = require('dap')

		dap.adapters.lldb = {
			type = 'executable',
			command = '/opt/homebrew/Cellar/llvm/13.0.1_1/bin/lldb-vscode', -- adjust as needed, must be absolute path
			name = 'lldb'
		}


		dap.configurations.cpp = {
			{
				name = 'Launch',
				type = 'lldb',
				request = 'launch',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
				args = {},
				env = function()
					local variables = {}
					for k, v in pairs(vim.fn.environ()) do
						table.insert(variables, string.format("%s=%s", k, v))
					end
					return variables
				end,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp





		dap.adapters.python = {
			type = 'executable',
			command = '/Users/JANG/venv/lib/python3.10/site-packages/debugpy/bin/python3',
			args = { '-m', 'debugpy.adapter' },
		}

		dap.configurations.python = {
			{
				-- The first three options are required by nvim-dap
				type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
				request = 'launch',
				name = "Launch file",
				-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

				program = "${file}", -- This configuration will launch the current file if used.
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. '/venv/bin/python3') == 1 then
						return cwd .. '/venv/bin/python3'
					elseif vim.fn.executable(cwd .. '/.venv/bin/python3') == 1 then
						return cwd .. '/.venv/bin/python3'
					else
						return '/Users/JANG/venv/bin/python3'
					end
				end,
			},
		}
	end
}
