require "nvim-treesitter.configs".setup {
   ensure_installed = { "c", "bash", "lua", "luadoc", "vim", "vimdoc", "diff", "html", "javascript", "typescript", "svelte", "markdown" },
   highlight = {
      enable = true,
   },
}
