return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        vim.keymap.set('n', '<leader>tl', function()
            lint.try_lint()
        end, { silent = true, noremap = true, desc = 'Try lint' })

        lint.linters_by_ft = {
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
        }

        lint.linters.spell = {
            cmd = 'cat',
            stdin = true,
            parser = function(_, bufnr)
                local diagnostics = {}
                local spell_errors = vim.fn.spellbadword()
                if spell_errors[1] ~= '' then
                    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                    table.insert(diagnostics, {
                        bufnr = bufnr,
                        lnum = line - 1,
                        col = col - 1,
                        message = 'Spelling mistake: ' .. spell_errors[1],
                        severity = vim.diagnostic.severity.WARN,
                        source = 'spell',
                    })
                end
                return diagnostics
            end,
        }

        vim.api.nvim_create_autocmd(
            { 'BufWritePost', 'BufEnter', 'InsertLeave' },
            {
                group = vim.api.nvim_create_augroup('lint', { clear = true }),
                callback = function()
                    lint.try_lint()
                    lint.try_lint('spell')
                end,
            }
        )
    end,
}
