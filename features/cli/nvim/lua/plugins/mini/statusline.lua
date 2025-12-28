local statusline = require('mini.statusline')

local icons = {
    Git = '',

    Signs = {
        ERROR = ' ',
        WARN = ' ',
        HINT = '󰌵 ',
        INFO = ' ',
    },
}

local function mode_with_arrow()
    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

    mode = string.upper(mode)

    local mode_colors = vim.api.nvim_get_hl(0, { name = mode_hl })
    local next_bg =
        vim.api.nvim_get_hl(0, { name = 'MiniStatuslineDevinfo' }).bg
    local sep_hl = 'MiniStatuslineModeSep'

    if mode_colors and mode_colors.bg then
        vim.api.nvim_set_hl(0, sep_hl, {
            fg = mode_colors.bg,
            bg = next_bg,
        })
    else
        sep_hl = 'MiniStatuslineDevinfo'
    end

    return {
        hl = mode_hl,
        strings = {
            mode .. ' ' .. string.format(
                '%%#%s#%%#%s#',
                sep_hl,
                'MiniStatuslineDevinfo'
            ),
        },
    }
end

local function file_icon()
    local ok, mini_icons = pcall(require, 'mini.icons')
    if not ok then
        return '', 'MiniStatuslineDevinfo'
    end

    local icon, color = mini_icons.get('filetype', vim.bo.filetype)
    if not icon then
        return '', 'MiniStatuslineDevinfo'
    end

    if type(color) == 'string' then
        local hl = vim.api.nvim_get_hl(0, { name = color })
        color = (hl and hl.fg and type(hl.fg) == 'number') and hl.fg or nil
    end

    color = color
        or vim.api.nvim_get_hl(0, { name = 'MiniStatuslineDevinfo' }).fg

    local icon_hl = 'MiniStatuslineFileIcon'
    vim.api.nvim_set_hl(0, icon_hl, {
        fg = color,
        bg = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineDevinfo' }).bg,
    })

    return icon, icon_hl
end

return {
    statusline.setup({
        content = {
            inactive = function()
                local icon, icon_hl = file_icon()

                return statusline.combine_groups({
                    '%<',
                    '%=',
                    {
                        hl = 'MiniStatuslineDevinfo',
                        strings = {
                            statusline.section_diff({
                                icon = '',
                                trunc_width = 40,
                            }),
                            statusline.section_diagnostics({
                                icon = '',
                                signs = icons.Signs,
                                trunc_width = 40,
                            }),
                        },
                    },
                    {
                        hl = icon_hl,
                        strings = { icon .. ' ' },
                    },
                })
            end,

            active = function()
                local icon, icon_hl = file_icon()

                return statusline.combine_groups({
                    mode_with_arrow(),
                    {
                        hl = 'MiniStatuslineDevinfo',
                        strings = {
                            statusline.section_git({
                                icon = icons.Git,
                                trunc_width = 75,
                            }),
                        },
                    },
                    '%<',
                    '%=',
                    {
                        hl = 'MiniStatuslineDevinfo',
                        strings = {
                            statusline.section_diff({
                                icon = '',
                                trunc_width = 40,
                            }),
                            statusline.section_diagnostics({
                                icon = '',
                                signs = icons.Signs,
                                trunc_width = 40,
                            }),
                        },
                    },
                    {
                        hl = icon_hl,
                        strings = { icon .. ' ' },
                    },
                })
            end,
        },
        use_icons = true,
    }),
}
