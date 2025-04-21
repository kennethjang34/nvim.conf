return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require "fzf-lua.actions"
		require("fzf-lua").setup({
			-- "hide",
			winopts    = {
				height = 0.5,
				width = 1.0,
				highlight = 'Comment',
			},
			preview    = {
				vertical = { 'down:45%' },
				horizontal = { 'right:60%' },
			},
			previewers = {
				bat = {
					cmd = "bat",
					-- args = "--style=numbers,changes --line-range :300 {}",
					args = "--color=always --style=numbers,changes --line-range :300 ",
				}
			},
			keymap     = {
				builtin = {
					false,    -- do not inherit from defaults
					-- neovim `:tmap` mappings for the fzf win
					["<M-Esc>"]    = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
					["<F1>"]       = "toggle-help",
					["<F2>"]       = "toggle-fullscreen",
					-- Only valid with the 'builtin' previewer
					["<F3>"]       = "toggle-preview-wrap",
					["<F4>"]       = "toggle-preview",
					-- Rotate preview clockwise/counter-clockwise
					["<F5>"]       = "toggle-preview-ccw",
					["<F6>"]       = "toggle-preview-cw",
					["<S-down>"]   = "preview-page-down",
					["<S-up>"]     = "preview-page-up",
					['<M-down']    = 'preview-down',
					['<M-up>']     = 'preview-up',
					["<C-h>"]      = "preview-page-up",
					["<C-l>"]      = "preview-page-down",
					["<M-S-down>"] = "preview-down",
					["<M-S-up>"]   = "preview-up",
				},
				fzf = {
					false, -- disable default keymap
					['ctrl-y'] = 'preview-up',
					['ctrl-e'] = 'preview-down',
					['ctrl-b'] = 'preview-page-up',
					['ctrl-f'] = 'preview-page-down',
					['alt-k'] = 'preview-up',
					['alt-j'] = 'preview-down',
					['shift-down'] = 'preview-page-down',
					['shift-up'] = 'preview-page-up',
					['ctrl-h'] = 'preview-half-page-up',
					['ctrl-l'] = 'preview-half-page-down',
					['ctrl-u'] = 'half-page-up',
					['ctrl-d'] = 'half-page-down',
				}
			},
			fzf_opts   = {
				["--layout"] = "default",
			},
			actions    = {
				files = {
					-- inherits from 'actions.files', here we can override
					-- or set bind to 'false' to disable a default action
					-- action to toggle `--no-ignore`, requires fd or rg installed
					["enter"]  = actions.file_switch_or_edit,
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
					["ctrl-t"] = actions.file_tabedit,
					["alt-q"]  = actions.file_sel_to_qf,
					["alt-Q"]  = actions.file_sel_to_ll,
				},
			},
			files      = {
				previewer              = "bat",
				prompt                 = 'Files❯ ',
				multiprocess           = true, -- run command in a separate process
				git_icons              = true, -- show git icons?
				file_icons             = true, -- show file icons (true|"devicons"|"mini")?
				color_icons            = true, -- colorize file|git icons
				-- path_shorten   = 1,              -- 'true' or number, shorten path?
				-- Uncomment for custom vscode-like formatter where the filename is first:
				-- e.g. "fzf-lua/previewer/fzf.lua" => "fzf.lua previewer/fzf-lua"
				-- formatter      = "path.filename_first",
				-- executed command priority is 'cmd' (if exists)
				-- otherwise auto-detect prioritizes `fd`:`rg`:`find`
				-- default options are controlled by 'fd|rg|find|_opts'
				-- NOTE: 'find -printf' requires GNU find
				-- cmd            = "find . -type f -printf '%P\n'",
				find_opts              = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
				rg_opts                = [[--color=never --files --hidden --follow -g "!.git"]],
				fd_opts                = [[--color=never --type f --hidden --follow --exclude .git]],
				-- by default, cwd appears in the header only if {opts} contain a cwd
				-- parameter to a different folder than the current working directory
				-- uncomment if you wish to force display of the cwd as part of the
				-- query prompt string (fzf.vim style), header line or both
				-- cwd_header = true,
				cwd_prompt             = true,
				cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
				cwd_prompt_shorten_val = 1, -- shortened path parts length
				toggle_ignore_flag     = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
				toggle_hidden_flag     = "--hidden", -- flag toggled in `actions.toggle_hidden`
				actions                = {
					-- inherits from 'actions.files', here we can override
					-- or set bind to 'false' to disable a default action
					-- action to toggle `--no-ignore`, requires fd or rg installed
					-- ["enter"]  = actions.file_switch_or_edit,
					-- ["ctrl-s"] = actions.file_split,
					-- ["ctrl-v"] = actions.file_vsplit,
					-- ["ctrl-t"] = actions.file_tabedit,
					-- ["alt-q"]  = actions.file_sel_to_qf,
					-- ["alt-Q"]  = actions.file_sel_to_ll,
				}
			},
			buffers    = {
				prompt         = 'Buffers❯ ',
				file_icons     = true, -- show file icons (true|"devicons"|"mini")?
				color_icons    = true, -- colorize file|git icons
				sort_lastused  = true, -- sort buffers() by last used
				show_unloaded  = true, -- show unloaded buffers
				cwd_only       = false, -- buffers for the cwd only
				cwd            = nil, -- buffers list for a given dir
				ignore_current = true, -- ignore the current buffer when switching buffers
				actions        = {
					["ctrl-x"] = actions.buf_del,
				},
			},
		})

		-- vim.g.layout = { window = { width = 1.0, height = 0.5, highlight = 'Comment', rounded = false } }
		-- vim.g.fzf_preview_window = { 'right:60%' }
		-- vim.g.fzf_preview = { 'bat', '--style=numbers', '--line-range', ':300 {}' }
		-- vim.g.fzf_buffers_jump = 1
		-- vim.env.FZF_DEFAULT_OPTS = "--bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up," ..
		-- 	"ctrl-f:preview-page-down,alt-up:preview-up,alt-down:preview-down," ..
		-- 	"ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down," ..
		-- 	"ctrl-u:half-page-up,ctrl-d:half-page-down"
		local keyset = vim.keymap.set
		keyset('n', '<C-/>', '<cmd>FzfLua blines<CR>', { silent = true, noremap = true })
		keyset('n', '<C-_>', '<cmd>FzfLua blines<CR>', { silent = true, noremap = true })
		keyset('n', '<C-f>', '<cmd>FzfLua files<CR>', { silent = true, noremap = true })
		keyset('n', '<C-b>', '<cmd>Buffers<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>f', '<cmd>FzfLua files<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>b', '<cmd>Buffers<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>/.', '<cmd>FzfLua blines<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>/b', '<cmd>FzfLua blines<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>//', '<cmd>Lines<CR>', { silent = true, noremap = true })
		keyset('n', '<c-g>', '<cmd>FzfLua git_files<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>gs', '<cmd>FzfLua git_files<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>gf', '<cmd>FzfLua git_files<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>m', '<cmd>FzfLua marks<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>M', '<cmd>FzfLua keymaps<CR>', { silent = true, noremap = true })

		keyset('i', '<C-_>', '<cmd>FzfLua keymaps i<CR>', { silent = true, noremap = true, expr = false })
		keyset('x', '<C-_>', '<cmd>FzfLua keymaps x<CR>', { silent = true, noremap = true, expr = false })
		keyset('o', '<C-_>', '<cmd>FzfLua keymaps o<CR>', { silent = true, noremap = true, expr = false })
		keyset('n', '<leader>C', '<cmd>FzfLua git_commits<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>H', '<cmd>FzfLua helptags<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hh', '<cmd>FzfLua oldfiles<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>h:', '<cmd>FzfLua command_history<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hc', '<cmd>FzfLua command_history<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>h/', '<cmd>FzfLua search_history<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hs', '<cmd>FzfLua search_history<<CR>', { silent = true, noremap = true })

		vim.api.nvim_create_user_command('Rg',
			function(opts)
				require('fzf-lua').grep_project({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Help',
			function(opts)
				require('fzf-lua').helptags({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Man',
			function(opts)
				require('fzf-lua').manpages({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Manpages',
			function(opts)
				require('fzf-lua').manpages({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Maps',
			function(opts)
				require('fzf-lua').keymaps({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('IMap',
			function(opts)
				require('fzf-lua').keymaps({ search = opts.fargs[1]
				})
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Packadd',
			function(opts)
				require('fzf-lua').packadd({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Files',
			function(opts)
				require('fzf-lua').files({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Lines',
			function(opts)
				require('fzf-lua').lines({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('BLines',
			function(opts)
				require('fzf-lua').blines({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Tabs',
			function(opts)
				require('fzf-lua').tabs({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('SearchHistory',
			function(opts)
				require('fzf-lua').search_history({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('SHistory',
			function(opts)
				require('fzf-lua').search_history({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('CommandHistory',
			function(opts)
				require('fzf-lua').command_history({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('History',
			function(opts)
				require('fzf-lua').command_history({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('CHistory',
			function(opts)
				require('fzf-lua').command_history({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('FileHistory',
			function(opts)
				require('fzf-lua').oldfiles({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('FHistory',
			function(opts)
				require('fzf-lua').oldfiles({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Locations',
			function(opts)
				require('fzf-lua').loclist({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('LocationStack',
			function(opts)
				require('fzf-lua').loclist_stack({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Args',
			function(opts)
				require('fzf-lua').args({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Marks',
			function(opts)
				require('fzf-lua').marks({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Jumps',
			function(opts)
				require('fzf-lua').jumps({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Changes',
			function(opts)
				require('fzf-lua').changes({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Registers',
			function(opts)
				require('fzf-lua').registers({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('AutoCmds',
			function(opts)
				require('fzf-lua').autocmds({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Menus',
			function(opts)
				require('fzf-lua').menus({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('GitFiles',
			function(opts)
				require('fzf-lua').git_files({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('GitStatus',
			function(opts)
				require('fzf-lua').git_status({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('GitBranches',
			function(opts)
				require('fzf-lua').git_branches({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('GitCommits',
			function(opts)
				require('fzf-lua').git_commits({ search = opts.fargs[1] })
			end,
			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('GitBCommits',
			function(opts)
				require('fzf-lua').git_bcommits({ search = opts.fargs[1] })
			end,

			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('Buffers',
			function(opts)
				require('fzf-lua').buffers({ search = opts.fargs[1] })
			end,

			{ nargs = "*" }
		)
		vim.api.nvim_create_user_command('FzfResume',
			function(opts)
				require('fzf-lua').resume({ search = opts.fargs[1] })
			end,

			{ nargs = "*" }
		)
	end
}
