local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)

keymap("n", "<leader>dd", ":lua require('duck').hatch('🐈')<CR>", opts)
keymap("n", "<leader>dk", ":lua require('duck').cook()<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>f", ":NvimTreeFocus<CR>", opts)

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", term_opts)

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
