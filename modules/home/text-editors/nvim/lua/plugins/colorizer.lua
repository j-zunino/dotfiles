return {
    'nvchad/nvim-colorizer.lua',
    lazy = true,
    event = { 'BufReadPost' },
    opts = {
        user_default_options = {
            tailwind = true,
        },
    },
}
