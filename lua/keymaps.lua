local keyset = vim.keymap.set
keyset('n', '<Leader><S-a>', '<cmd>Alpha<CR>', { silent = true, noremap = true })
keyset('n', '<Leader>ch', '<cmd>CopilotChat<CR>', { silent = true, noremap = true })
keyset("n", "<leader>ccq",
	function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
		end
	end,
	{ silent = true, noremap = true }
)
keyset("x", "<leader>ccq",
	function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
		end
	end,
	{ silent = true, noremap = true }
)
keyset("o", "<leader>ccq",
	function()
		local input = vim.fn.input("Quick Chat: ")
		if input ~= "" then
			require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
		end
	end,
	{ silent = true, noremap = true }
)
keyset("n", "<leader>cP",
	function()
		local actions = require("CopilotChat.actions")
		require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
	end,
	{ silent = true, noremap = true }
)
keyset("x", "<leader>cP",
	function()
		local actions = require("CopilotChat.actions")
		require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
	end,
	{ silent = true, noremap = true }
)
keyset("o", "<leader>cP",
	function()
		local actions = require("CopilotChat.actions")
		require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
	end,
	{ silent = true, noremap = true }
)

-- keyset("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true, noremap = true })
-- keyset("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true, noremap = true })
-- vim.api.nvim_set_keymap('i', 'jk', '<Plug>(eskk#toggle)', { expr = true })
-- vim.api.nvim_set_keymap('c', 'jk', '<Plug>(eskk:toggle)', { noremap = true })
