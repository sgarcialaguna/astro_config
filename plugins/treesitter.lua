return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "mrjones2014/nvim-ts-rainbow",
  },
  opts = {
    -- ensure_installed = { "lua" },
    rainbow = {
      enable = true,
      extended_mode = true
    }
  },
}
