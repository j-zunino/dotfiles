local function opts(desc)
    return vim.tbl_extend(
        'force',
        { noremap = true, silent = true },
        { desc = desc }
    )
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- disable other space keybinds
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', opts('Clear search highlight'))

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts('Save file'))

vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts('Quit file'))

vim.keymap.set('n', 'x', '"_x', opts('Delete whitout saving intro register'))
vim.keymap.set('n', 'X', '"_X', opts('Delete whitout saving intro register'))

vim.keymap.set(
    'v',
    'p',
    '"_dP',
    { desc = 'Paste whiout saving intro register' }
)
vim.keymap.set(
    'n',
    'P',
    ':put!<CR>`[v`]=',
    { desc = 'Paste whitout saving intro registere' }
)

vim.keymap.set({ 'n', 'v' }, 'J', '5j', opts('Move down 5 lines'))
vim.keymap.set({ 'n', 'v' }, 'K', '5k', opts('Move up 5 lines'))

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts('Scroll down'))
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts('Scroll up'))

vim.keymap.set('n', 'n', 'nzz', opts('Find next'))
vim.keymap.set('n', 'N', 'Nzz', opts('Find previous'))

vim.keymap.set('n', '<leader>J', ':move +1<CR>', opts('Move line down'))
vim.keymap.set('n', '<leader>K', ':move -2<CR>', opts('Move line up'))

vim.keymap.set('n', 'U', '<C-r>', { desc = 'Undo' })

vim.keymap.set('n', 'yA', ':%y<cr>', { desc = 'Copy all' })

-- copy line
vim.keymap.set('n', 'Y', 'yy', { desc = 'Copy line' })

-- copy line up/down
vim.keymap.set('n', 'yJ', 'Yp', { desc = 'Copy line down' })
vim.keymap.set('n', 'yK', 'YP', { desc = 'Copy line up' })

-- toggle comment
-- vim.keymap.set(
--     'n',
--     '<C-}>',
--     ":lua require('Comment.api').toggle.linewise.current()<CR>",
--     opts('Toggle Comment')
-- )
-- vim.keymap.set(
--     'v',
--     '<C-}>',
--     ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--     opts('Toggle comment visual mode')
-- )

-- vim.keymap.set('n', '<C-}>', function() require('mini.comment').toggle() end, { desc = 'Toggle Comment' })
--         vim.keymap.set('v', '<C-}>', function() require('mini.comment').toggle() end, { desc = 'Toggle Comment (visual mode)' })

vim.keymap.set('n', '<leader>+', '<C-a>', opts('Increment number'))
vim.keymap.set('n', '<leader>-', '<C-x>', opts('Decrement number'))

vim.keymap.set(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Go to previous diagnostic message' }
)
vim.keymap.set(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Go to next diagnostic message' }
)
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Show diagnostic error messages' }
)
vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic quickfix list' }
)

-- highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup(
        'kickstart-highlight-yank',
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts('Next buffer'))
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts('previous buffer'))

vim.keymap.set('n', '<leader>x', ':bdelete<CR>', opts('Close buffer'))
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts('Create new buffer'))

vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w>w',
    { desc = 'Move focus to the next window' }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w>W',
    { desc = 'Move focus to the previous window' }
)

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
        vim.cmd('vertical resize +5')
    else
        vim.cmd('wincmd l | vertical resize -5')
    end
    vim.cmd(original_win .. 'wincmd w')
end

-- function to decrease the width of the current split
local function decrease_width()
    local original_win = vim.fn.winnr()
    if is_left_split() then
        vim.cmd('vertical resize -5')
    else
        vim.cmd('wincmd l | vertical resize +5')
    end
    vim.cmd(original_win .. 'wincmd w')
end

-- set keybindings
vim.keymap.set('n', '<C-l>', increase_width, opts('Increase split width'))
vim.keymap.set('n', '<C-h>', decrease_width, opts('decrease split width'))
vim.keymap.set('n', '+', '<C-w>+', opts('Increase split height'))
vim.keymap.set('n', '-', '<C-w>-', opts('Decrease split height'))
