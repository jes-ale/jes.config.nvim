return {
	'folke/which-key.nvim',
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	event = "VeryLazy",
	opts = {
		plugins = { spelling = true },
		defaults = {
			mode = { "n", "v" },
			["c]"] = { name = "+next" },
			["c["] = { name = "+prev" },
			["cg"] = { name = "+goto" },
			["<leader>l"] = { name = "+lsp" },
			["<leader>b"] = { name = "+buffer" },
			["<leader>c"] = { name = "+code" },
			["<leader>/"] = { name = "+find" },
			["<leader>u"] = { name = "+ui" },
			["<leader>un"] = { name = "+noice" },
			["<leader>d"] = { name = "+diagnostics/quickfix" },
			["<leader>h"] = { name = "+harpoon" },
			["<leader>r"] = { name = "+replace" },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.defaults)
	end,
}
