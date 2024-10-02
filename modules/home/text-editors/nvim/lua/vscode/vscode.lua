vim.opt.showmode = false

function _G.get_mode()
    local mode = vim.api.nvim_get_mode().mode
    local mode_map = {
        ["n"] = "NORMAL",
        ["no"] = "N·OPERATOR PENDING ",
        ["v"] = "VISUAL",
        ["V"] = "V·LINE",
        ["\x16"] = "V·BLOCK",
        ["s"] = "SELECT",
        ["S"] = "S·LINE",
        ["^S"] = "S·BLOCK",
        ["i"] = "INSERT",
        ["R"] = "REPLACE",
        ["Rv"] = "V·REPLACE",
        ["Rx"] = "C·REPLACE",
        ["Rc"] = "C·REPLACE",
        [":"] = "COMMAND",
        ["cv"] = "VIM EX",
        ["ce"] = "EX",
        ["r"] = "PROMPT",
        ["rm"] = "MORE",
        ["r?"] = "CONFIRM",
        ["!"] = "SHELL",
        ["t"] = "TERMINAL",
    }
    return mode_map[mode] or mode
end

-- set the statusline
vim.o.statusline = "%#PmenuSel# " .. "%{v:lua.get_mode()}"

vim.opt.timeoutlen = 500

-- vim.keymap.set('n', '<leader>i', function() vim.fn.VSCodeNotify('extension.toggleBool') end)

-- function to check if the current split is on the left
local function is_left_split()
    return vim.fn.winnr("$") == vim.fn.winnr()
end

-- function to increase the width of the current split
local function increase_width()
    if is_left_split() then
        vim.fn.VSCodeNotify("workbench.action.decreaseViewWidth")
    else
        vim.fn.VSCodeNotify("workbench.action.increaseViewWidth")
    end
end

-- function to decrease the width of the current split
local function decrease_width()
    if is_left_split() then
        vim.fn.VSCodeNotify("workbench.action.increaseViewWidth")
    else
        vim.fn.VSCodeNotify("workbench.action.decreaseViewWidth")
    end
end

-- function to center the screen
local function center_screen()
    vim.cmd("normal zz")
end

-- split vertical
local function split_vertical()
    vim.fn.VSCodeNotify("workbench.action.splitEditor")
    vim.defer_fn(function()
        vim.cmd("vsplit")
        center_screen()
    end, 50)
end

-- split horizontal
local function split_horizontal()
    vim.fn.VSCodeNotify("workbench.action.splitEditorDown")
    vim.defer_fn(function()
        vim.cmd("split")
        center_screen()
    end, 50)
end

-- split width
vim.keymap.set("n", "<C-w>v", split_vertical)
vim.keymap.set("n", "<C-w>s", split_horizontal)

-- set keybindings
vim.keymap.set("n", "<C-h>", increase_width)
vim.keymap.set("n", "<C-l>", decrease_width)
vim.keymap.set("n", "+", function()
    vim.fn.VSCodeNotify("workbench.action.increaseViewHeight")
end)
vim.keymap.set("n", "-", function()
    vim.fn.VSCodeNotify("workbench.action.decreaseViewHeight")
end)
