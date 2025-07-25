local map = function(mode, keys, func, desc, opts)
    local options = vim.tbl_extend('force', {
        noremap = true,
        silent = true,
        desc = desc,
    }, opts or {})

    vim.keymap.set(mode, keys, func, options)
end

-------------------------------------------------------------------------------
-- GENERAL
-------------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('n', '<C-s>', ':w<CR>', 'Save file')
map('n', '<C-q>', ':q<CR>', 'Quit file')

map('n', '<Esc>', ':nohls<CR>', 'Clear search highlight')

map('n', '<leader>Tw', '<cmd>set wrap!<CR>', 'Toggle word wrap')

-------------------------------------------------------------------------------
-- EDITING
-------------------------------------------------------------------------------
map('n', '<leader>}', 'gcc', 'Comment line', { remap = true })
map('v', '<leader>}', 'gc', 'Comment lines', { remap = true })

map({ 'n', 'v' }, 'x', '"_x', 'Delete without saving into register')
map({ 'n', 'v' }, 'X', '"_X', 'Delete without saving into register')
map('v', 'p', '"_dP', 'Paste without saving into register')
map('n', 'P', ':put!<CR>`[v`]=', 'Paste without saving into register')

map('n', 'Y', 'yy', 'Yank line')
map('n', 'yA', ':%y<CR>', 'Yank all')
map('n', 'yJ', 'Yp', 'Yank line down')
map('n', 'yK', 'YP', 'Yank line up')

map('v', '<C-j>', ":move '>+1<CR>gv=gv", 'Move line down')
map('v', '<C-k>', ":move '<-2<CR>gv=gv", 'Move line up')

map('n', '<leader>j', 'mzJ`z', 'Join lines')

map('n', 'U', '<C-r>', 'Redo')

map(
    'n',
    '<leader>X',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    'Replace word under cursor'
)

-------------------------------------------------------------------------------
-- NAVIGATION
-------------------------------------------------------------------------------
map({ 'n', 'v' }, 'J', '5j', 'Move down 5 lines')
map({ 'n', 'v' }, 'K', '5k', 'Move up 5 lines')

map({ 'n', 'v' }, '<C-d>', '<C-d>zz', 'Scroll down')
map({ 'n', 'v' }, '<C-u>', '<C-u>zz', 'Scroll up')

map('n', 'n', 'nzz', 'Find next')
map('n', 'N', 'Nzz', 'Find previous')

-------------------------------------------------------------------------------
-- BUFFERS
-------------------------------------------------------------------------------
map('n', '<Tab>', ':bnext<CR>', 'Next buffer')
map('n', '<S-Tab>', ':bprevious<CR>', 'Previous buffer')

-------------------------------------------------------------------------------
-- WINDOWS / SPLITS
-------------------------------------------------------------------------------
map('n', '<C-j>', '<C-w>w', 'Focus next window')
map('n', '<C-k>', '<C-w>W', 'Focus previous window')

map('n', '<C-w>s', ':split<CR>', 'Split horizontal')
map('n', '<C-w>v', ':vsplit<CR>', 'Split vertical')

map('n', '<C-l>', ':vertical resize +5<CR>', 'Increase split width')
map('n', '<C-h>', ':vertical resize -5<CR>', 'Decrease split width')
map('n', '+', '<C-w>+', 'Increase split height')
map('n', '-', '<C-w>-', 'Decrease split height')

-------------------------------------------------------------------------------
-- MISC
-------------------------------------------------------------------------------
map('n', '<leader>L', ':Lazy<CR>', 'Open Lazy')

map('n', 'Q', '<nop>', 'Disable Ex mode')

map(
    'n',
    '<C-f>',
    ':silent !tmux neww tmux_sessionizer<CR>',
    'Open Tmux sessionizer'
)
