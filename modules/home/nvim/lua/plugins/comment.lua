return {
    'echasnovski/mini.comment',
    lazy = true,
    keys = '<C-}>',
    event = { 'BufReadPost' },
    dependencies = {
        {
            'JoosepAlviste/nvim-ts-context-commentstring',
            lazy = true,
            event = { 'InsertLeave' },
        },
    },

    config = function()
        require('ts_context_commentstring').setup({
            enable_autocmd = false,
        })

        require('mini.comment').setup({
            options = {
                ignore_blank_line = false,
                custom_commentstring = function()
                    return require('ts_context_commentstring').calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
            mappings = {
                comment = '<C-}>',

                comment_line = '<C-}>',

                comment_visual = '<C-}>',

                textobject = '<C-}>',
            },
        })
    end,
}
