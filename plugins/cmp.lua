return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "ray-x/lsp_signature.nvim" },
    opts = function(_, config) table.insert(config.sources, { name = "nvim_lsp_signature_help" }) end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = {
      hint_prefix = "",
    },
  },
}
