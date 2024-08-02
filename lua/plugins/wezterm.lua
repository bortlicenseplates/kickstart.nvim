return {
  "willothy/wezterm.nvim",
  -- dir = "~/.config/wezterm/wezterm.nvim/",
  config = true,
  cmd = "WeztermSpawn",
  -- cond = vim.env.TERM == 'wezterm',
  -- dir = '~/.config/wezterm/wezterm.lua',
  -- config = function()
  --     require('wezterm').set_config({
  --         font = wezterm.font("FiraCode Nerd Font"),
  --         font_size = 12.0,
  --         color_scheme = "Dracula",
  --         hide_tab_bar_if_only_one_tab = true,
  --         enable_scroll_bar = true,
  --         scrollback_lines = 10000,
  --         window_padding = {
  --             left = 10,
  --             right = 10,
  --             top = 10,
  --             bottom = 10,
  --         },
  --         colors = {
  --             tab_bar = {
  --                 background = "#282a36",
  --                 active_tab = {
  --                     bg_color = "#44475a",
  --                     fg_color = "#f8f8f2",
  --                 },
  --                 inactive_tab = {
  --                     bg_color = "#282a36",
  --                     fg_color = "#6272a4",
  --                 },
  --                 inactive_tab_hover = {
  --                     bg_color = "#44475a",
  --                     fg_color = "#f8f8f2",
  --                 },
  --             },
  --         },
  --     })
  -- end,
  keys = {
    {
      "<leader>Wt",
      function()
        require('wezterm').open_or_focus()
      end,
      mode = { "n" },
      desc = "New wezterm tab",
    },
    {
      "<leader>wS",
      function()
        require("wezterm").split_pane.vertical {
          percent = 20,
        }
      end,
      mode = { "n" },
      desc = "New vertical pane",
    },
    {
      "<leader>wV",
      function()
        require("wezterm").split_pane.horizontal {
          percent = 33,
        }
      end,
      mode = { "n" },
      desc = "New horizontal pane",
    },
  },
  -- config = function(_, opts)
  --   require("wezterm").setup(opts)
  -- end,
};
