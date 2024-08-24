-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
  print('Done');
end
vim.opt.rtp:prepend(lazypath)

local pluginPath = 'plugins';
-- [[ Configure pluginst ]]
require('lazy').setup(pluginPath, {});

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'
require 'lsp-config'
require 'autocomplete'

-- [[ blank line ]]
-- require("ibl").setup()

-- [[ lualine ]]
require "editor-config"

-- require('nx')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: tsm2 sts=2 sw=2 et
