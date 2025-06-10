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
            map('v', '<leader>ghs', function()
                gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = 'Stage  hunk' })
            map('v', '<leader>ghr', function()
                gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
            end, { desc = 'Reset hunk' })

            -- normal mode
            map(
                'n',
                '<leader>ghs',
                gitsigns.stage_hunk,
                { desc = 'Stage hunk' }
            )
            map(
                'n',
                '<leader>ghr',
                gitsigns.reset_hunk,
                { desc = 'Reset hunk' }
            )
            map(
                'n',
                '<leader>ghS',
                gitsigns.stage_buffer,
                { desc = 'Stage buffer' }
            )
            map(
                'n',
                '<leader>ghu',
                gitsigns.undo_stage_hunk,
                { desc = 'Undo stage hunk' }
            )
            map(
                'n',
                '<leader>ghR',
                gitsigns.reset_buffer,
                { desc = 'Reset buffer' }
            )
            map(
                'n',
                '<leader>ghp',
                gitsigns.preview_hunk,
                { desc = 'Preview hunk' }
            )
            map(
                'n',
                '<leader>ghb',
                gitsigns.blame_line,
                { desc = 'Blame line' }
            )
            map(
                'n',
                '<leader>ghd',
                gitsigns.diffthis,
                { desc = 'Diff against index' }
            )
            map('n', '<leader>ghD', function()
                gitsigns.diffthis('@')
            end, { desc = 'Diff against last commit' })

            -- Toggles
            map(
                'n',
                '<leader>ghB',
                gitsigns.toggle_current_line_blame,
                { desc = 'Toggle git show blame line' }
            )
            map(
                'n',
                '<leader>ghD',
                gitsigns.toggle_deleted,
                { desc = 'Toggle git show deleted' }
            )
        end,
    },
}
