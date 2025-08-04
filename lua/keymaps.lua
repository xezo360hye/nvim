local lazy = require "lazy-load"
local oil = lazy.setup "oil"
local pick = lazy.setup "mini.pick"

vim.keymap.set("n", "<Esc>",   "<Cmd>noh<CR>")
vim.keymap.set("n", "<space>", "<nop>")

local function mapleader(lhs, rhs)
   vim.keymap.set("n", "<leader>" .. lhs, rhs)
end

mapleader("s",  "<Cmd>source<CR>")
mapleader("w",  "<Cmd>write<CR>")
mapleader("f",  function() vim.lsp.buf.format() end)
mapleader("o",  function() oil().open() end)
mapleader("pf", function() pick().builtin.files() end)
mapleader("pg", function() pick().builtin.grep_live() end)
mapleader("ph", function() pick().builtin.help() end)
