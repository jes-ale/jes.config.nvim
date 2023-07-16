return {
	'nvim-telescope/telescope-fzf-native.nvim',
	event = "VeryLazy",
	build = 'make',
	cond = function()
		return vim.fn.executable 'make' == 1
	end,
}
