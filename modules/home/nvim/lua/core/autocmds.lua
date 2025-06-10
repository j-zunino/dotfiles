local api = vim.api

-- Don't auto comment new line
api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Go to last location when opening a buffer
-- this mean that when you open a file, you will be at the last position
api.nvim_create_autocmd('BufReadPost', {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup('CursorLine', { clear = true })
api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
    pattern = '*',
    command = 'set cursorline',
    group = cursorGrp,
})
api.nvim_create_autocmd(
    { 'InsertEnter', 'WinLeave' },
    { pattern = '*', command = 'set nocursorline', group = cursorGrp }
)

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local buftype =
            vim.api.nvim_get_option_value('filetype', { buf = event.buf })

        -- LSP keymaps
        local map = function(keys, func, desc)
            vim.keymap.set(
                'n',
                keys,
                func,
                { buffer = event.buf, silent = true, desc = desc }
            )
        end

        -- stylua: ignore start
        -- [ LSP ]
        map('<leader>h', vim.lsp.buf.hover, 'Hover')
        map('gd', vim.lsp.buf.declaration, 'Goto declaration')
        map('gr', vim.lsp.buf.references, 'Goto references')
        map('gi', vim.lsp.buf.implementation, 'Goto implementation')
        map('gs', vim.lsp.buf.signature_help, 'Signature cocumentation')
        map('<leader>d', vim.lsp.buf.type_definition, 'Type definition')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Action')

        -- [ Diagnostics ]
        map('[d', function () vim.diagnostic.jump({ count = 1, float = true }) end, 'Go to previous diagnostic message')
        map(']d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Go to next diagnostic message')
        map('<leader>e', vim.diagnostic.open_float, 'Show diagnostic error messages')
        map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic quickfix list')

        -- [ Typescript ]
        if vim.tbl_contains({ 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', }, buftype) then
            map('<leader>cr', ':VtsExec restart_tsserver<CR>', 'Restart server')
            map('<leader>co', ':VtsExec organize_imports<CR>', 'Organize imports')
            map('<leader>cs', ':VtsExec sort_imports<CR>', 'Sort imports')
            map('<leader>ci', ':VtsExec add_missing_imports<CR>', 'Add missing imports')
            map('<leader>cu', ':VtsExec remove_unused_imports<CR>', 'Remove unused imports')
        end
        -- stylua: ignore end

        local function client_supports_method(client, method, bufnr)
            if vim.fn.has('nvim-0.11') == 1 then
                return client:supports_method(method, bufnr)
            else
                return client.supports_method(method, { bufnr = bufnr })
            end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
            client
            and client_supports_method(
                client,
                vim.lsp.protocol.Methods.textDocument_documentHighlight,
                event.buf
            )
        then
            local highlight_augroup =
                vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup(
                    'lsp-detach',
                    { clear = true }
                ),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({
                        group = 'lsp-highlight',
                        buffer = event2.buf,
                    })
                end,
            })
        end
    end,
})

--
--
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'snacks_dashboard',
    callback = function()
        vim.o.winborder = 'none'
    end,
})

vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        if vim.bo.filetype ~= 'snacks_dashboard' then
            vim.o.winborder = 'single'
        end
    end,
})
