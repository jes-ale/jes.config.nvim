-- [[ Commented Setting options ]]
-- TODO: comment all settings 
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
vim.o.undofile = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 100
vim.o.timeout = true
vim.o.timeoutlen = 150
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- [[ Uncommented Setting options ]]
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
-- [[ Other configs ]]
-- [[ Highlight on yank ]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
-- [[ General Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "Q", "<nop>")
-- Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', "J", ":m '>+1<CR>gv=gv", { desc = 'Drag down' })
vim.keymap.set('n', "K", ":m '<-2<CR>gv=gv", { desc = 'Drag up' })
vim.keymap.set('n', "<C-d>", "<C-d>zz", { desc = 'Jump down half screen' })
vim.keymap.set('n', "<C-u>", "<C-u>zz", { desc = 'Jump up half screen' })
vim.keymap.set('n', "<leader>f", function() vim.lsp.buf.format() end, { desc = 'LSP format' })
vim.keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace in current buffer' })
-- [[ Diagnostic keymaps ]]
vim.keymap.set('n', '<C-[>', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', '<C-[>', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
