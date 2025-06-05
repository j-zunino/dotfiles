local map = function(mode, keys, func, desc, opts)
    local options = vim.tbl_extend('force', {
        noremap = true,
        silent = true,
        desc = desc,
    }, opts or {})

    vim.keymap.set(mode, keys, func, options)
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map({ 'n', 'v' }, '<Space>', '<Nop>')

map('n', '<leader>L', '<cmd>Lazy<CR>', 'Open Lazy')

map('n', '<leader>j', 'J', 'Join lines')

map('n', '<leader>tw', '<cmd>set wrap!<CR>', 'Toggle word wrap')

map('n', 'U', '<C-r>', 'Undo')

map('n', '<Esc>', ':nohls<CR>', 'Clear search highlight')

map('n', '<C-s>', ':w<CR>', 'Save file')
map('n', '<C-q>', ':q<CR>', 'Quit file')

map('n', '<Tab>', ':bnext<CR>', 'Next buffer')
map('n', '<S-Tab>', ':bprevious<CR>', 'Previous buffer')

map('n', '<leader>}', 'gcc', 'Comment line', { remap = true })
map('v', '<leader>}', 'gc', 'Comment lines', { remap = true })

map('n', 'x', '"_x', 'Delete without saving into register')
map('n', 'X', '"_X', 'Delete without saving into register')
map('v', 'p', '"_dP', 'Paste without saving into register')
map('n', 'P', ':put!<CR>`[v`]=', 'Paste without saving into register')

map({ 'n', 'v' }, 'J', '5j', 'Move down 5 lines')
map({ 'n', 'v' }, 'K', '5k', 'Move up 5 lines')

map('n', '<leader>J', ':move +1<CR>', 'Move line down')
map('n', '<leader>k', ':move -2<CR>', 'Move line up')
map('v', '<leader>J', ":move '>+1<CR>gv=gv", 'Move line down (Visual)')
map('v', '<leader>k', ":move '<-2<CR>gv=gv", 'Move line up (Visual)')

map({ 'n', 'v' }, '<C-d>', '<C-d>zz', 'Scroll down')
map({ 'n', 'v' }, '<C-u>', '<C-u>zz', 'Scroll up')

map('n', 'n', 'nzz', 'Find next')
map('n', 'N', 'Nzz', 'Find previous')

map('n', 'Y', 'yy', 'Copy line')
map('n', 'yA', ':%y<cr>', 'Copy all')
map('n', 'yJ', 'Yp', 'Copy line down')
map('n', 'yK', 'YP', 'Copy line up')

map('n', '<C-j>', '<C-w>w', 'Move focus to the next window')
map('n', '<C-k>', '<C-w>W', 'Move focus to the previous window')

map('n', '<C-w>s', ':split<CR>', 'Split horizontal')
map('n', '<C-w>v', ':vsplit<CR>', 'Split vertical')

map('n', '<C-l>', ':vertical resize +5<CR>', 'Increase split width')
map('n', '<C-h>', ':vertical resize -5<CR>', 'Decrease split width')
map('n', '+', '<C-w>+', 'Increase split height')
map('n', '-', '<C-w>-', 'Decrease split height')
