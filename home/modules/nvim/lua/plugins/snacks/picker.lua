local map = function(mode, keys, func, desc, opts)
    local options = vim.tbl_extend(
        'force',
        { noremap = true, silent = true, desc = desc },
        opts or {}
    )

    vim.keymap.set(mode, keys, func, options)
end

map('n', '<leader>si', ':lua Snacks.picker.icons()<CR>', 'Icons')
map('n', '<leader>sc', ':lua Snacks.picker.colorschemes()<CR>', 'Colorschemes')

local picker_layout = {
    reverse = true,
    layout = {
        box = 'vertical',
        width = 0.5,
        height = 0.5,
        border = false,
        {
            box = 'vertical',
            height = 0.5,
            border = 'single',
            title = '{title} {live} {flags}',
            { win = 'list', border = 'none' },
            {
                height = 1,
                win = 'input',
                border = 'top',
            },
        },
    },
}

return { picker_layout = picker_layout }
