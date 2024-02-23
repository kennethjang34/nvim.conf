return {
	'preservim/vim-markdown',
	dependencies = {
		{ 'godlygeek/tabular' },
	},
	config = function()
		vim.g.vim_markdown_frontmatter = 1
		vim.g.vim_markdown_toml_frontmatter = 1
		vim.g.vim_markdown_json_frontmatter = 1
		vim.g.vim_markdown_new_list_item_indent = 4
		vim.g.vim_markdown_auto_insert_bullets = 1
	end
}
