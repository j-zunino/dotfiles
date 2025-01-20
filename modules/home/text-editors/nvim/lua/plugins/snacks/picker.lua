local opts = { noremap = true, silent = true }

-- vim.keymap.set(
--     'n',
--     '<leader>sc',
--     builtin.spell_suggest,
--     { desc = 'Spell suggest Telescope' }
-- )

opts.desc = 'Search files'
vim.keymap.set('n', '<leader>sf', ':lua Snacks.picker.files()<CR>', opts)

-- Grep
opts.desc = 'Search by Grep'
vim.keymap.set('n', '<leader>sg', ':lua Snacks.picker.grep()<CR>', opts)

opts.desc = 'Search word'
vim.keymap.set('n', '<leader>sw', ':lua Snacks.picker.grep_word()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set('n', '<leader>s/', ':lua Snacks.picker.grep_word()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set('n', '<leader>/', ':lua Snacks.picker.lines()<CR>', opts)

-- Git
opts.desc = 'Search Git status'
vim.keymap.set('n', '<leader>sG', ':lua Snacks.picker.git_status()<CR>', opts)

-- Other
opts.desc = 'Search help'
vim.keymap.set('n', '<leader>sh', ':lua Snacks.picker.help()<CR>', opts)

opts.desc = 'Search keymaps'
vim.keymap.set('n', '<leader>sk', ':lua Snacks.picker.keymaps()<CR>', opts)

opts.desc = 'Search diagnostics'
vim.keymap.set('n', '<leader>sd', ':lua Snacks.picker.diagnostics()<CR>', opts)

opts.desc = 'Search resume'
vim.keymap.set('n', '<leader>sR', ':lua Snacks.picker.resume()<CR>', opts)

opts.desc = 'Search recent'
vim.keymap.set('n', '<leader>sr', ':lua Snacks.picker.recent()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set(
    'n',
    '<leader><leader>',
    ':lua Snacks.picker.grep_word()<CR>',
    opts
)
