vim.g.mapleader = " "
require('load_lazy')
--vim.cmd([[colorscheme gruvbox]])
vim.o.background = "dark"
-- colorscheme is set to gruvbox in plugins/gruvbox.lua
local api = vim.api
local keyset = vim.keymap.set
vim.opt.termguicolors = true
vim.api.nvim_set_option('hlsearch', false)
vim.opt.autoindent = false
--vim.opt.update_time = 300
vim.opt.signcolumn = "yes"
function _G.check_back_space()
	local col = vim.fn.col('.') - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("n", "<C-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
keyset("v", "<C-c>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
keyset("n", "<C-p>", '"+p', { noremap = true, silent = true })
keyset("v", "<C-v>", '"+p', { noremap = true, silent = true })
keyset("v", "<C-p>", '"+p', { noremap = true, silent = true })
api.nvim_create_augroup("saved", { clear = true })
api.nvim_create_autocmd("BufWritePost", { group = "saved", pattern = "init.lua", command = "luafile lua/init.lua" })
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
-- normal mode <c-j> and <c-k> keymaps are configured in plugins/coc.lua
-- keyset('n', 'q:', '<nop>')
-- keyset('n', 'q/', '<nop>')
-- keyset('n', 'q?', '<nop>')
keyset('n', 'q', '<nop>', { silent = true, noremap = true, nowait = true })
