return {
	{ 'nvim-lua/plenary.nvim',         lazy = false },
	'gioele/vim-autoswap',
	{ 'vim-airline/vim-airline-themes' },
	'tpope/vim-repeat',
	build = 'make sync',
	'airblade/vim-rooter',
	{ 'williamboman/nvim-lsp-installer', enable = false },
	'ryanoasis/vim-devicons',
	'airblade/vim-gitgutter',
	{ 'alvan/vim-closetag',              enable = false },
	-- 'famiu/nvim-reload',
	'tpope/vim-surround',
	'tpope/vim-fugitive',
	{ 'dccsillag/magma-nvim', build = ':UpdateRemotePlugins' },
	'nvim-tree/nvim-web-devicons',
	'honza/vim-snippets',
}
