-- TODO: Add scrolling back and forward

local SillyBufline = {}
local H = {}

SillyBufline.setup = function(config)
    config = H.setup_config(config)

    H.apply_config(config)

    H.create_default_hl()
end

SillyBufline.config = {
    show_icons = true, -- Whether to show file icons

    set_vim_settings = true, -- Whether to set Vim's settings for tabline

    separator = '|', -- Separator to use between buffers
}

H.setup_config = function(config)
    H.check_type('config', config, 'table', true)
    config = vim.tbl_deep_extend(
        'force',
        vim.deepcopy(H.default_config),
        config or {}
    )

    H.check_type('show_icons', config.show_icons, 'boolean')
    H.check_type('set_vim_settings', config.set_vim_settings, 'boolean')
    H.check_type('separator', config.separator, 'string')

    return config
end

H.apply_config = function(config)
    SillyBufline.config = config

    -- Set settings to ensure tabline is displayed properly
    if config.set_vim_settings then
        vim.o.showtabline = 2
    end

    vim.o.tabline = "%!v:lua.require'silly.bufline'.bufline()"
end

-- stylua: ignore
-- Function to create and apply highlight groups
H.create_default_hl = function()
    local function set_hl(name, opts)
        vim.api.nvim_set_hl(0, name, opts)
    end

    local bufsel = H.get_hl_color('Normal', 'fg')
    local bufnormal = H.get_hl_color('Comment', 'fg')
    local bufmodified = H.get_hl_color('DiagnosticInfo', 'fg')

    -- Define highlights
    set_hl('SillyBuflineSelected', { fg = bufsel, bg = nil, bold = true })
    set_hl('SillyBuflineNormal', { fg = bufnormal, bg = nil, bold = false })
    set_hl('SillyBuflineModifiedSelected', { fg = bufmodified, bg = nil, bold = true })
    set_hl('SillyBuflineModifiedNormal', { fg = bufmodified, bg = nil, bold = false })
    set_hl('SillyBuflineSeparator', { fg = bufnormal, bg = nil, bold = false })
    set_hl('SillyBuflineFill', { bg = nil })

    vim.api.nvim_set_hl(0, "TabLineFill", { link = "SillyBuflineFill" })
end

H.concat_buffers = function(buffers)
    local separator = SillyBufline.config.separator or '|'
    local separator_hl = '%#SillyBuflineSeparator#' .. separator .. '%#Normal#'
    return table.concat(buffers, separator_hl)
end

SillyBufline.bufline = function()
    local bufs = vim.fn.getbufinfo({ buflisted = 1 })
    local buffers = {}

    for _, buf in ipairs(bufs) do
        local bufname = buf.name
        local short_name = vim.fn.fnamemodify(bufname, ':t')

        if short_name == '' then
            short_name = '[No Name]'
        end

        local icon = ''
        local icon_hl = ''

        if SillyBufline.config.show_icons then
            if H.has_mini_icons() then
                if vim.bo[buf.bufnr].modified then
                    icon, icon_hl = '●', ''
                else
                    icon, icon_hl = _G.MiniIcons.get('file', short_name)
                end
            end

            if icon and icon ~= '' then
                icon = ' ' .. icon
            end
            if icon_hl and icon_hl ~= '' then
                icon_hl = '%#' .. icon_hl .. '#'
            else
                icon_hl = ''
            end
        end

        local hl
        if buf.bufnr == vim.api.nvim_get_current_buf() then
            hl = vim.bo[buf.bufnr].modified
                    and '%#SillyBuflineModifiedSelected#'
                or '%#SillyBuflineSelected#'
        else
            hl = vim.bo[buf.bufnr].modified and '%#SillyBuflineModifiedNormal#'
                or '%#SillyBuflineNormal#'
        end

        table.insert(buffers, icon_hl .. icon .. hl .. ' ' .. short_name .. ' ')
    end

    return H.concat_buffers(buffers) .. '%#SillyBuflineFill# '
end

H.default_config = vim.deepcopy(SillyBufline.config)

H.has_mini_icons = function()
    local ok, mini_icons = pcall(function()
        return _G.MiniIcons
    end)
    return ok and mini_icons ~= nil
end

function H.get_hl_color(hl_group, attr)
    local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = hl_group })
    if not ok or not hl[attr] then
        return 'NONE'
    end
    return string.format('#%06x', hl[attr])
end

H.error = function(msg)
    error('(silly.bufline) ' .. msg, 0)
end

H.check_type = function(name, val, ref, allow_nil)
    if
        type(val) == ref
        or (ref == 'callable' and vim.is_callable(val))
        or (allow_nil and val == nil)
    then
        return
    end
    H.error(string.format('`%s` should be %s, not %s', name, ref, type(val)))
end

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        H.create_default_hl()
    end,
})

return SillyBufline
