return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	},
	config = function()
		local builtin = require('telescope.builtin')
		pcall(require('telescope').load_extension, 'fzf')
		vim.keymap.set('n', '<leader>//', function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
				theme = 'rose-pine'
			})
		end, { desc = '[/] Fzf current buffer' })
		vim.keymap.set('n', '<leader>/s', builtin.buffers, { desc = '[s] Search Buffers' })
		vim.keymap.set('n', '<leader>/o', builtin.oldfiles, { desc = '[o] Search Old files' })
		vim.keymap.set('n', '<leader>/f', builtin.find_files, { desc = '[f] Search files' })
		vim.keymap.set('n', '<leader>/g', builtin.git_files, { desc = '[g] Search git repository files' })
		vim.keymap.set('n', '<leader>/h', builtin.help_tags, { desc = '[h] Search help' })
		vim.keymap.set('n', '<leader>/w', builtin.grep_string, { desc = '[w] Search current word' })
		vim.keymap.set('n', '<leader>/l', builtin.live_grep, { desc = '[l] Search live grep' })
		vim.keymap.set('n', '<leader>/d', builtin.diagnostics, { desc = '[d] Search diagnostics' })
	end
}
