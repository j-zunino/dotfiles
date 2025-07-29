return {
    'axelvc/template-string.nvim',
    ft = {
        'html',
        'vue',
        'svelte',
        'python',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
    },
    config = function()
        require('template-string').setup({
            jsx_brackets = true,
            remove_template_string = true,
            restore_quotes = {
                normal = [[']],
            },
        })
    end,
}
