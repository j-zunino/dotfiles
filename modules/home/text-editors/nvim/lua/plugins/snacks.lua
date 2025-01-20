return {
    'folke/snacks.nvim',
    priority = 500,
    lazy = false,
    config = function()
        local snacks = require('snacks')

        require('plugins.snacks.bufdelete')
        require('plugins.snacks.notifier')
        require('plugins.snacks.terminal')
        require('plugins.snacks.lazygit')
        require('plugins.snacks.picker')

        -- dashboard
        local maxIndex = 10
        math.randomseed(os.time())
        local randomNumber = math.random(1, maxIndex)

        -- picker
        local custom_layout = {
            reverse = true,
            layout = {
                box = 'horizontal',
                backdrop = false,
                width = 0.8,
                height = 0.9,
                border = 'none',
                {
                    box = 'vertical',
                    border = 'single',
                    title = ' Results ',
                    title_pos = 'center',
                    { win = 'list', border = 'none' },
                    {
                        win = 'input',
                        title = '{title} {live} {flags}',
                        title_pos = 'center',
                        height = 1,
                        border = 'top',
                    },
                },
                {
                    win = 'preview',
                    title = '{preview}',
                    width = 0.45,
                    border = 'single',
                    title_pos = 'center',
                },
            },
        }

        snacks.setup({
            bufdelete = { enabled = true },
            notify = { enabled = true },
            notifier = {
                enabled = true,
                style = 'compact',
                border = 'single',
                top_down = true,
                date_format = '%R',
                refresh = 50,
            },

            dashboard = {
                enabled = true,
                sections = {
                    {
                        pane = 1,
                        section = 'terminal',
                        cmd = 'chafa ~/dotfiles/modules/home/text-editors/nvim/lua/plugins/dashboard/'
                            .. randomNumber
                            .. '.png --format symbols --symbols vhalf --size 60x30; sleep .1',
                        height = 30,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        {
                            section = 'terminal',
                            cmd = 'tty-clock -c -D; sleep .1',
                            padding = 1,
                        },
                        {
                            section = 'recent_files',
                            title = 'Recent Files',
                            icon = ' ',
                            padding = 1,
                            indent = 3,
                        },
                        {
                            section = 'startup',
                            icon = '󰒲 ',
                        },
                    },
                },
            },

            terminal = {
                enabled = true,
                win = {
                    title = 'Terminal',
                },
            },

            lazygit = {
                enabled = true,
                configure = true,
                theme = {
                    [241] = { fg = 'Special' },
                    activeBorderColor = { fg = 'MatchParen', bold = true },
                    cherryPickedCommitBgColor = { fg = 'Identifier' },
                    cherryPickedCommitFgColor = { fg = 'Function' },
                    defaultFgColor = { fg = 'Normal' },
                    inactiveBorderColor = { fg = 'Comment' },
                    optionsTextColor = { fg = 'Function' },
                    searchingActiveBorderColor = {
                        fg = 'MatchParen',
                        bold = true,
                    },
                    selectedLineBgColor = { bg = 'Visual' },
                    unstagedChangesColor = { fg = 'DiagnosticError' },
                },
                win = {
                    title = ' LazyGit ',
                    style = 'lazygit',
                    border = 'single',
                },
            },

            input = {
                enabled = true,
                win = {
                    border = 'single',
                },
            },

            statuscolumn = {
                enabled = true,
                left = { 'mark', 'sign' },
                right = { 'git' },
                folds = {
                    open = false,
                },
                git = {
                    patterns = { 'GitSign', 'MiniDiffSign' },
                },
            },

            picker = {
                enabled = true,
                prompt = '  ',
                layout = custom_layout,
                win = {
                    input = {
                        keys = {
                            ['<c-d>'] = {
                                'preview_scroll_down',
                                mode = { 'i', 'n' },
                            },
                            ['<c-u>'] = {
                                'preview_scroll_up',
                                mode = { 'i', 'n' },
                            },
                            ['<c-f>'] = {
                                'list_scroll_down',
                                mode = { 'i', 'n' },
                            },
                            ['<c-b>'] = {
                                'list_scroll_up',
                                mode = { 'i', 'n' },
                            },
                        },
                    },
                },
            },
        })
    end,
}
