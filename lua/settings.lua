vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 100
vim.o.timeout = true
vim.o.timeoutlen = 150
vim.o.completeopt = 'menuone,noselect'
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
-- Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("v", "<Tab>", function()
  indent_lines_by_type(">")
end, { silent = true, noremap = true })
vim.keymap.set("v", "<S-Tab>", function()
  indent_lines_by_type("<")
end, { silent = true, noremap = true })

function indent_lines_by_type(indent_type)
  local line_start = vim.fn.line("v")
  local line_end = vim.fn.line(".")
  local current_mode = vim.api.nvim_get_mode()

  local indent = function(start, stop, ind_type)
    vim.cmd(start .. "," .. stop .. ind_type)
  end

  if line_start == line_end then
    vim.cmd(indent_type)
  else
    local lines = math.abs(line_end - line_start)
    local direction = line_start >= line_end and "j" or "k"

    indent(line_start, line_end, indent_type)
    vim.api.nvim_win_set_cursor(0, { line_start, 0 })
    vim.api.nvim_input(current_mode.mode .. lines .. direction)
  end
end
