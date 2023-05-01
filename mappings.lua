-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local telescope = require "telescope.builtin"
local utils = require "astronvim.utils"
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>c"] = "c", -- leader c to cut
    ["<leader>d"] = "d", -- leader d to cut
    -- VSCode-like bindings
    ["<C-p>"] = { function() telescope.find_files() end, desc = "Find files" },
    ["<C-t>"] = { function() telescope.lsp_dynamic_workspace_symbols() end, desc = "Find workspace symbols" },
    ["<leader>fs"] = { function() telescope.lsp_dynamic_workspace_symbols() end, desc = "Find workspace symbols" },
    ["<leader>gh"] = false,
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
    ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
    -- Open Lazygit in float
    ["<leader>gg"] = {
      function() utils.toggle_term_cmd { cmd = "lazygit", direction = "float" } end,
      desc = "ToggleTerm lazygit",
    },
    ["<leader>tl"] = {
      function() utils.toggle_term_cmd { cmd = "lazygit", direction = "float" } end,
      desc = "ToggleTerm lazygit",
    },
    ["<F5>"] = { "<cmd>OverseerRun<cr>", desc = "Run task" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Force write" },
  },
}
