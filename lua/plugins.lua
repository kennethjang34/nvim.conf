return {
	{ 'nvim-lua/plenary.nvim',           lazy = false },
	'github/copilot.vim',
	'gioele/vim-autoswap',
	'vim-airline/vim-airline',
	'vim-airline/vim-airline-themes',
	'tpope/vim-repeat',
	'vim-autoformat/vim-autoformat',
	--'junegunn/fzf',
	build = 'make sync',
	--'junegunn/fzf.vim',
	'airblade/vim-rooter',
	'williamboman/nvim-lsp-installer',
	'hrsh7th/nvim-cmp',
	--'untitled-ai/jupyter_ascending.vim',
	--'tpope/vim-dadbod',
	--'kristijanhusak/vim-dadbod-ui',
	'ryanoasis/vim-devicons',
	'airblade/vim-gitgutter',
	'lervag/vimtex',
	'alvan/vim-closetag',
	'famiu/nvim-reload',
	'tpope/vim-surround',
	'tpope/vim-fugitive',
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	{ 'dccsillag/magma-nvim',            build = ':UpdateRemotePlugins' },
	'steelsojka/pears.nvim',
	'nvim-tree/nvim-web-devicons',
}
