return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
        'yioneko/nvim-vtsls',
        ft = {
            'javascript',
            'typescript',
            'javascript.jsx',
            'typescript.tsx',
            'javascriptreact',
            'typescriptreact',
        },
    },
}
