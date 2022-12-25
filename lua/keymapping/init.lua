local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Note taking -- LaTeX
keymap('n', '<leader>oo', 'lua.require("nabla").popup()<CR>', term_opts)

-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

-- Neovim pet
keymap("n", "<leader>dd", ":lua require('duck').hatch('🐈')<CR>", opts)
keymap("n", "<leader>dk", ":lua require('duck').cook()<CR>", opts)

-- Moving text while highlighted
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Paste but keep buffer
keymap("x", "<leader>p", [["_dP]], opts)

-- LSconfig
vim.keymap.set('n', '<leader>dls', vim.diagnostic.open_float, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":NvimTreeFocus<CR>", opts)

-- Navigation bar
keymap("n", "<Space>", "<Nop>", term_opts)

keymap('n', '<leader>nt', '<Cmd>tabnew<CR>', opts)
-- Move to previous/next
keymap('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Improved searchingkeymap
keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    opts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    opts)
keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], opts)
keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], opts)

keymap('n', '<Leader>l', '<Cmd>noh<CR>', opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
