return {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
        local lualine = require('lualine')

        local icons = {
            Error = ' ',
            Warn = ' ',
            Hint = '󰌵 ',
            Info = ' ',

            Added = '󱇬 ',
            Modified = ' ',
            Removed = ' ',
        }

        local filetype = { 'filetype', icon_only = true }

        local diagnostics = {
            'diagnostics',
            colored = true,
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = {
                error = icons.Error,
                warn = icons.Warn,
                info = icons.Info,
                hint = icons.Hint,
            },
        }

        local diff = {
            'diff',
            colored = true,
            symbols = {
                added = icons.Added,
                modified = icons.Modified,
                changed = icons.Modified,
                changed_deleted = icons.Modified,
                removed = icons.Removed,
            },
        }

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
                lualine_b = { '' },
                lualine_c = { 'branch' },
                lualine_x = { diff, diagnostics, filetype },
                lualine_y = { '' },
                lualine_z = { '' },
            },
            inactive_sections = {
                lualine_a = { '*' },
                lualine_b = { '*' },
                lualine_c = { '*' },
                lualine_x = { '*' },
                lualine_y = { '*' },
                lualine_z = { '*' },
            },
        })
    end,
}
