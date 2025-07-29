local map = function(mode, keys, func, desc, opts)
    local options = vim.tbl_extend(
        'force',
        { noremap = true, silent = true, desc = desc },
        opts or {}
    )

    vim.keymap.set(mode, keys, func, options)
end

map('n', '<leader>sf', ':lua Snacks.picker.files()<CR>', 'Files')
map('n', '<leader>sg', ':lua Snacks.picker.grep()<CR>', 'Grep')
map('n', '<leader>sw', ':lua Snacks.picker.grep_word()<CR>', 'Grep Word')
map('n', '<leader>ss', ':lua Snacks.picker.spelling()<CR>', 'Spell suggestions')
map('n', '<leader>sh', ':lua Snacks.picker.help()<CR>', 'Help')
map('n', '<leader>sd', ':lua Snacks.picker.diagnostics()<CR>', 'Diagnostics')
map('n', '<leader>si', ':lua Snacks.picker.icons()<CR>', 'Icons')
map('n', '<leader>sc', ':lua Snacks.picker.colorschemes()<CR>', 'Colorschemes')
map('n', '<leader><leader>', ':lua Snacks.picker.buffers()<CR>', 'Buffers')

local picker_layout = {
    reverse = true,
    layout = {
        box = 'vertical',
        width = 0.5,
        height = 0.7,
        border = 'single',
        title = '{title} {live} {flags}',
        {
            win = 'preview',
            border = 'bottom',
            height = 0.5,
        },
        {
            box = 'vertical',
            { win = 'list', border = 'none' },
            {
                height = 1,
                win = 'input',
                border = 'top',
            },
        },
    },
}

local spelling_layout = {
    reverse = false,
    layout = {
        relative = 'cursor',
        box = 'horizontal',
        width = 40,
        height = 10,
        row = 1,
        border = 'none',
        {
            box = 'vertical',
            border = 'single',
            title = ' Spelling Suggestions ',
            title_pos = 'center',
            {
                height = 1,
                win = 'input',
                border = 'none',
            },
            { win = 'list', border = 'top' },
        },
    },
}

return {
    picker_layout = picker_layout,
    spelling_layout = spelling_layout,
}

-- local picker_layout = {
--     reverse = true,
--     layout = {
--         box = 'horizontal',
--         width = 0.8,
--         height = 0.9,
--         border = 'none',
--         {
--             box = 'vertical',
--             border = 'single',
--             title = ' Results ',
--             title_pos = 'center',
--             { win = 'list', border = 'none' },
--             {
--                 height = 1,
--                 win = 'input',
--                 border = 'top',
--                 title = '{title} {live} {flags}',
--                 title_pos = 'center',
--             },
--         },
--         {
--             win = 'preview',
--             title = '{preview}',
--             width = 0.5,
--             border = 'single',
--             title_pos = 'center',
--         },
--     },
-- }
