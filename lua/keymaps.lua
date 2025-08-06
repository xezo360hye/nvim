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
mapleader("o",  function() oil.open() end)
mapleader("pf", function() pick.builtin.files() end)
mapleader("pg", function() pick.builtin.grep_live() end)
mapleader("ph", function() pick.builtin.help() end)
