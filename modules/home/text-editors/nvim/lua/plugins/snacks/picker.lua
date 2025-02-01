local opts = { noremap = true, silent = true }

local custom_layout = {
    reverse = true,
    layout = {
        box = 'horizontal',
        backdrop = false,
        width = 0.8,
        height = 0.9,
        border = 'none',
        {
            box = 'vertical',
            border = 'single',
            title = ' Results ',
            title_pos = 'center',
            { win = 'list', border = 'none' },
            {
                win = 'input',
                title = '{title} {live} {flags}',
                title_pos = 'center',
                height = 1,
                border = 'top',
            },
        },
        {
            win = 'preview',
            title = '{preview}',
            width = 0.45,
            border = 'single',
            title_pos = 'center',
        },
    },
}

local cursor_layout = {
    reverse = false,
    layout = {
        relative = 'cursor',
        box = 'horizontal',
        backdrop = false,
        width = 60,
        height = 10,
        row = 1,
        border = 'none',
        {
            box = 'vertical',
            border = 'single',
            title = ' Spelling Suggestions ',
            title_pos = 'center',
            {
                win = 'input',
                height = 1,
                border = 'none',
            },
            { win = 'list', border = 'top' },
        },
    },
}

local explorer_layout = {
    reverse = false,
    layout = {
        box = 'vertical',
        backdrop = false,
        width = 0.5,
        height = 0.9,
        border = 'none',
        {
            box = 'vertical',
            border = 'single',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            { win = 'list', border = 'none' },
            {
                win = 'input',
                title = ' Filter ',
                title_pos = 'center',
                height = 1,
                border = 'top',
            },
        },
    },
}

opts.desc = 'File explorer'
vim.keymap.set('n', '<C-e>', function()
    Snacks.picker.explorer({
        layout = explorer_layout,
        auto_close = true,
        win = {
            list = {
                keys = {
                    ['l'] = 'confirm',
                },
            },
        },
    })
end, opts)

opts.desc = 'Search files'
vim.keymap.set('n', '<leader>sf', ':lua Snacks.picker.files()<CR>', opts)

-- Grep
opts.desc = 'Search by Grep'
vim.keymap.set('n', '<leader>sg', ':lua Snacks.picker.grep()<CR>', opts)

opts.desc = 'Search word'
vim.keymap.set('n', '<leader>sw', ':lua Snacks.picker.grep_word()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set('n', '<leader>s/', ':lua Snacks.picker.grep_word()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set('n', '<leader>/', ':lua Snacks.picker.lines()<CR>', opts)

-- Git
opts.desc = 'Search Git status'
vim.keymap.set('n', '<leader>sG', ':lua Snacks.picker.git_status()<CR>', opts)

-- Other
opts.desc = 'Search help'
vim.keymap.set('n', '<leader>sh', ':lua Snacks.picker.help()<CR>', opts)

opts.desc = 'Search keymaps'
vim.keymap.set('n', '<leader>sk', ':lua Snacks.picker.keymaps()<CR>', opts)

opts.desc = 'Search diagnostics'
vim.keymap.set('n', '<leader>sd', ':lua Snacks.picker.diagnostics()<CR>', opts)

opts.desc = 'Search resume'
vim.keymap.set('n', '<leader>sR', ':lua Snacks.picker.resume()<CR>', opts)

opts.desc = 'Search recent'
vim.keymap.set('n', '<leader>sr', ':lua Snacks.picker.recent()<CR>', opts)

opts.desc = 'Search in open buffers'
vim.keymap.set(
    'n',
    '<leader><leader>',
    ':lua Snacks.picker.grep_word()<CR>',
    opts
)

opts.desc = 'Spelling suggestions'
vim.keymap.set('n', '<leader>ss', function()
    Snacks.picker.spelling({
        layout = cursor_layout,
        -- confirm = 'item_action',
    })
end, opts)

opts.desc = 'Search icons'
vim.keymap.set('n', '<leader>si', ':lua Snacks.picker.icons()<CR>', opts)

opts.desc = 'Search projects'
vim.keymap.set('n', '<leader>sp', ':lua Snacks.picker.projects()<CR>', opts)

opts.desc = 'Search colorschemes'
vim.keymap.set('n', '<leader>sc', ':lua Snacks.picker.colorschemes()<CR>', opts)

return {
    custom_layout = custom_layout,
    explorer_layout = explorer_layout,
}
