local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

opts.desc = 'Clear search highlight'
set('n', '<Esc>', ':nohlsearch<CR>', opts)

opts.desc = 'Save file'
set('n', '<C-s>', '<cmd>w<CR>', opts)

opts.desc = 'Quit file'
set('n', '<C-q>', '<cmd>q<CR>', opts)

opts.desc = 'Next buffer'
set('n', '<Tab>', ':bnext<CR>', opts)

opts.desc = 'previous buffer'
set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- opts.desc = 'Close buffer'
-- vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts)
-- opts.desc = 'Create new buffer'
-- vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts)

opts.desc = 'Delete whitout saving intro register'
set('n', 'x', '"_x', opts)

opts.desc = 'Delete whitout saving intro register'
set('n', 'X', '"_X', opts)

opts.desc = 'Paste whiout saving intro register'
set('v', 'p', '"_dP', opts)

opts.desc = 'Paste whitout saving intro registere'
set('n', 'P', ':put!<CR>`[v`]=', opts)

opts.desc = 'Move down 5 lines'
set({ 'n', 'v' }, 'J', '5j', opts)

opts.desc = 'Move up 5 lines'
set({ 'n', 'v' }, 'K', '5k', opts)

opts.desc = 'Scroll down'
set('n', '<C-d>', '<C-d>zz', opts)

opts.desc = 'Scroll up'
set('n', '<C-u>', '<C-u>zz', opts)

opts.desc = 'Find next'
set('n', 'n', 'nzz', opts)

opts.desc = 'Find previous'
set('n', 'N', 'Nzz', opts)

opts.desc = 'Move line down'
set('n', '<leader>J', ':move +1<CR>', opts)

opts.desc = 'Move line up'
set('n', '<leader>K', ':move -2<CR>', opts)

opts.desc = 'Move line down (Visual)'
set('v', '<leader>J', ":move '>+1<CR>gv=gv", opts)

opts.desc = 'Move line up (Visual)'
set('v', '<leader>K', ":move '<-2<CR>gv=gv", opts)

set('n', 'U', '<C-r>', { desc = 'Undo' })

set('n', 'yA', ':%y<cr>', { desc = 'Copy all' })

set('n', 'Y', 'yy', { desc = 'Copy line' })

set('n', 'yJ', 'Yp', { desc = 'Copy line down' })

set('n', 'yK', 'YP', { desc = 'Copy line up' })

opts.desc = 'Join lines'
set('n', '<leader>j', 'J', opts)

opts.desc = 'Increment number'
set('n', '<leader>+', '<C-a>', opts)

opts.desc = 'Decrement number'
set('n', '<leader>-', '<C-x>', opts)

set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' }
)

set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' }
)

set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Show diagnostic error messages' }
)

set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic quickfix list' }
)

set('n', '<C-j>', '<C-w>w', { desc = 'Move focus to the next window' })
set('n', '<C-k>', '<C-w>W', { desc = 'Move focus to the previous window' })

set('n', '<C-w>s', '<cmd>split<CR>', { desc = 'Split horizontal' })
set('n', '<C-w>v', '<cmd>vsplit<CR>', { desc = 'Split vertical' })

local function is_left_split()
    return vim.fn.winnr() == 1
end

local function increase_width()
    local original_win = vim.fn.winnr()
    if is_left_split() then
        vim.cmd('vertical resize +5')
    else
        vim.cmd('wincmd l | vertical resize -5')
    end
    vim.cmd(original_win .. 'wincmd w')
end

local function decrease_width()
    local original_win = vim.fn.winnr()
    if is_left_split() then
        vim.cmd('vertical resize -5')
    else
        vim.cmd('wincmd l | vertical resize +5')
    end
    vim.cmd(original_win .. 'wincmd w')
end

opts.desc = 'Increase split width'
set('n', '<C-l>', increase_width, opts)

opts.desc = 'decrease split width'
set('n', '<C-h>', decrease_width, opts)

opts.desc = 'Increase split height'
set('n', '+', '<C-w>+', opts)

opts.desc = 'Decrease split height'
set('n', '-', '<C-w>-', opts)

opts.desc = 'Toggle word wrap'
set('n', '<leader>tw', '<cmd>set wrap!<CR>', opts)

opts.desc = 'Open Lazy'
set('n', '<leader>L', '<cmd>Lazy<CR>', opts)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('yighlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
