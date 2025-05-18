return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {},
    config = function()
        vim.keymap.set(
            'n',
            '<leader>tp',
            ':TypstPreviewToggle<CR>',
            { noremap = true, silent = true }
        )

        require('typst-preview').setup({
            invert_colors = 'never',

            dependencies_bin = {
                ['tinymist'] = '/home/juan/.nix-profile/bin/tinymist',
                ['websocat'] = '/home/juan/.nix-profile/bin/websocat',
            },

            extra_args = { '--ignore-system-fonts' },

            get_main_file = function(path_of_buffer)
                return path_of_buffer
            end,
        })
    end,
}
