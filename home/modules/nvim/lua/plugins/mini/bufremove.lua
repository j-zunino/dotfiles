local opts = { noremap = true, silent = true }
local bufremove = require('mini.bufremove')

opts.desc = 'Close buffer'
vim.keymap.set('n', '<leader>x', require('mini.bufremove').delete, opts)
vim.keymap.set('n', '<leader>bx', require('mini.bufremove').delete, opts)

opts.desc = 'New buffer'
vim.keymap.set('n', '<leader>bn', ':enew<CR>', opts)

return {
    bufremove.setup(),
}
