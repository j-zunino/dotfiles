local MiniPick = require('mini.pick')
local MiniExtra = require('mini.extra')
require('silly.icons')

local map = function(mode, keys, func, desc, opts)
    local options = vim.tbl_extend(
        'force',
        { noremap = true, silent = true, desc = desc },
        opts or {}
    )

    vim.keymap.set(mode, keys, func, options)
end

local win_config = function()
    local col = vim.o.columns
    local row = vim.o.lines

    if col < 120 then
        return {
            relative = 'editor',
            width = col,
            height = row,
            border = 'none',
        }
    else
        local width = math.floor(0.6 * col)
        local height = math.floor(0.6 * row)

        return {
            anchor = 'NW',
            height = height,
            width = width,
            col = math.floor(0.5 * (col - width)),
            row = math.floor(0.5 * (row - height)),
        }
    end
end

local show_align = function(buf_id, items, query, opts)
    local original = vim.fn.strdisplaywidth
    vim.fn.strdisplaywidth = string.len
    items = require('mini.align').align_strings(items, {
        justify_side = { 'left', 'right', 'right' },
        merge_delimiter = { '', ' ', '', ' ', '' },
        split_pattern = '%z',
    })
    vim.fn.strdisplaywidth = original
    MiniPick.default_show(buf_id, items, query, opts)
end

MiniPick.registry.grep_live = function()
    MiniPick.builtin.grep_live({}, { source = { show = show_align } })
end

MiniPick.registry.spellsuggest = function()
    MiniExtra.pickers.spellsuggest({}, {
        options = { content_from_bottom = false },
        window = {
            config = {
                relative = 'cursor',
                anchor = 'NW',
                row = 1,
                col = 0,
                width = 40,
                height = 5,
            },
        },
    })
end

return {
    MiniExtra.setup(),
    MiniPick.setup({
        mappings = {
            move_down = '<C-j>',
            move_up = '<C-k>',
            scroll_down = '<C-d>',
            scroll_up = '<C-u>',
        },

        options = { content_from_bottom = true },

        window = {
            config = win_config,
            prompt_caret = '█',
        },
    }),

    map('n', '<leader>sf', ':Pick files<CR>', 'Files'),
    map('n', '<leader>sg', ':Pick grep_live<CR>', 'Grep'),
    map('n', '<leader>sh', ':Pick help<CR>', 'Help'),
    map('n', '<leader>sH', ':Pick hl_groups<CR>', 'Highlight groups'),
    map('n', '<leader>ss', ':Pick spellsuggest<CR>', 'Spellsuggest'),
    map('n', '<leader>sd', ':Pick diagnotic<CR>', 'Diagnotics'),
    map('n', '<leader><leader>', ':Pick buffers<CR>', 'Buffers'),
    map('n', '<leader>sl', ':Pick buf_lines<CR>', 'Buffers Lines'),
    map('n', '<leader>si', ':Pick icons<CR>', 'Icons'),
}
