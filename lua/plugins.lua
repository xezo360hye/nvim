vim.pack.add {
   "https://github.com/NMAC427/guess-indent.nvim",
   "https://github.com/hiphish/rainbow-delimiters.nvim",
   "https://github.com/nvim-treesitter/nvim-treesitter",
   "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/folke/tokyonight.nvim",
   "https://github.com/echasnovski/mini.pick",
   "https://github.com/stevearc/oil.nvim",
}

require "guess-indent".setup {}
require "oil".setup {}
