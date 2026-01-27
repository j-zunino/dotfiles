---------------------------------------------------------------
-- GENERAL
---------------------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = '80'
vim.o.winborder = 'single'
vim.o.termguicolors = true
vim.o.showmode = true
vim.o.shortmess = vim.o.shortmess .. 'I'
vim.o.guicursor = 'a:block'
vim.o.statusline = ' %f %r %= %l:%c - %{v:lua.custom_file_icon()} '

vim.o.scrolloff = 8
vim.o.pumheight = 15
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

vim.o.wrap = false
vim.o.linebreak = true
vim.o.list = true
vim.opt.listchars = { trail = '·', nbsp = '␣' }

vim.o.undofile = true
vim.o.swapfile = false
vim.o.backspace = 'indent,eol,start'

vim.o.updatetime = 100
vim.o.timeoutlen = 300

vim.o.splitbelow = true
vim.o.splitright = true

---------------------------------------------------------------
-- SEARCH
---------------------------------------------------------------
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split'

---------------------------------------------------------------
-- INDENT
---------------------------------------------------------------
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

---------------------------------------------------------------
-- FOLD
---------------------------------------------------------------
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = 'v:lua.custom_fold_text()'
vim.o.foldenable = true
vim.o.foldlevel = 99

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local lines = vim.v.foldend - vim.v.foldstart + 1
    return line .. ' … ' .. lines .. ' lines'
end

function _G.custom_file_icon()
    if vim.b._file_icon then
        return vim.b._file_icon
    end

    local ok, mini_icons = pcall(require, 'mini.icons')
    if not ok then
        return ''
    end

    local icon, _ = mini_icons.get('file', vim.fn.expand('%:t'))
    if not icon then
        vim.b._file_icon = ''
        return ''
    end

    vim.b._file_icon = icon .. ' '
    return vim.b._file_icon
end
