local main = 'SUPER + '
local mod = 'SHIFT + '

local window = hl.dsp.window
local layout = hl.dsp.layout

-------------------------------------------------------------------------------
-- UTILS
-------------------------------------------------------------------------------
local map = function(keys, func, opts)
    hl.bind(main .. keys, func, opts)
end

local mapMod = function(keys, func, opts)
    hl.bind(main .. mod .. keys, func, opts)
end

local function exec(cmd)
    return hl.dsp.exec_cmd(cmd)
end

local function current_layout()
    return hl.get_active_workspace().tiled_layout
end

-------------------------------------------------------------------------------
-- APPS
-------------------------------------------------------------------------------
map('Q', exec('foot'))
map('F', exec('zen'))
map('E', exec('thunar'))

-------------------------------------------------------------------------------
-- MENU
-------------------------------------------------------------------------------
local menu = 'foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/launcher'
local clipboard = 'foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/clipboard'
local logout = 'foot -T floating-fzf -e $HOME/dotfiles/scripts/fzf/logout'

map('P', exec(menu))
map('D', exec(menu))
map('V', exec(clipboard))
mapMod('Q', exec(logout))

hl.window_rule({
    name = 'floating-fzf',
    match = {
        class = 'foot',
        title = 'floating-fzf',
    },

    float = true,
    center = true,
    size = { 600, 600 },
})

-------------------------------------------------------------------------------
-- WINDOWS
-------------------------------------------------------------------------------
mapMod('C', window.close())

map('J', function()
    if current_layout() == 'scrolling' then
        hl.dispatch(layout('focus r'))
    else
        hl.dispatch(layout('cyclenext'))
    end
end)
map('K', function()
    if current_layout() == 'scrolling' then
        hl.dispatch(layout('focus l'))
    else
        hl.dispatch(layout('cycleprev'))
    end
end)

mapMod('J', function()
    if current_layout() == 'scrolling' then
        hl.dispatch(layout('swapcol r'))
    else
        hl.dispatch(layout('swapnext'))
    end
end)
mapMod('K', function()
    if current_layout() == 'scrolling' then
        hl.dispatch(layout('swapcol l'))
    else
        hl.dispatch(layout('swapprev'))
    end
end)

map(
    'h',
    window.resize({ x = -10, y = 0, relative = true }),
    { repeating = true }
)
map(
    'l',
    window.resize({ x = 10, y = 0, relative = true }),
    { repeating = true }
)

mapMod('BACKSPACE', function()
    if current_layout() == 'master' then
        hl.dispatch(layout('swapwithmaster'))
    end
end)

map('M', window.fullscreen({ mode = 'fullscreen', action = 'toggle' }))
mapMod('SPACE', window.float({ action = 'toggle' }))

map('mouse:272', window.drag(), { mouse = true })
map('mouse:273', window.resize(), { mouse = true })

-------------------------------------------------------------------------------
-- WORKSPACE
-------------------------------------------------------------------------------
for i = 1, 10 do
    local key = i % 10
    map(key, hl.dsp.focus({ workspace = i }))
    mapMod(key, window.move({ workspace = i, follow = false }))
end

local layouts = {}
map('N', function()
    local ws = tostring(hl.get_active_workspace().id)
    local current = layouts[ws] or 'master'

    layouts[ws] = current == 'master' and 'scrolling' or 'master'

    hl.workspace_rule({
        workspace = ws,
        layout = layouts[ws],
    })
end)

-------------------------------------------------------------------------------
-- MISC
-------------------------------------------------------------------------------
map('B', exec('pkill -SIGUSR1 waybar')) -- Toggle waybar
map('C', exec('hyprpicker'))
