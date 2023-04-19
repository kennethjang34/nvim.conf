--no longer used
function _G.ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if not name:match('lazy') and not name:match('nvim-tree') then
			--if name:match('init') then
			package.loaded[name] = nil
		end
	end
	require('init')
	vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
