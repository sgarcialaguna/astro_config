return {
  {
    "yioneko/nvim-cmp",
    dependencies = { "ray-x/lsp_signature.nvim" },
    opts = function(_, config)
      table.insert(config.sources, { name = "nvim_lsp_signature_help" })
  
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      function name()
        -- code
      end
  
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end
  
      config.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" })
  
      config.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" })
  
      -- config.performance = {
      --   debounce = 300,
      --   throttle = 100,
      --   fetching_timeout = 50,
      -- }
  
      return config
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = {
      hint_prefix = "",
    },
  },
}
