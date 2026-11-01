vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/lima1909/resty.nvim",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "http", "rest", "resty" },
    callback = function()
        vim.filetype.add({ extension = { rest = "resty" } })

        require("resty").setup({
            output = { body_pretty_print = true },
        })

        vim.keymap.set(
            { "n", "v" },
            "<leader>Rs",
            ":Resty run<CR>",
            { desc = "Send request" }
        )
        vim.keymap.set(
            "n",
            "<leader>Rr",
            ":Resty last<CR>",
            { desc = "Run last request" }
        )
    end,
})
