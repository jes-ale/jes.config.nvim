return {
	'ThePrimeagen/harpoon',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		vim.keymap.set("n", "<leader>ha", require('harpoon.mark').add_file, { desc = '[ha] Harpoon add ' })
		vim.keymap.set("n", "<leader>hd", require('harpoon.mark').rm_file, { desc = '[hr] Harpoon remove ' })
		vim.keymap.set("n", "<C-e>", require('harpoon.ui').toggle_quick_menu)
		-- vim.keymap.set("n", "<C-u>", function() require('harpoon.ui').nav_file(1) end)
		-- vim.keymap.set("n", "<C-i>", function() require('harpoon.ui').nav_file(2) end)
		-- vim.keymap.set("n", "<C-o>", function() require('harpoon.ui').nav_file(3) end)
		-- vim.keymap.set("n", "<C-p>", function() require('harpoon.ui').nav_file(4) end)
		vim.keymap.set("n", "<C-[>", require('harpoon.ui').nav_prev)
		vim.keymap.set("n", "<C-]>", require('harpoon.ui').nav_next)
	end
}
