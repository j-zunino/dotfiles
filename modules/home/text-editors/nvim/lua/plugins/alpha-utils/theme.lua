local dashboard = require('alpha.themes.dashboard')
local utils = require('alpha.utils')
local plenary_path = require('plenary.path')

local default_mru_ignore = { 'gitcommit' }
local max_index = 12
local math_randomseed = math.randomseed
local math_random = math.random
local file_icons = {
    enabled = true,
    highlight = true,
    provider = 'devicons',
}

math_randomseed(os.time())

local function get_random_index(max)
    return math_random(0, max)
end

local random_index = get_random_index(max_index)

local function load_ascii_art(index)
    local success, ascii = pcall(require, 'plugins.alpha-utils.Ascii' .. index)
    if not success then
        vim.notify(
            'Failed to load ASCII header for index ' .. index,
            vim.log.levels.ERROR
        )
        ascii = {
            [[                                  __]],
            [[     ___     ___    ___   __  __ /\_\    ___ ___]],
            [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
            [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
            [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
    end
    return ascii
end

local function load_color(index)
    local success, color = pcall(require, 'plugins.alpha-utils.Color' .. index)
    if not success then
        vim.notify(
            'Failed to load color for index ' .. index,
            vim.log.levels.ERROR
        )
        color = 'Type'
    end
    return color
end

local function icon(fn)
    if not (file_icons.provider == 'devicons') then
        vim.notify(
            'Invalid file icons provider. Disabling file icons.',
            vim.log.levels.WARN
        )
        file_icons.enabled = false
        return '', ''
    end

    local ico, hl = utils.get_file_icon(file_icons.provider, fn)
    if ico == '' then
        file_icons.enabled = false
        vim.notify(
            'Icon retrieval failed. Disabling file icons.',
            vim.log.levels.WARN
        )
        return '', ''
    end
    return ico, hl
end

local function file_button(fn, sc, short_fn, autocd)
    short_fn = short_fn or fn
    local ico_txt, fb_hl = '', {}

    if file_icons.enabled then
        local ico, hl = icon(fn)
        ico_txt = ico .. '  '
        if file_icons.highlight then
            table.insert(fb_hl, { hl or file_icons.highlight, 0, #ico })
        end
    end

    local file_button_el = dashboard.button(
        sc,
        ico_txt .. short_fn,
        '<cmd>e '
            .. vim.fn.fnameescape(fn)
            .. (autocd and ' | cd %:p:h' or '')
            .. '<CR>'
    )
    local fn_start = short_fn:match('.*[/\\]')
    if fn_start then
        table.insert(fb_hl, { 'Comment', #ico_txt - 2, #fn_start + #ico_txt })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local function mru(start, cwd, items_number, opts)
    opts = opts
        or {
            ignore = function(ext)
                return vim.tbl_contains(default_mru_ignore, ext)
            end,
            autocd = false,
        }
    items_number = items_number or 4
    local oldfiles, tbl = {}, {}

    for _, v in pairs(vim.v.oldfiles) do
        if #oldfiles >= items_number then
            break
        end
        if
            vim.fn.filereadable(v) == 1
            and (not cwd or vim.startswith(v, cwd))
            and not opts.ignore(v, utils.get_extension(v))
        then
            table.insert(oldfiles, v)
        end
    end

    for i, fn in ipairs(oldfiles) do
        local short_fn = cwd and vim.fn.fnamemodify(fn, ':.')
            or vim.fn.fnamemodify(fn, ':~')
        if #short_fn > 35 then
            short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
        end
        tbl[i] = file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
    end

    return { type = 'group', val = tbl, opts = {} }
end

local function info_text()
    return 'ERROR'
end

local header = {
    type = 'text',
    val = load_ascii_art(random_index),
    opts = { position = 'center', hl = load_color(random_index) },
}

local buttons = {
    type = 'text',
    val = {
        ' Find file [SPC s f] |  Live grep [SPC s g]',
    },
    opts = {
        position = 'center',
        hl = 'String',
    },
}

local section_mru = {
    type = 'group',
    val = {
        {
            type = 'text',
            val = 'Recent files',
            opts = { hl = 'SpecialComment', position = 'center' },
        },
        {
            type = 'group',
            val = function()
                return { mru(0, vim.fn.getcwd()) }
            end,
            opts = { shrink_margin = false },
        },
    },
}

local section_info = {
    type = 'text',
    val = info_text(),
    opts = {
        hl = 'Comment',
        position = 'center',
    },
}

dashboard.section = {
    info = section_info, -- Initialize the 'info' section properly here
}

vim.api.nvim_create_autocmd('User', {
    pattern = 'LazyVimStarted',
    callback = function()
        local stats = require('lazy').stats()
        local loaded_plugins = stats.loaded
        local total_plugins = stats.count
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

        local version = vim.version()
        local nvim_version_info = version.major
            .. '.'
            .. version.minor
            .. '.'
            .. version.patch

        dashboard.section.info.val = '󰒲 '
            .. loaded_plugins
            .. '/'
            .. total_plugins
            .. ' plugins loaded in '
            .. ms
            .. 'ms  '
            .. nvim_version_info

        pcall(vim.cmd.AlphaRedraw)
    end,
})

local config = {
    layout = {
        { type = 'padding', val = 1 },
        header,
        { type = 'padding', val = 1 },
        buttons,
        { type = 'padding', val = 1 },
        section_mru,
        { type = 'padding', val = 1 },
        section_info, -- Include section_info in layout
    },
    opts = {
        margin = 5,
        setup = function()
            vim.api.nvim_create_autocmd('DirChanged', {
                pattern = '*',
                group = 'alpha_temp',
                callback = function()
                    require('alpha').redraw()
                end,
            })
        end,
    },
}

return {
    header = header,
    buttons = buttons,
    mru = mru,
    config = config,
    leader = dashboard.leader,
    file_icons = file_icons,
}
