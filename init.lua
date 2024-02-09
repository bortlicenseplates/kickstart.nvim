-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local pluginPath = 'plugins';
-- [[ Configure pluginst ]]
require('lazy').setup(pluginPath, {});

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require 'treesitter-setup'

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require 'lsp-setup'

-- indent blank line setup

require("ibl").setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
