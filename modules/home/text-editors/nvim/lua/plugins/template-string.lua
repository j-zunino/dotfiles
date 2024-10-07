return {
    "axelvc/template-string.nvim",
    config = function()
        require('template-string').setup({
            filetypes = { 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'vue', 'svelte', 'python' },
            jsx_brackets = true,
            remove_template_string = true,
            restore_quotes = {
                normal = [[']],
            },
        })
    end
}
