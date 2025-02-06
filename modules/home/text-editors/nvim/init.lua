vim.cmd('language en_US.UTF-8')
vim.opt.spelllang = { 'en_us', 'es' }
vim.opt.spell = true

require('core.options')
require('core.keymaps')
require('core.tabline')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.lsp' },
})
