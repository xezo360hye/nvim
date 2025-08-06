local lazy = require "lazy-load"
local oil = lazy.setup "oil"
local pick = lazy.setup "mini.pick"

local map = vim.keymap.set

local function mapn(lhs, rhs)
   map("n", lhs, rhs)
end

local function mapleader(lhs, rhs)
   mapn("<leader>" .. lhs, rhs)
end

local function wincmd(action)
   return function() vim.cmd.winc(action) end
end

mapn("<Esc>",   vim.cmd.noh)
mapn("<space>", "<nop>")
mapn("<C-h>",   wincmd "h")
mapn("<C-j>",   wincmd "j")
mapn("<C-k>",   wincmd "k")
mapn("<C-l>",   wincmd "l")

mapleader("s",  vim.cmd.source)
mapleader("w",  vim.cmd.write)
mapleader("f",  vim.lsp.buf.format)
mapleader("o",  oil().open)
mapleader("pf", pick().builtin.files)
mapleader("pg", pick().builtin.grep_live)
mapleader("ph", pick().builtin.help)
