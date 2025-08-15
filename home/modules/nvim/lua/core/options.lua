---------------------------------------------------------------
-- GENERAL
---------------------------------------------------------------
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = '80'
vim.o.termguicolors = true
vim.o.showmode = false

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
