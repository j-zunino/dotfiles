vim.opt.termguicolors = true
vim.opt.showtabline = 2

_G.show_icons = true
_G.tab_offset = 1
_G.scroll_offset = 2
_G.max_visible_tabs = 6

function ToggleIcons()
    _G.show_icons = not _G.show_icons
    UpdateTabline()
end

function ScrollTabline(direction)
    local total_buffers = #vim.fn.getbufinfo({ buflisted = 1 })
    if direction == 'left' then
        _G.tab_offset = math.max(1, _G.tab_offset - 1)
    elseif direction == 'right' then
        _G.tab_offset =
            math.min(total_buffers - _G.max_visible_tabs + 1, _G.tab_offset + 1)
    end
    UpdateTabline()
end

function AutoScrollTabline()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local current_bufnr = vim.fn.bufnr('%')
    local active_index = vim.fn.index(
        buffers,
        vim.fn.getbufinfo(current_bufnr)[1]
    ) + 1

    if active_index < _G.tab_offset + _G.scroll_offset then
        _G.tab_offset = math.max(1, active_index - _G.scroll_offset)
    elseif
        active_index
        >= _G.tab_offset + _G.max_visible_tabs - _G.scroll_offset
    then
        _G.tab_offset = math.min(
            #buffers - _G.max_visible_tabs + 1,
            active_index - _G.max_visible_tabs + _G.scroll_offset
        )
    end
    UpdateTabline()
end

local function get_hl_color(hl_group, attr)
    local color = vim.api.nvim_get_hl(0, { name = hl_group })[attr]
    return color and string.format('#%06x', color) or 'NONE'
end

local function SetTablineColors()
    local fg_color = get_hl_color('Normal', 'fg')
    local comment_color = get_hl_color('Comment', 'fg')

    vim.api.nvim_set_hl(0, 'MyTabLine', { fg = comment_color, bg = 'NONE' })
    vim.api.nvim_set_hl(
        0,
        'MyTabLineSel',
        { fg = fg_color, bg = 'NONE', bold = true }
    )
    vim.api.nvim_set_hl(
        0,
        'MyTabLineSeparator',
        { fg = comment_color, bg = 'NONE' }
    )
    vim.api.nvim_set_hl(0, 'MyScrollIcon', { fg = comment_color, bg = 'NONE' })
end

function Tabline()
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })
    local total_buffers = #buffers
    local end_index =
        math.min(total_buffers, _G.tab_offset + _G.max_visible_tabs - 1)

    _G.tab_offset = math.max(1, math.min(_G.tab_offset, total_buffers))

    local tabline = ''
    local separator = '%#MyTabLineSeparator#|'

    if _G.tab_offset > 1 then
        tabline = tabline .. '%#MyScrollIcon# « ' .. (_G.tab_offset - 1) .. ' '
    end

    for i = _G.tab_offset, end_index do
        local buf = buffers[i]
        if buf then
            local buf_name = vim.fn.fnamemodify(buf.name, ':t')
            local file_ext = vim.fn.fnamemodify(buf.name, ':e')
            local modified = buf.changed == 1
            local active = buf.bufnr == vim.fn.bufnr('%')
            local icon = ''
            if _G.show_icons then
                local icons, hl, _ =
                    require('mini.icons').get('extension', file_ext)
                icon = icons
                        and ('%#' .. hl .. '#' .. icons .. (active and '%#MyTabLineSel#' or '%#MyTabLine#'))
                    or ''
            end

            if buf_name == '' then
                buf_name = '[No Name]'
            end

            local buf_label = icon
                .. ' '
                .. buf_name
                .. ' '
                .. (modified and ' ' or '')

            tabline = tabline
                .. string.format('%%%d@v:lua.SwitchBuffer@', buf.bufnr)
            tabline = tabline
                .. (active and '%#MyTabLineSel# ' or '%#MyTabLine# ')
                .. buf_label
            if i < end_index then
                tabline = tabline .. '%X' .. separator
            else
                tabline = tabline .. '%X'
            end
        end
    end

    if total_buffers > end_index then
        tabline = tabline
            .. '%#MyScrollIcon# '
            .. (total_buffers - end_index)
            .. ' »'
    end

    return tabline
end

-- Function to switch to the clicked buffer
function SwitchBuffer(bufnr)
    vim.api.nvim_set_current_buf(bufnr)
end

function UpdateTabline()
    vim.o.tabline = '%!v:lua.Tabline()'
end

SetTablineColors()
UpdateTabline()

vim.keymap.set(
    'n',
    '<Left>',
    ':lua ScrollTabline("left")<CR>',
    { noremap = true, silent = true }
)
vim.keymap.set(
    'n',
    '<Right>',
    ':lua ScrollTabline("right")<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_create_user_command('ToggleIcons', ToggleIcons, {})

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufEnter' }, {
    pattern = '*',
    callback = AutoScrollTabline,
})

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        SetTablineColors()
    end,
})
