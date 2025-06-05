vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.cmdheight = 1
vim.cmd('let g:netrw_liststlye = 3')

vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.mouse = 'a'

vim.opt.scrolloff = 5

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smartindent = true

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

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = 'yes'

vim.opt.showmode = false
vim.opt.cursorline = true

vim.opt.list = true

vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.backspace = 'indent,eol,start'

vim.opt.pumheight = 15
