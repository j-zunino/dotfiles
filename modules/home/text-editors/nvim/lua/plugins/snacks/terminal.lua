local opts = { noremap = true, silent = true }

opts.desc = 'Toggle floating terminal'
vim.keymap.set({ 'n', 't' }, '<leader>T', function()
    Snacks.terminal.toggle('zsh', {
        win = {
            border = 'single',
            width = 0.7,
            height = 0.8,
        },
    })
end, opts)

opts.desc = 'Toggle bottom terminal'
vim.keymap.set(
    { 'n', 't' },
    '<C-{>',
    '<cmd>lua Snacks.terminal.toggle()<CR>',
    opts
)

opts.desc = 'Close terminal'
vim.keymap.set('t', '<C-q>', '<cmd>bd!<CR>', opts)

opts.desc = 'Move focus to the next window'
vim.keymap.set('t', '<C-j>', '<cmd>wincmd w<CR>', opts)

opts.desc = 'Move focus to the previous window'
vim.keymap.set('t', '<C-k>', '<cmd>wincmd p<CR>', opts)
