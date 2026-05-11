vim.cmd('language en_US.UTF-8')
vim.opt.spelllang = { 'en_us', 'es' }
vim.opt.spell = true

require('core.options')
require('core.keymaps')
require('core.autocmds')
require('core.lsp')

require('silly.index')
