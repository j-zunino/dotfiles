local opts = { noremap = true, silent = true }

opts.desc = 'Open LazyGit'
vim.keymap.set('n', '<leader>lg', '<cmd>lua Snacks.lazygit.open()<CR>', opts)
