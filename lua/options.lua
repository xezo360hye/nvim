vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.wrap = false
vim.o.undofile = true
vim.g.mapleader = " "
vim.o.winborder = "single"
vim.o.completeopt = "menu,popup,noselect"
vim.o.signcolumn = "yes"
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.inccommand = "split"

vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.highlight.on_yank()
   end,
})
