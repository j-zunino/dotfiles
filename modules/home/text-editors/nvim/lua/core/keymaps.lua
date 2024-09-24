local opts = { noremap = true, silent = true }
----------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable other space keybinds
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-- hide hls
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts)

-- save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- delete/paste without saving into register
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('n', 'X', '"_X', opts)

vim.keymap.set('v', 'p', '"_dP', opts)


-- move cursor 5 lines
vim.keymap.set({ 'n', 'v' }, 'J', '5j')
vim.keymap.set({ 'n', 'v' }, 'K', '5k')

-- center vertical scroll
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- center find
vim.keymap.set('n', 'n', 'nzz', opts)
vim.keymap.set('n', 'N', 'Nzz', opts)
--vim.keymap.set('n', 'n', 'nzzzv', opts)


-- skip folds
vim.cmd 'nmap j gj'
vim.cmd 'nmap k gk'

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- redo
vim.keymap.set('n', 'U', '<C-r>')

-- copy all
vim.keymap.set('n', 'yA', ':%y<cr>')

-- copy line
vim.keymap.set('n', 'Y', 'yy')
-- vim.keymap.set("n", "Y", "^y$")

-- copy line up/down
vim.keymap.set('n', 'yJ', 'Yp')
vim.keymap.set('n', 'yK', 'YP')

-- highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


-- buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

-- move focus to next/prev window
vim.keymap.set('n', '<C-j>', '<C-w>w', { desc = 'Move focus to the next window' })
vim.keymap.set('n', '<C-k>', '<C-w>W', { desc = 'Move focus to the previous window' })

-- split width
vim.keymap.set('n', '<C-w>s', '<cmd>split<CR>', { desc = 'Split horizontal' })
vim.keymap.set('n', '<C-w>v', '<cmd>vsplit<CR>', { desc = 'Split vertical' })

-- function to check if the current split is on the left
local function is_left_split()
  return vim.fn.winnr() == 1
end

-- function to increase the width of the current split
local function increase_width()
  local original_win = vim.fn.winnr()
  if is_left_split() then
    vim.cmd 'vertical resize +5'
  else
    vim.cmd 'wincmd l | vertical resize -5'
  end
  vim.cmd(original_win .. 'wincmd w')
end

-- function to decrease the width of the current split
local function decrease_width()
  local original_win = vim.fn.winnr()
  if is_left_split() then
    vim.cmd 'vertical resize -5'
  else
    vim.cmd 'wincmd l | vertical resize +5'
  end
  vim.cmd(original_win .. 'wincmd w')
end

-- set keybindings
vim.keymap.set('n', '<C-l>', increase_width, opts)
vim.keymap.set('n', '<C-h>', decrease_width, opts)
vim.keymap.set('n', '+', '<C-w>+', { silent = true })
vim.keymap.set('n', '-', '<C-w>-', { silent = true })
