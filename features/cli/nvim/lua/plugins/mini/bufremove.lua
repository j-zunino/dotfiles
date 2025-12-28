local opts = { noremap = true, silent = true, desc = 'Close buffer' }
local bufremove = require('mini.bufremove')

return {
    bufremove.setup(),
    vim.keymap.set('n', '<leader>x', bufremove.delete, opts),
    vim.keymap.set('n', '<leader>bx', bufremove.delete, opts),
}
