return {
  "clemenscodes/nx.nvim",

  dependencies = {
    "nvim-telescope/telescope.nvim",
  },

  -- Plugin will load when you use these keys
  keys         = {
    { "<leader>nx", "<cmd>Telescope nx actions<CR>",              desc = "nx actions" },
    { "<leader>ng", "<cmd>Telescope nx generators<CR>",           desc = "nx generators" },
    { "<leader>nw", "<cmd>Telescope nx workspace_generators<CR>", desc = "nx workspace generators" },
    { "<leader>ne", "<cmd>Telescope nx external_generators<CR>",  desc = "nx external generators" }
  },

  -- config = function()
  --   require("nx").setup({
  --   })
  -- end,

}
