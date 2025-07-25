---------------------------------------------------------------
-- GENERAL
---------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.scrolloff = 8
vim.opt.pumheight = 15
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backspace = 'indent,eol,start'

vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

vim.opt.splitbelow = true
vim.opt.splitright = true

---------------------------------------------------------------
-- SEARCH
---------------------------------------------------------------
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'

---------------------------------------------------------------
-- INDENT
---------------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

---------------------------------------------------------------
-- FOLD
---------------------------------------------------------------
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.foldenable = true
vim.opt.foldlevel = 99

function _G.custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local lines = vim.v.foldend - vim.v.foldstart + 1
    return line .. ' … ' .. lines .. ' lines'
end
