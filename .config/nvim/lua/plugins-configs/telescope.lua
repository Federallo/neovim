require('telescope').setup{
	mappings = {
		custom_only = false,
		list = {
			vim.keymap.set('n','<space>t', ':Telescope find_files<CR>', {noremap = true}),
		}
	}
}
