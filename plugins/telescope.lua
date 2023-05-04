local actions = require "telescope.actions"
local fzf_opts = {
  fuzzy = true, -- false will only do exact matching
  override_generic_sorter = true, -- override the generic sorter
  override_file_sorter = true, -- override the file sorter
  case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  -- the default case_mode is "smart_case"
}
return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules", "build" },
      show_hidden = true,
      mappings = {
        i = {
          ["<esc>"] = actions.close,
        },
      },
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*,!.yarn/*" },
      },
      -- Manually set sorter, for some reason not picked up automatically
      lsp_dynamic_workspace_symbols = {
        sorter = require("telescope").extensions.fzf.native_fzf_sorter(fzf_opts),
      },
    },
    extension = {
      fzf = fzf_opts,
    },
  },
}
