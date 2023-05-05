return {
  {
    "yioneko/nvim-cmp",
    dependencies = { "hrsh7th/cmp-nvim-lsp-signature-help" },
    opts = function(_, config)
      table.insert(config.sources, { name = "nvim_lsp_signature_help" })

      return config
    end,
  },
}
