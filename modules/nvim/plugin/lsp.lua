vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/folke/lazydev.nvim',
    'https://github.com/yioneko/nvim-vtsls',
})

require('lazydev').setup({
    library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } },
})
