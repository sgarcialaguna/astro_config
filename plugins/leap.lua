return {
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n" }, desc = "Leap backward to" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      -- Do not jump to first label
      leap.opts.safe_labels = {}
      leap.add_default_mappings()
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
}
