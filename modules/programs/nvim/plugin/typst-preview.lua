vim.pack.add({
    {
        src = "https://github.com/chomosuke/typst-preview.nvim",
        version = vim.version.range("v1"),
    },
})

require("typst-preview").setup({
    dependencies_bin = {
        tinymist = vim.fn.exepath("tinymist"),
        websocat = vim.fn.exepath("websocat"),
    },

    extra_args = { "--ignore-system-fonts" },

    get_main_file = function(path_of_buffer)
        return path_of_buffer
    end,
})
