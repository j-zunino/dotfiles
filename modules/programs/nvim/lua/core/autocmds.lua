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

vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup(
        "UserCustomHighlights",
        { clear = true }
    ),
    callback = function()
        local function get_hl_colors(name)
            local hl = vim.api.nvim_get_hl(0, { name = name })

            local fg = hl.fg and string.format("#%06x", hl.fg) or nil
            local bg = hl.bg and string.format("#%06x", hl.bg) or nil

            return { fg = fg, bg = bg }
        end

        local hl = vim.api.nvim_set_hl

        local normal = get_hl_colors("Normal")
        local comment = get_hl_colors("Comment")
        local warn = get_hl_colors("DiagnosticWarn")
        local accent = get_hl_colors("Function")
        local cursor_line = get_hl_colors("CursorLine")
        local blue = get_hl_colors("Blue")

        -- stylua: ignore start
        -- Neovim
        hl(0, 'StatusLine', { fg = comment.fg,  bg = cursor_line.bg })
        hl(0, 'StatusLineNC', { link = 'StatusLine' })
        hl(0, 'CursorLineNr', { fg = comment.fg, bg = cursor_line.bg })
        hl(0, 'TabLineFill', { fg = nil, bg = nil })

        -- Spell
        hl(0, 'SpellBad', { fg = warn.fg, underline = true })
        hl(0, 'SpellCap', { fg = warn.fg, underline = true })
        hl(0, 'SpellLocal', { fg = warn.fg, underline = true })
        hl(0, 'SpellRare', { fg = warn.fg, underline = true })

        -- Mini
        hl(0, 'MiniCursorword', { bg = cursor_line.bg, bold = true })
        hl(0, 'MiniPickPrompt', { fg = normal.fg })
        hl(0, 'MiniPickPromptCaret', { link = 'MiniPickPrompt' })
        hl(0, 'MiniPickPromptPrefix', { fg = accent.fg, bold = true })
        hl(0, 'MiniPickNormal', { fg = comment.fg })
        hl(0, 'MiniPickMatchRanges', { fg = accent.fg, bold = true })
        hl(0, 'MiniPickBorderText', { fg = accent.fg, bold = true })
        hl(0, 'MiniPickMatchCurrent', { fg = normal.fg, bg = cursor_line.bg, bold = true })
        hl(0, 'MiniTablineCurrent', { fg = normal.fg, bg = cursor_line.bg, bold = true })
        hl(0, 'MiniTablineModifiedCurrent', { fg = blue.fg, bg = cursor_line.bg, bold = true })
        hl(0, 'MiniTablineHidden', { fg = comment.fg, bg = nil })
        hl(0, 'MiniTablineModifiedHidden', { fg = blue.fg, bg = nil })
        hl(0, 'MiniTablineVisible', { fg = comment.fg, bg = nil })
        hl(0, 'MiniTablineModifiedVisible', { fg = blue.fg, bg = nil })

        -- Completion
        hl(0, 'Pmenu', { fg = comment.fg, bg = nil })
        hl(0, 'PmenuSel', { fg = normal.fg, bg = cursor_line.bg, bold = true })
        hl(0, 'BlinkCmpMenuBorder', { link = "FloatBorder" })
        hl(0, 'BlinkCmpDocBorder', { link = "FloatBorder" })
        hl(0, 'BlinkCmpSignatureHelpBorder', { link = "FloatBorder" })
        -- stylua: ignore end
    end,
})
