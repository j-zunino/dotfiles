vim.cmd('language en_US.UTF-8')

require('core.options')
require('core.keymaps')
require('core.tabline')

-- neovim VSCode extension
if vim.g.vscode then
    require('vscode.vscode')
else
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
    end ---@diagnostic disable-next-line: undefined-field

    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup({
        require('plugins.autopairs'),
        require('plugins.cmp'),
        require('plugins.colorizer'),
        require('plugins.comment'),
        require('plugins.conform'),
        require('plugins.gitsings'),
        require('plugins.lsp'),
        require('plugins.lualine'),
        require('plugins.mini'),
        require('plugins.neo-tree'),
        require('plugins.telescope'),
        require('plugins.template-string'),
        require('plugins.theme'),
        require('plugins.todo-comments'),
        require('plugins.treesitter'),
        require('plugins.which-key'),
    },
    {
        ui = {
            icons = vim.g.have_nerd_font and {} or {
                cmd = '⌘',
                config = '🛠',
                event = '📅',
                ft = '📂',
                init = '⚙',
                keys = '🗝',
                plugin = '🔌',
                runtime = '💻',
                require = '🌙',
                source = '📄',
                start = '🚀',
                task = '📌',
                lazy = '💤 ',
            },
        },
    })
end
-- vim: ts=2 sts=2 sw=2 et
