vim.lsp.enable({ "lua_ls", "denols", "svelte" })
vim.lsp.config("lua_ls", {
   settings = {
      Lua = {
         runtime = {
            version = "LuaJIT",
         },
         workspace = {
            checkThirdParty = false,
            library = {
               vim.env.VIMRUNTIME,
            },
         },
         format = {
            enable = true,
            defaultConfig = {
               indent_style = "space",
               indent_size = "3",

               quote_style = "double",
               table_separator_style = "comma",
               trailing_table_separator = "smart",
               call_arg_parentheses = "remove_string_only",
               space_after_comment_dash = "true",
               space_around_math_operator = "true",
               ["space_around_math_operator.exponent"] = "false",
               align_call_args = "true",
               align_continuous_similar_call_args = "true",

               line_space_after_local_or_assign_statement = "max(2)",
               line_space_after_expression_statement = "max(2)",
               line_space_after_comment = "keep",
               line_space_around_block = "max(1)",

               break_all_list_when_line_exceed = "true",
               remove_call_expression_list_finish_comma = "true",
               end_statement_with_semicolon = "replace_with_newline",
            },
         },
      },
   },
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
