local opts = { noremap = true, silent = true }

local picker_layout = {
    reverse = true,
    layout = {
        box = 'horizontal',
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
                height = 1,
                win = 'input',
                border = 'top',
                title = '{title} {live} {flags}',
                title_pos = 'center',
            },
        },
        {
            win = 'preview',
            title = '{preview}',
            width = 0.5,
            border = 'single',
            title_pos = 'center',
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

local explorer_layout = {
    reverse = false,
    layout = {
        box = 'horizontal',
        width = 0.5,
        height = 0.9,
        {
            box = 'vertical',
            border = 'single',
            title = '{title} {live} {flags}',
            title_pos = 'center',
            {
                height = 1,
                win = 'input',
                border = 'none',
                title = ' Filter ',
                title_pos = 'center',
            },
            { win = 'list', border = 'top' },
            {
                win = 'preview',
                border = 'top',
                title = '{preview}',
                title_pos = 'center',
            },
        },
    },
}

opts.desc = 'File explorer'
vim.keymap.set('n', '<C-e>', ':lua Snacks.explorer.open()<CR>', opts)

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
vim.keymap.set('n', '<leader>ss', ':lua Snacks.picker.spelling()<CR>', opts)

opts.desc = 'Search icons'
vim.keymap.set('n', '<leader>si', ':lua Snacks.picker.icons()<CR>', opts)

opts.desc = 'Search projects'
vim.keymap.set('n', '<leader>sp', ':lua Snacks.picker.projects()<CR>', opts)

opts.desc = 'Search colorschemes'
vim.keymap.set('n', '<leader>sc', ':lua Snacks.picker.colorschemes()<CR>', opts)

return {
    picker_layout = picker_layout,
    spelling_layout = spelling_layout,
    explorer_layout = explorer_layout,
}
