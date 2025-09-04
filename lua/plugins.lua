vim.pack.add({
   "https://github.com/nvim-treesitter/nvim-treesitter",
   "https://github.com/nvim-treesitter/nvim-treesitter-context",
   "https://github.com/neovim/nvim-lspconfig",
   "https://github.com/nvim-lua/plenary.nvim",

   -- functional
   "https://github.com/NMAC427/guess-indent.nvim",
   "https://github.com/folke/trouble.nvim",
   "https://github.com/stevearc/oil.nvim",

   -- visual
   "https://github.com/hiphish/rainbow-delimiters.nvim",
   "https://github.com/folke/todo-comments.nvim",
   "https://github.com/folke/tokyonight.nvim",
   "https://github.com/lewis6991/gitsigns.nvim",

   -- mini
   "https://github.com/echasnovski/mini.pick",
   "https://github.com/echasnovski/mini.statusline",
   "https://github.com/echasnovski/mini.bracketed",
   "https://github.com/echasnovski/mini.surround",
   "https://github.com/echasnovski/mini.clue",
   "https://github.com/echasnovski/mini.move",
   "https://github.com/echasnovski/mini.ai",
})

require "guess-indent".setup {}
require "oil".setup {}

require "todo-comments".setup {}
require "gitsigns".setup {
   attach_to_untracked = true,
}

require "mini.bracketed".setup {}
require "mini.surround".setup {}
require "mini.move".setup {}
require "mini.ai".setup {}

local statusline = require "mini.statusline"
statusline.setup { use_icons = true }
statusline.section_location = function()
   return "%2l:%-2v"
end

local miniclue = require "mini.clue"
miniclue.setup({
   triggers = {
      -- Leader triggers
      -- { mode = "n", keys = "<Leader>" },
      -- { mode = "x", keys = "<Leader>" },

      -- Built-in completion
      { mode = "i", keys = "<C-x>" },

      -- `g` key
      -- { mode = "n", keys = "g" },
      -- { mode = "x", keys = "g" },

      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },

      -- Registers
      { mode = "n", keys = '"' },
      { mode = "n", keys = "@" },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },

      -- Window commands
      { mode = "n", keys = "<C-w>" },

      -- `z` key
      -- { mode = "n", keys = "z" },
      -- { mode = "x", keys = "z" },
   },

   clues = {
      miniclue.gen_clues.builtin_completion(),
      -- miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers({ show_contents = true }),
      miniclue.gen_clues.windows({ submode_resize = true }),
      -- miniclue.gen_clues.z(),
   },

   window = {
      delay = 200,
   },
})
