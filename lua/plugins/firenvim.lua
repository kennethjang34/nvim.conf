return {
	'glacambre/firenvim',
	build = ":call firenvim#install(0)",
	init = function()
		vim.api.nvim_create_augroup("Firenvim", { clear = true })
		vim.api.nvim_create_autocmd({ 'UIEnter' },
			{
				group = "Firenvim",
				callback = function(event)
					local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
					if client ~= nil and client.name == "Firenvim" then
						vim.o.laststatus = 0
					end
				end
			})
	end,
	config = function()
		vim.g.firenvim_config = {
			-- globalSettings = { alt = "all" },
			localSettings = {
				[".*"] = { takeover = "never" }
				-- [".*"] = {
				-- 	cmdline  = "neovim",
				-- 	content  = "text",
				-- 	priority = 0,
				-- 	selector = "textarea",
				-- 	takeover = "never"
				-- }
			}
		}
	end,
}
