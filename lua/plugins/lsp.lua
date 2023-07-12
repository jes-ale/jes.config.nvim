return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		{ 'williamboman/mason.nvim', opts = {} },
		{ 'folke/neodev.nvim',       opts = {} },
		{ 'j-hui/fidget.nvim',       opts = {},       tag = 'legacy' },
		{ 'folke/neoconf.nvim',      cmd = "Neoconf", config = true },
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		local on_attach = function(_, bufnr)
			local nmap = function(keys, func, desc)
				if desc then
					desc = 'LSP: ' .. desc
				end

				vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
			end
			nmap('<leader>lr', vim.lsp.buf.rename, '[r] Rename')
			nmap('<leader>la', vim.lsp.buf.code_action, '[r] Code Action')
			nmap('<leader>lD', vim.lsp.buf.declaration, '[D] Go to declaration')
			nmap('<leader>ld', vim.lsp.buf.definition, '[d] Go to definition')
			nmap('<leader>lT', vim.lsp.buf.type_definition, '[T] Type definition')
			nmap('<leader>g', require('telescope.builtin').lsp_references, '[g] Go to references')
			nmap('<leader>li', vim.lsp.buf.implementation, '[i] Go to implementation')
			nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[s] Document symbols')
			nmap('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w] Workspace symbols')
			nmap('<leader>lh', vim.lsp.buf.hover, '[h] Hover Documentation')
			nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
			vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
				vim.lsp.buf.format()
			end, { desc = 'Format current buffer' })
		end
		local servers = {
			rust_analyzer = {},
			tsserver = {},
			volar = {},
			lemminx = {},
			html = {},
			jsonls = {},
			cssls = {},
			tailwindcss = {},
			pylsp = {},
			gradle_ls = {},
			kotlin_language_server = {},
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					globals = { 'vim' },
				},
			},
		}
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
		local mason_lspconfig = require 'mason-lspconfig'
		mason_lspconfig.setup {
			ensure_installed = vim.tbl_keys(servers),
		}
		mason_lspconfig.setup_handlers {
			function(server_name)
				require('lspconfig')[server_name].setup {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
				}
			end,
		}
	end
}
