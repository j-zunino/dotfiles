return {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufReadPost' },
    opts = {
        current_line_blame = true,
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end, { desc = 'Jump to next git change' })

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end, { desc = 'Jump to previous git change' })

            -- Actions
            -- visual mode
            map('v', '<leader>hs', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = 'Stage git hunk' })
            map('v', '<leader>hr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = 'Reset git hunk' })

            -- normal mode
            map(
                'n',
                '<leader>hs',
                gitsigns.stage_hunk,
                { desc = 'Git stage hunk' }
            )
            map(
                'n',
                '<leader>hr',
                gitsigns.reset_hunk,
                { desc = 'Git reset hunk' }
            )
            map(
                'n',
                '<leader>hS',
                gitsigns.stage_buffer,
                { desc = 'Git stage buffer' }
            )
            map(
                'n',
                '<leader>hu',
                gitsigns.undo_stage_hunk,
                { desc = 'Git undo stage hunk' }
            )
            map(
                'n',
                '<leader>hR',
                gitsigns.reset_buffer,
                { desc = 'Git reset buffer' }
            )
            map(
                'n',
                '<leader>hp',
                gitsigns.preview_hunk,
                { desc = 'Git preview hunk' }
            )
            map(
                'n',
                '<leader>hb',
                gitsigns.blame_line,
                { desc = 'Git blame line' }
            )
            map(
                'n',
                '<leader>hd',
                gitsigns.diffthis,
                { desc = 'Git diff against index' }
            )
            map('n', '<leader>hD', function()
                gitsigns.diffthis('@')
            end, { desc = 'Git diff against last commit' })

            -- Toggles
            map(
                'n',
                '<leader>hB',
                gitsigns.toggle_current_line_blame,
                { desc = 'Toggle git show blame line' }
            )
            map(
                'n',
                '<leader>hD',
                gitsigns.toggle_deleted,
                { desc = 'Toggle git show deleted' }
            )
        end,
    },
}
