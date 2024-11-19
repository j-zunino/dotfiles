return {
    'folke/snacks.nvim',
    priority = 500,
    lazy = false,
    config = function()
        local opts = { noremap = true, silent = true }
        local snacks = require('snacks')

        -- bufdelete
        opts.desc = 'Close buffer'
        vim.keymap.set(
            'n',
            '<leader>x',
            '<cmd>lua Snacks.bufdelete.delete()<CR>',
            opts
        )

        opts.desc = 'Close buffer'
        vim.keymap.set(
            'n',
            '<leader>bx',
            '<cmd>lua Snacks.bufdelete.delete()<CR>',
            opts
        )

        opts.desc = 'Close other buffer'
        vim.keymap.set(
            'n',
            '<leader>bo',
            '<cmd>lua Snacks.bufdelete.other()<CR>',
            opts
        )

        opts.desc = 'Close all buffers'
        vim.keymap.set(
            'n',
            '<leader>ba',
            '<cmd>lua Snacks.bufdelete.all()<CR>',
            opts
        )

        opts.desc = 'New buffer'
        vim.keymap.set('n', '<leader>bn', '<cmd>enew<CR>', opts)

        -- notifier
        ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
        local progress = vim.defaulttable()
        vim.api.nvim_create_autocmd('LspProgress', {
            ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
                if not client or type(value) ~= 'table' then
                    return
                end
                local p = progress[client.id]

                for i = 1, #p + 1 do
                    if i == #p + 1 or p[i].token == ev.data.params.token then
                        p[i] = {
                            token = ev.data.params.token,
                            msg = ('[%3d%%] %s%s'):format(
                                value.kind == 'end' and 100
                                    or value.percentage
                                    or 100,
                                value.title or '',
                                value.message
                                        and (' **%s**'):format(value.message)
                                    or ''
                            ),
                            done = value.kind == 'end',
                        }
                        break
                    end
                end

                local msg = {} ---@type string[]
                progress[client.id] = vim.tbl_filter(function(v)
                    return table.insert(msg, v.msg) or not v.done
                end, p)

                local spinner = {
                    '⠋',
                    '⠙',
                    '⠹',
                    '⠸',
                    '⠼',
                    '⠴',
                    '⠦',
                    '⠧',
                    '⠇',
                    '⠏',
                }
                vim.notify(table.concat(msg, '\n'), 'info', {
                    id = 'lsp_progress',
                    title = client.name,
                    opts = function(notif)
                        notif.icon = #progress[client.id] == 0 and ' '
                            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
                    end,
                })
            end,
        })

        -- dashboard
        local maxIndex = 10
        math.randomseed(os.time())
        local randomNumber = math.random(1, maxIndex)

        snacks.setup({
            bufdelete = { enabled = true },
            notify = { enabled = true },
            notifier = {
                enabled = true,
                icons = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    debug = ' ',
                    trace = ' ',
                },
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
                            section = 'recent_files',
                            title = 'Recent Files',
                            icon = ' ',
                            padding = 1,
                            indent = 1,
                        },
                        {
                            section = 'startup',
                        },
                    },
                },
            },
        })


        vim.cmd([[
            highlight link SnacksDashboardTitle green
            highlight link SnacksDashboardIcon green
            highlight SnacksDashboardFile guifg='#d3c6aa'
            highlight link SnacksDashboardSpecial Comment
            highlight link SnacksDashboardNormal Comment
            highlight link SnacksDashboardDir Comment
            highlight link SnacksDashboardFooter Comment
        ]])
    end,
}
