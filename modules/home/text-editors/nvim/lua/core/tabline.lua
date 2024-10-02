vim.opt.termguicolors = true
vim.opt.showtabline = 2

_G.show_icons = true

-- everforest color scheme --
-- tab: bg3, tab sel: green, separator: bg1
vim.cmd([[
    highlight MyTabLine guibg=NONE guifg=#475258
    highlight MyTabLineSel guibg=NONE guifg=#a7c080 gui=bold 
    highlight MyTabLineSeparator guibg=NONE guifg=#343F44
]])


function ToggleIcons()
    _G.show_icons = not _G.show_icons
    vim.o.tabline = '%!v:lua.Tabline()'
end

function Tabline()
    local tabline = ''
    local separator = '%#MyTabLineSeparator#|'
    local buffers = vim.fn.getbufinfo({ buflisted = 1 })

    for i, buf in ipairs(buffers) do
        local buf_name = vim.fn.fnamemodify(buf.name, ':t')
        local file_ext = vim.fn.fnamemodify(buf.name, ':e')
        local modified = buf.changed == 1
        local active = buf.bufnr == vim.fn.bufnr('%')

        local icon = _G.show_icons and require('nvim-web-devicons').get_icon(buf_name, file_ext, { default = true }) .. ' ' or ''

        local buf_label = (modified and ' ' or '') .. icon .. buf_name

        if active then
            tabline = tabline .. '%#MyTabLineSel# ' .. buf_label .. ' '
        else
            tabline = tabline .. '%#MyTabLine# ' .. buf_label .. ' '
        end

        if i < #buffers then
            tabline = tabline .. separator
        end
    end

    return tabline
end

vim.o.tabline = '%!v:lua.Tabline()'

vim.api.nvim_create_user_command('ToggleIcons', function() ToggleIcons() end, {})


