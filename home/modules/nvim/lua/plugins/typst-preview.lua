return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    leader = '<leader>pt',
    version = '1.*',
    config = function()
        vim.keymap.set(
            'n',
            '<leader>pt',
            ':TypstPreviewToggle<CR>',
            { noremap = true, silent = true, desc = 'Typst preview' }
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
