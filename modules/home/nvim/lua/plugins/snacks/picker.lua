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

opts.desc = 'Files'
vim.keymap.set('n', '<leader>sf', ':lua Snacks.picker.files()<CR>', opts)

-- Grep
opts.desc = 'Grep'
vim.keymap.set('n', '<leader>sg', ':lua Snacks.picker.grep()<CR>', opts)

opts.desc = 'Word'
vim.keymap.set('n', '<leader>sw', ':lua Snacks.picker.grep_word()<CR>', opts)

opts.desc = 'In open buffers'
vim.keymap.set(
    'n',
    '<leader><leader>',
    ':lua Snacks.picker.grep_word()<CR>',
    opts
)

-- Git
opts.desc = 'Git status'
vim.keymap.set('n', '<leader>sG', ':lua Snacks.picker.git_status()<CR>', opts)

-- Other
opts.desc = 'Help'
vim.keymap.set('n', '<leader>sh', ':lua Snacks.picker.help()<CR>', opts)

opts.desc = 'Keymaps'
vim.keymap.set('n', '<leader>sk', ':lua Snacks.picker.keymaps()<CR>', opts)

opts.desc = 'Diagnostics'
vim.keymap.set('n', '<leader>sd', ':lua Snacks.picker.diagnostics()<CR>', opts)

opts.desc = 'Resume'
vim.keymap.set('n', '<leader>sR', ':lua Snacks.picker.resume()<CR>', opts)

opts.desc = 'Recent'
vim.keymap.set('n', '<leader>sr', ':lua Snacks.picker.recent()<CR>', opts)

opts.desc = 'Suggestions'
vim.keymap.set('n', '<leader>ss', ':lua Snacks.picker.spelling()<CR>', opts)

opts.desc = 'Icons'
vim.keymap.set('n', '<leader>si', ':lua Snacks.picker.icons()<CR>', opts)

opts.desc = 'Projects'
vim.keymap.set('n', '<leader>sp', ':lua Snacks.picker.projects()<CR>', opts)

opts.desc = 'Colorschemes'
vim.keymap.set('n', '<leader>sc', ':lua Snacks.picker.colorschemes()<CR>', opts)

return {
    picker_layout = picker_layout,
    spelling_layout = spelling_layout,
    explorer_layout = explorer_layout,
}
