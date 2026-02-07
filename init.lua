vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('plugins.lazy') -- make sure lazy.nvim and plugins are loaded first

-- Now it's safe to load all plugin configs and user settings
require('keymaps')
require('options')
require('plugins.misc')
require('plugins.lualine')
require('misc')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.tele')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.trouble')
require('plugins.obsidian')
require('plugins.zenmode')
require('plugins.neogit')
require('plugins.harpoon')
require('plugins.mini')
require('plugins.copilot')

-- vim: ts=8 sts=2 sw=2 et
