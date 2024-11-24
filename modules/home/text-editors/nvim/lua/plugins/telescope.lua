return {
    'nvim-telescope/telescope.nvim',
    keys = '<leader>s',
    cmd = 'Telescope',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-file-browser.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    config = function()
        local telescope = require('telescope')

        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-k>'] = actions.move_selection_previous,
                    },
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },

                file_browser = {
                    theme = 'dropdown',
                    hijack_netrw = true,
                    mappings = {
                        ['i'] = {
                            ['<C-j>'] = actions.move_selection_next,
                            ['<C-k>'] = actions.move_selection_previous,
                        },
                        ['n'] = {},
                    },
                },
            },
        })

        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')

        vim.keymap.set(
            'n',
            '<leader>sc',
            builtin.spell_suggest,
            { desc = 'Spell suggest Telescope' }
        )
        vim.keymap.set(
            'n',
            '<leader>sh',
            builtin.help_tags,
            { desc = 'Search help' }
        )
        vim.keymap.set(
            'n',
            '<leader>sk',
            builtin.keymaps,
            { desc = 'Search Keymaps' }
        )
        vim.keymap.set(
            'n',
            '<leader>sf',
            builtin.find_files,
            { desc = 'Search files' }
        )
        vim.keymap.set(
            'n',
            '<leader>sb',
            telescope.extensions.file_browser.file_browser,
            { desc = 'Search file browser' }
        )
        vim.keymap.set(
            'n',
            '<leader>ss',
            builtin.builtin,
            { desc = 'Search select Telescope' }
        )
        vim.keymap.set(
            'n',
            '<leader>sw',
            builtin.grep_string,
            { desc = 'Search current word' }
        )
        vim.keymap.set(
            'n',
            '<leader>sg',
            builtin.live_grep,
            { desc = 'Search by grep' }
        )
        vim.keymap.set(
            'n',
            '<leader>sd',
            builtin.diagnostics,
            { desc = 'Search diagnostics' }
        )
        vim.keymap.set(
            'n',
            '<leader>sr',
            builtin.resume,
            { desc = 'Search resume' }
        )
        vim.keymap.set(
            'n',
            '<leader>s.',
            builtin.oldfiles,
            { desc = 'Search Recent Files ("." for repeat)' }
        )
        vim.keymap.set(
            'n',
            '<leader><leader>',
            builtin.buffers,
            { desc = '[ ] Find existing buffers' }
        )

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown({
                    winblend = 10,
                    previewer = false,
                })
            )
        end, { desc = '[/] Fuzzily search in current buffer' })

        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = 'Live grep in open files',
            })
        end, { desc = 'Search [/] in open files' })

        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files({ cwd = vim.fn.stdpath('config') })
        end, { desc = 'Search neovim files' })
    end,
}
