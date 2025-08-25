-- Left column
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"

-- Visuals
vim.o.showmode = false
vim.o.winborder = "single"
vim.o.breakindent = true
vim.o.cursorline = true
vim.o.scrolloff = 3
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99

-- Experience
vim.o.confirm = true
vim.o.expandtab = true
vim.o.undofile = true
vim.o.swapfile = false
vim.g.mapleader = " "

-- Search
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smartcase = true

-- Split
vim.o.splitright = true
vim.o.splitbelow = true

-- Highlights
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.api.nvim_create_autocmd("TextYankPost", {
   callback = function()
      vim.hl.on_yank()
   end,
})

vim.api.nvim_create_autocmd("LspAttach", {
   callback = function(event)
      local highlight_augroup = vim.api.nvim_create_augroup("my.lsp-highlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
         buffer = event.buf,
         group = highlight_augroup,
         callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter" }, {
         buffer = event.buf,
         group = highlight_augroup,
         callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
         group = vim.api.nvim_create_augroup("my.lsp-detach", { clear = true }),
         callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds {
               group = highlight_augroup,
               buffer = event2.buf,
            }
         end,
      })
   end,
})
