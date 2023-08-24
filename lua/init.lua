vim.g.leetcode_browser = 'chrome'
vim.g.leetcode_solution_filetype = 'python3'
vim.g.leetcode_hide_paid_only = true
vim.g.vimwiki_key_mappings = { all_maps = 0 }
vim.g.mapleader = " "
if os.getenv("NVM_BIN") then
	vim.g.coc_node_path = "$NVM_BIN/node"
end
require('load_lazy')
vim.o.background = "dark"
local api = vim.api
local keyset = vim.keymap.set
vim.opt.termguicolors = true
vim.api.nvim_set_option('hlsearch', false)
vim.opt.autoindent = false
vim.opt.signcolumn = "yes"
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
	{ group = "saved", pattern = "init.lua", command = "luafile $HOME/.config/nvim/lua/init.lua" })
-- Highlight on yank
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
keyset('n', 'q', '<nop>', { silent = true, noremap = true, nowait = true })
keyset('i', '<c-j>', '<cr>', { silent = true, noremap = true })
