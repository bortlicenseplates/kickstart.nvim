return {
  {
    "Equilibris/nx.nvim",

    dependencies = {
      "nvim-telescope/telescope.nvim",
    },

    opts         = {
      -- See below for config options
      nx_cmd_root = "yarn nx",
    },

    -- Plugin will load when you use these keys
    keys         = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>",              desc = "nx actions" },
      { "<leader>ng", "<cmd>Telescope nx generators<CR>",           desc = "nx generators" },
      { "<leader>nw", "<cmd>Telescope nx workspace_generators<CR>", desc = "nx workspace generators" },
      { "<leader>ne", "<cmd>Telescope nx external_generators<CR>",  desc = "nx external generators" }
    },
  },
}
