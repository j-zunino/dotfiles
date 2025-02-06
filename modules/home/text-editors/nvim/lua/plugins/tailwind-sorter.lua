return {
    'laytan/tailwind-sorter.nvim',
    lazy = true,
    event = 'LspAttach',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-lua/plenary.nvim',
    },
    build = 'cd formatter && npm ci && npm run build',
    config = function()
        vim.keymap.set(
            'n',
            '<leader>tst',
            ':TailwindSort<CR>',
            { noremap = true, silent = true, desc = 'Sort TailwindCSS' }
        )

        vim.keymap.set('n', '<leader>tss', ':TailwindSortOnSaveToggle<CR>', {
            noremap = true,
            silent = true,
            desc = 'Toggle TailwindCSS sort on save',
        })

        require('tailwind-sorter').setup({
            on_save_enabled = true,
            trim_spaces = true,
        })
    end,
}
