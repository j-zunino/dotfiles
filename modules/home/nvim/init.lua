vim.cmd('language en_US.UTF-8')
vim.opt.spelllang = { 'en_us', 'es' }
vim.opt.spell = true

require('core.options')
require('core.keymaps')
require('silly.bufline').setup()
require('silly.index')

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

local lazy_config = {
    ui = {
        border = 'single',
        title = ' Lazy ',
        title_pos = 'center',
        backdrop = 100,
        icons = {
            cmd = ' ',
            event = ' ',
            ft = '󰈔 ',
            runtime = ' ',
        },
    },
}

require('lazy').setup({
    { import = 'plugins' },
    { import = 'plugins.lsp' },
}, lazy_config)
