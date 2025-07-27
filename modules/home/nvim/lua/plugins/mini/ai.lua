return {
    require('mini.ai').setup({
        custom_textobjects = {
            -- https://github.com/echasnovski/mini.nvim/discussions/1434#discussion-7748816
            e = {
                {
                    '%u[%l%d]+%f[^%l%d]',
                    '%f[^%s%p][%l%d]+%f[^%l%d]',
                    '^[%l%d]+%f[^%l%d]',
                    '%f[^%s%p][%a%d]+%f[^%a%d]',
                    '^[%a%d]+%f[^%a%d]',
                },
                '^().*()$',
            },
        },
    }),
}
