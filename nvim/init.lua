-- <leader>
vim.g.mapleader = " "
-- vim.cmd("language en_US")

vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
  end,
})

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- Keymaps
-- redo
vim.keymap.set("n", "U", "<C-r>")

-- nohls
vim.keymap.set("n", "<Esc>", ":nohlsearch<cr>")

-- move 5 lines (up/down)
vim.keymap.set("n", "J", "5j")
vim.keymap.set("n", "K", "5k")

-- copy entire line
vim.keymap.set("n", "Y", "^y$")

-- skip folds
vim.cmd("nmap j gj")
vim.cmd("nmap k gk")

-- extensions/VSCode commands
if vim.g.vscode then
  -- open quick fix menu
  vim.keymap.set("n", "<leader>q", function() vim.fn.VSCodeNotify("editor.action.quickFix") end)

  -- show hover
  vim.keymap.set("n", "<leader>h", function() vim.fn.VSCodeNotify("editor.action.showHover") end)

  -- open live preview
  vim.keymap.set("n", "<leader>p", function() vim.fn.VSCodeNotify("livePreview.start.preview.atFile") end)

  -- px to rem
  vim.keymap.set("n", "<leader>c", function() vim.fn.VSCodeNotify("extension.pxToremAndRemToPx") end)

  -- toggle bool
  vim.keymap.set("n", "<leader>i", function() vim.fn.VSCodeNotify("extension.toggleBool") end)

  -- toggle fold
  vim.keymap.set("n", "<leader>{", function() vim.fn.VSCodeNotify("editor.toggleFold") end)
end
