return {
	"Shatur/neovim-session-manager",
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local session_manager_config = require('session_manager.config')
		local session_manager = require('session_manager')
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		session_manager.setup(
			{
				autoload_mode = session_manager_config.AutoloadMode.Disabled,
				-- autoload_mode =
				-- 	session_manager_config.AutoloadMode.CurrentDir,
				-- session_manager_config.AutoloadMode.LastSession,
				autosave_ignore_not_normal = true,
				autosave_last_session = true,
				autosave_only_in_session = true,
			}
		)

		local config_group = vim.api.nvim_create_augroup('SessionManagerConfig', { clear = true }) -- A global group for all your config autocommands
		-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
		-- 	callback = function()
		-- for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		-- Don't save while there's any 'nofile' buffer open.
		-- if vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'nofile' then
		-- 	return
		-- end
		-- end
		-- 		session_manager.save_current_session()
		-- 	end,
		-- 	group = "SessionManagerConfig"
		-- })
		vim.api.nvim_create_autocmd({ 'User' }, {
			pattern = "SessionLoadPost",
			callback = function()
				-- vim.cmd('Alpha')
			end,
			group = "SessionManagerConfig"
		})
		local no_expr = { silent = true, noremap = true, expr = false }
		map('n', '<leader>sm',
			[[<CMD>SessionManager<CR>]], no_expr)
		map('n', '<leader>sl',
			[[<CMD>SessionManager load_current_dir_session<CR>]], no_expr)
		map('n', '<leader>ss',
			[[<CMD>SessionManager save_current_session<CR>]], no_expr)
		map('n', '<leader>sd',
			[[<CMD>SessionManager delete_current_dir_session<CR>]], no_expr)
	end
}
