--
-- there is a lua syntax bug in neovim v0.9.4 (bug exists since after v0.7.4)
-- the following line is a workaround for the bug by using the lua syntax file from v0.7.2
-- curl -sS https://raw.githubusercontent.com/neovim/neovim/v0.7.2/runtime/syntax/lua.vim > $VIMRUNTIME/syntax/lua.vim
--
vim.g.ts_highlight_lua = true
vim.g.leetcode_browser = 'chrome'
vim.g.leetcode_solution_filetype = 'python3'
vim.g.leetcode_hide_paid_only = true
vim.g.vimwiki_key_mappings = { all_maps = 0 }
vim.g.mapleader = " "
vim.g.XkbSwitchLib = "/usr/local/lib/libInputSourceSwitcher.dylib"
vim.g.XkbSwitchEnabled = 1
vim.opt.ttimeoutlen = 50

require("keymaps")
require('load_lazy')
vim.o.background = "dark"
local api = vim.api
local keyset = vim.keymap.set
vim.opt.termguicolors = true

vim.api.nvim_set_option('hlsearch', false)
vim.opt.autoindent = false
vim.opt.signcolumn = "yes"
vim.api.nvim_create_user_command('W', function(opts)
	vim.cmd('w')
end, { nargs = 0 })
vim.api.nvim_create_user_command('Wq', function(opts)
	vim.cmd('w')
	vim.cmd('q')
end, { nargs = 0 })
vim.api.nvim_create_user_command('WQ', function(opts)
	vim.cmd('w')
	vim.cmd('q')
end, { nargs = 0 })
vim.api.nvim_create_user_command('WQa', function(opts)
	vim.cmd('w')
	vim.cmd('q')
	vim.cmd('a')
end, { nargs = 0 })
vim.api.nvim_create_user_command('WQA', function(opts)
	vim.cmd('w')
	vim.cmd('q')
	vim.cmd('a')
end, { nargs = 0 })
vim.api.nvim_create_user_command('Wqa', function(opts)
	vim.cmd('w')
	vim.cmd('q')
	vim.cmd('a')
end, { nargs = 0 })
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = vim }
keyset("n", "<C-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
keyset("v", "<C-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
keyset("n", "<C-p>", '"+p', { noremap = true, silent = true })
keyset("v", "<C-v>", '"+p', { noremap = true, silent = true })
keyset("v", "<C-p>", '"+p', { noremap = true, silent = true })
api.nvim_create_augroup("saved", { clear = true })
api.nvim_create_autocmd("BufWritePost",
	{ group = "saved", pattern = "init.lua", command = "source $MYVIMRC" })
api.nvim_create_autocmd("BufWritePost",
	{ group = "saved", pattern = "init.lua", command = "luafile $HOME/.config/nvim/lua/init.lua" })
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})
-- jump to the last cursor position when reopening a file if it is within the range of lines in the file
api.nvim_create_autocmd(
	"BufReadPost",
	{ command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)
--vim.opt.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 450
vim.o.confirm = true
keyset('n', '<c-l>', '<cmd>wincmd l<cr>', { silent = true, noremap = true })
keyset('n', '<c-h>', '<cmd>wincmd h<cr>', { silent = true, noremap = true })

keyset('n', '<c-j>', '<cmd>wincmd j<cr>', { silent = true, noremap = true })
keyset('n', '<c-k>', '<cmd>wincmd k<cr>', { silent = true, noremap = true })
vim.opt.wildcharm = vim.api.nvim_replace_termcodes('<C-Z>', true, true, true):byte()

vim.api.nvim_set_keymap('c', '<Up>', [[wildmenumode() ? "\<left>" : "\<up>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Down>', [[wildmenumode() ? "\<right>" : "\<down>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Left>', [[wildmenumode() ? "\<up>" : "\<left>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<Right>', [[wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"]], { expr = true, noremap = true })

vim.api.nvim_set_keymap('c', '<C-k>', [[wildmenumode() ? "\<left>" : "\<C-k>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<C-j>', [[wildmenumode() ? "\<right>" : "\<C-j>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<C-h>', [[wildmenumode() ? "\<up>" : "\<C-h>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', '<C-l>', [[wildmenumode() ? " \<bs>\<C-Z>" : "\<C-l>"]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<M-l>', "<nop>", { noremap = true })

local function is_floating()
	local win_config = vim.api.nvim_win_get_config(0)
	return win_config.relative ~= ""
end

-- helper function for terminal mode keybindings that require escaping into normal mode first.
-- To avoid conflicts with plugins that take over the terminal mode, we use a function to resolve the keybinding.
local function term_normal_mode_binding(key, true_binding, cond_or_false_binding, cond)
	local function resolve_term_key_binding()
		if type(cond_or_false_binding) == "string" then
			if cond == nil then
				error("term_key_binding: both true_binding and false_binding are provided but cond is nil")
			else
				return function()
					if cond() then
						return string.format("<C-\\><C-n>%s", true_binding)
					else
						return string.format("<C-\\><C-n>%s", cond_or_false_binding)
					end
				end
			end
		elseif type(cond_or_false_binding) == "function" then
			cond = cond_or_false_binding
			return function()
				if cond() then
					return string.format("<C-\\><C-n>%s", true_binding)
				else
					return key
				end
			end
		else
			return function()
				return string.format("<C-\\><C-n>%s", true_binding)
			end
		end
	end
	local term_opts = { expr = true, noremap = true, silent = true }
	vim.keymap.set("t", key, resolve_term_key_binding(), term_opts)
end

local function is_not_floating()
	return not is_floating()
end
_G.is_floating = is_floating
term_normal_mode_binding("<C-h>", "<C-w>h", is_not_floating)
term_normal_mode_binding("<C-j>", "<C-w>j", is_not_floating)
term_normal_mode_binding("<C-k>", "<C-w>k", is_not_floating)
term_normal_mode_binding("<C-l>", "<C-w>l", is_not_floating)
term_normal_mode_binding("<ESC>", "", is_not_floating)




-- Run following lines  only if the current buffer is latex or markdown.
-- create autocommands for setting spell and spelllang
texAug = vim.api.nvim_create_augroup("TexMDAugroup", { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == 'tex' or vim.bo.filetype == 'markdown' then
			vim.opt_local['spell'] = true
			vim.opt_local['spelllang'] = 'en_gb'
			vim.opt_local["cursorline"] = false
			vim.opt_local["rnu"] = false
			vim.api.nvim_buf_set_keymap(0, 'i', '<C-Z>', '<c-g>u<Esc>[s1z=`]a<c-g>u',
				{ noremap = true, silent = true })
			vim.api.nvim_buf_set_keymap(0, 'n', '<C-Z>', '[s1z=`]',
				{ noremap = true, silent = true })
		else
		end
	end,
	group = "TexMDAugroup"
})
vim.api.nvim_create_autocmd({ 'UIEnter' }, {
	callback = function(event)
		local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
		if client ~= nil and client.name == "Firenvim" then
			vim.o.laststatus = 0
		end
	end
})
