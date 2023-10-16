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
			omnisharp = {
				cmd = { "dotnet", "~/.local/share/bin/omnisharp/OmniSharp.dll" },
				-- Enables support for reading code style, naming convention and analyzer
				-- settings from .editorconfig.
				enable_editorconfig_support = true,
				-- If true, MSBuild project system will only load projects for files that
				-- were opened in the editor. This setting is useful for big C# codebases
				-- and allows for faster initialization of code navigation features only
				-- for projects that are relevant to code that is being edited. With this
				-- setting enabled OmniSharp may load fewer projects and may thus display
				-- incomplete reference lists for symbols.
				enable_ms_build_load_projects_on_demand = false,
				-- Enables support for roslyn analyzers, code fixes and rulesets.
				enable_roslyn_analyzers = true,
				-- Specifies whether 'using' directives should be grouped and sorted during
				-- document formatting.
				organize_imports_on_format = true,
				-- Enables support for showing unimported types and unimported extension
				-- methods in completion lists. When committed, the appropriate using
				-- directive will be added at the top of the current file. This option can
				-- have a negative impact on initial completion responsiveness,
				-- particularly for the first few completion sessions after opening a
				-- solution.
				enable_import_completion = false,
				-- Specifies whether to include preview versions of the .NET SDK when
				-- determining which version to use for project loading.
				sdk_include_prereleases = true,
				-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
				-- true
				analyze_open_documents_only = false,
			},
			rust_analyzer = {},
			dockerls = {},
			bashls = {},
			tsserver = {},
			volar = {},
			lemminx = {},
			html = {},
			jsonls = {},
			cssls = {},
			tailwindcss = {},
			pylsp = {},
			sqlls = {},
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
