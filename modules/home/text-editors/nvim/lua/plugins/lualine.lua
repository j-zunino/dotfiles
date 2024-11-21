return {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 500,
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = { 'filename', 'diff', 'diagnostics' },
                lualine_b = { '' },
                lualine_c = { '' },
                lualine_x = { '' },
                lualine_y = { 'filetype' },
                lualine_z = { 'location' },
            },
        })
    end,
}
