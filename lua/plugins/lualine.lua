return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = {
		options = {
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			icons_enabled = true,
			theme = 'rose-pine',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = {
				{
					"diagnostics",
					symbols = {
						error = require('utils').icons.diagnostics.Error,
						warn = require('utils').icons.diagnostics.Warn,
						info = require('utils').icons.diagnostics.Info,
						hint = require('utils').icons.diagnostics.Hint,
					},
				},
				{
					"filetype",
					icon_only = true,
					separator = "",
					padding = {
						left = 1, right = 0 }
				},
				{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				{
					function() return require("nvim-navic").get_location() end,
					cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
				},
			},
			lualine_x = {
				{
					function() return require("noice").api.status.command.get() end,
					cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
					color = require('utils').fg("Statement"),
				},
				{
					function() return require("noice").api.status.mode.get() end,
					cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
					color = require('utils').fg("Constant"),
				},
				{
					function() return "  " .. require("dap").status() end,
					cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
					color = require('utils').fg("Debug"),
				},
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = require('utils').fg("Special")
				},
				{
					"diff",
					symbols = {
						added = require('utils').icons.git.added,
						modified = require('utils').icons.git.modified,
						removed = require('utils').icons.git.removed,
					},
				},
			},
			lualine_y = {
				{ "progress", separator = " ",                  padding = { left = 1, right = 0 } },
				{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				function()
					return " " .. os.date("%R")
				end,
			},
		},
		extensions = { "neo-tree", "lazy" },
	}
}
