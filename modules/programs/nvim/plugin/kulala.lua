vim.pack.add({ 'https://github.com/mistweaverco/kulala.nvim' })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'http', 'rest' },
    callback = function()
        vim.filetype.add({ extension = { ['http'] = 'http' } })
        require('kulala').setup({
            global_keymaps = true,
            ui = {
                icons = {
                    inlay = {
                        loading = '',
                        done = '',
                        error = '',
                    },
                },
            },
        })
    end,
})
