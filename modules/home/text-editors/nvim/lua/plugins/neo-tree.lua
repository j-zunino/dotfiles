return {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
        { "<C-e>", ":Neotree reveal right<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ["<C-e>"] = "close_window",
                    ["<space>"] = "open",
                    ["l"] = "open",
                },
            },
        },
    },
}
