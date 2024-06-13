return {
	'nvim-tree/nvim-tree.lua',
	--enabled = false,
	lazy = false,
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end
		map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
		map("t", "<C-n>", "<C-\\><C-n>:NvimTreeToggle<CR>", { silent = true })
		local M = {}

		local nvim_tree_api = require('nvim-tree.api')
		local api = nvim_tree_api

		function M.print_node_path()
			local node = nvim_tree_api.tree.get_node_under_cursor()
			print(node.absolute_path)
		end

		local function nvim_tree_on_attach(bufnr)
			local function opts(desc)
				return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			nvim_tree_api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set('n', 'q', '',
				{ desc = 'Help', buffer = bufnr, noremap = true, silent = true, nowait = true })
			vim.keymap.set('n', '?', nvim_tree_api.tree.toggle_help,
				{ desc = 'Help', buffer = bufnr, noremap = true, silent = true, nowait = true })
			vim.keymap.set('n', 'p', M.print_node_path,
				{ desc = 'Print', buffer = bufnr, noremap = true, silent = true, nowait = true })
			vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
		end
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			actions = { open_file = { quit_on_open = true, } },
			renderer = {
				group_empty = false,
				full_name = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "▸",
							arrow_open = "-",
						},
						--["default"] = "",
						--["symlink"] = "",
						--["git"] = {
						--["unstaged"] = "✗",
						--["staged"] = "✓",
						--["unmerged"] = "",
						--["renamed"] = "➜",
						--["untracked"] = "★",
						--["deleted"] = "",
						--["ignored"] = "◌"
						--},
						--["folder"] = {
						--["default"] = "",
						--["open"] = "",
						--["empty"] = "",
						--["empty_open"] = "",
						--["symlink"] = "",
						--["symlink_open"] = ""
						--}
					}
				}
				--folder_arrow = {
				--collapsed = "",
				--expanded = "",
				--},
			},
			filters = {
				dotfiles = false,
				custom = {
					"*.pyc",
					".DS_Store",
					"*.png",
					"*.jpg",
					"*.jpeg",
				}
			},
			update_focused_file = {
				enable = true,
				update_root = false,
				ignore_list = {},
			},
			on_attach = nvim_tree_on_attach,
			view = { width = '25%', side = "left" },
		})
		vim.g.nvim_tree_respect_buf_cwd = 0
		vim.api.nvim_create_autocmd({ "VimEnter" }, {
			group = vim.api.nvim_create_augroup("NvimTreeOpen", { clear = true }),
			callback = function(data)
				-- buffer is a [No Name]
				local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if not no_name and not directory then
					return
				end

				-- change to the directory
				if directory then
					vim.cmd.cd(data.file)
				end

				-- open the tree
				require("nvim-tree.api").tree.open()
				--require("nvim-tree.api").tree.toggle()
			end
			--callback = open_nvim_tree
		}
		)
		--vim.api.nvim_create_autocmd("BufEnter", {
		--group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
		--callback = function(bufData)
		--local count = 0
		--for _, v in pairs(vim.api.nvim_list_wins()) do
		--local is_floating = function(win_id)
		--local win_info = vim.api.nvim_win_get_config(win_id)
		--return win_info.relative ~= ""
		--end
		--if is_floating(v) ~= true then
		--count = count + 1
		--end
		--end
		--local directory = vim.fn.isdirectory(bufData.file) == 1
		--local layout = vim.api.nvim_call_function("winlayout", {})
		--if count == 1 and not directory and layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
		--vim.cmd("quit")
		--end
		--end
		--})
	end
}
