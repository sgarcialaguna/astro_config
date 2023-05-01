return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = true,
  opts = function(_, opts) opts.builtin_marks = { "[", "]" } end,
}
