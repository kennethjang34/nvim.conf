return {
	'chipsenkbeil/distant.nvim',
	branch = 'v0.2',
	config = function()
		require('distant').setup {
			['*'] = require('distant.settings').chip_default(), {
			ssh = {
				identity_files = { '~/.ssh/id_ed25519' } }
		} }
	end
}
