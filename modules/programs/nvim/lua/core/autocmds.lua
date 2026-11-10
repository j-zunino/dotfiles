local api = vim.api

-- Don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Go to last location when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        local lcount = api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

api.nvim_create_autocmd("LspAttach", {
    group = api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        -- LSP keymaps
        local map = function(keys, func, desc)
            vim.keymap.set(
                "n",
                keys,
                func,
                { buffer = event.buf, silent = true, desc = desc }
            )
        end

        -- [ LSP ]
        local lsp = vim.lsp
        local buf = lsp.buf
        local color = lsp.document_color
        local diagnostics = vim.diagnostic

        map("<leader>h", buf.hover, "Hover")
        map("gd", buf.declaration, "Goto declaration")
        map("gr", buf.references, "Goto references")
        map("gi", buf.implementation, "Goto implementation")
        map("gs", buf.signature_help, "Signature cocumentation")
        map("gt", buf.type_definition, "GoTo type definition")
        map("<leader>rn", buf.rename, "Rename")
        map("<leader>ca", buf.code_action, "Action")
        map("<leader>cr", ":LspRestart", "Restart LSP")
        map("<leader>cc", color.color_presentation, "Color presentation")
        -- stylua: ignore start
        map("<leader>cu", function()
            buf.code_action({ apply = true, context = { only = { "source.removeUnusedImports" }}})
        end, "Remove unused imports")
        map("<leader>cs", function()
            buf.code_action({ apply = true, context = { only = { "source.sortImports" }}})
        end, "Sort imports")
        map("<leader>co", function()
            buf.code_action({ apply = true, context = { only = { "source.organizeImports" }}})
        end, "Organize imports")
        -- HACK: tsgo doesn't support add missing imports
        map("<leader>ci", function()
            buf.code_action({ apply = true, filter = function(action) return action.title:match("Add all missing imports") end })
        end, "Add missing imports")
        -- stylua: ignore stop

        -- [ Diagnostics ]
        map("<leader>e", diagnostics.open_float, "Show diagnostic")
        map("<leader>q", diagnostics.setloclist, "Show quickfix")
        map("<leader>dk", function()
            diagnostics.jump({ count = -1, float = true })
        end, "Previous diagnostic")
        map("<leader>dj", function()
            diagnostics.jump({ count = 1, float = true })
        end, "Next diagnostic")
    end,
})
