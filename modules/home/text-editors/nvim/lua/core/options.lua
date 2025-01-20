vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.cmdheight = 1
vim.g.have_nerd_font = true
vim.cmd('let g:netrw_liststlye = 3')

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

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.smartindent = true

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.signcolumn = 'yes'

vim.opt.showmode = false
vim.opt.cursorline = true

vim.opt.list = true

vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- vim.opt.listchars = { tab = '» ', trail = '░', nbsp = '␣' }
--
-- local function toggle_trailing_whitespace_highlight()
--     if vim.bo.filetype == "alpha" then
--         vim.cmd("match none")
--     else
--         vim.cmd("match errorMsg /\\s\\+$/")
--     end
-- end

-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "FileType"}, {
--     pattern = "*",
--     callback = toggle_trailing_whitespace_highlight,
-- })

-- vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} %s'

vim.opt.inccommand = 'split'

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.backspace = 'indent,eol,start'
