return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    local code_actions = null_ls.builtins.code_actions
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      code_actions.eslint_d,
      formatting.eslint_d,
      diagnostics.eslint_d,
      formatting.black,
      diagnostics.pylint,
      formatting.isort,
      formatting.stylua,
    }
    return config -- return final config table
  end,
}
