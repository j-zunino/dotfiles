local opts = { noremap = true, silent = true }

opts.desc = 'Close buffer'
vim.keymap.set('n', '<leader>x', '<cmd>lua Snacks.bufdelete.delete()<CR>', opts)

opts.desc = 'Close buffer'
vim.keymap.set(
    'n',
    '<leader>bx',
    '<cmd>lua Snacks.bufdelete.delete()<CR>',
    opts
)

opts.desc = 'Close other buffer'
vim.keymap.set('n', '<leader>bo', '<cmd>lua Snacks.bufdelete.other()<CR>', opts)

opts.desc = 'Close all buffers'
vim.keymap.set('n', '<leader>ba', '<cmd>lua Snacks.bufdelete.all()<CR>', opts)

opts.desc = 'New buffer'
vim.keymap.set('n', '<leader>bn', '<cmd>enew<CR>', opts)
