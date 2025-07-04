return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
        local snacks = require('snacks')

        require('plugins.snacks.bufdelete')
        require('plugins.snacks.notifier')
        require('plugins.snacks.lazygit')
        local picker = require('plugins.snacks.picker')

        -- dashboard
        local dashboard_dir =
            '$HOME/dotfiles/modules/home/nvim/lua/plugins/snacks/dashboard/'

        local handle = io.popen('ls ' .. dashboard_dir .. '*.png | wc -l')
        local maxIndex = tonumber(handle:read('*n'))
        handle:close()

        if maxIndex == nil then
            maxIndex = 1
        end

        math.randomseed(os.time())
        local randomNumber = math.random(1, maxIndex)

        snacks.setup({
            bufdelete = { enabled = true },
            notify = { enabled = true },
            rename = { enabled = true },

            notifier = {
                enabled = true,
                style = 'compact',
                border = 'single',
                top_down = true,
                date_format = '%R',
                refresh = 50,
            },

            indent = {
                enabled = true,

                indent = {
                    enabled = false,
                },
                scope = {
                    enabled = true,
                    hl = 'SnacksIndent',
                },
            },

            dashboard = {
                enabled = true,
                sections = {
                    {
                        pane = 1,
                        section = 'terminal',
                        cmd = 'chafa '
                            .. dashboard_dir
                            .. randomNumber
                            .. '.png --format symbols --symbols vhalf --align=center --size 55x25; sleep .1',
                        height = 25,
                    },
                    {
                        pane = 2,
                        {
                            section = 'terminal',
                            cmd = 'tty-clock -c -D; sleep .1',
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
                right = { 'fold', 'git' },
                folds = {
                    open = false,
                },
                git = {
                    patterns = { 'GitSign', 'MiniDiffSign' },
                },
            },

            explorer = {
                enabled = false,
                replace_netrw = true,
                follow_file = true,
            },
            picker = {
                enabled = true,
                hidden = true,
                prompt = '  ',
                layout = picker.picker_layout,
                formatters = {
                    file = {
                        truncate = 40,
                    },
                },
                ---@diagnostic disable-next-line: missing-fields
                icons = {
                    tree = {
                        vertical = '   ',
                        middle = '   ',
                        last = '   ',
                    },
                },
                sources = {
                    spelling = {
                        layout = picker.spelling_layout,
                    },
                    select = {
                        config = function(opts)
                            opts.layout.layout.height = 10
                        end,
                    },
                    explorer = {
                        follow_file = true,
                        auto_close = true,
                        jump = { close = false },
                        layout = picker.explorer_layout,
                    },
                },
                win = {
                    b = {
                        minipairs_disable = true,
                    },
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
