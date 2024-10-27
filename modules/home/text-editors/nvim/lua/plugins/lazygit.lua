return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyGitCOnfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    keys = {
        {
            '<leader>lg',
            '<cmd>LazyGit<CR>',
            { noremap = true, silent = true, desc = 'Open LazyGit' },
        },
    },
}
