-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true

require("lazy").setup({

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },

  { "echasnovski/mini.nvim", version = false },

  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {},
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = { wo = { wrap = true } },
      },
    },
    keys = {
      { "<leader>un", function() Snacks.notifier.hide() end },
      { "<leader>bd", function() Snacks.bufdelete() end },
      { "<leader>gg", function() Snacks.lazygit() end },
      { "<leader>gb", function() Snacks.git.blame_line() end },
      { "<leader>gB", function() Snacks.gitbrowse() end },
      { "<leader>gf", function() Snacks.lazygit.log_file() end },
      { "<leader>gl", function() Snacks.lazygit.log() end },
      { "<leader>cR", function() Snacks.rename.rename_file() end },
      { "<c-/>", function() Snacks.terminal() end },
      { "<c-_>", function() Snacks.terminal() end },
    },
    init = function()
      Snacks = require("snacks")
    end,
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    name = "render-markdown",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "NeogitOrg/neogit",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  "onsails/lspkind.nvim",
  "preservim/vim-pencil",
  "folke/zen-mode.nvim",
  "tpope/vim-obsession",
  "ThePrimeagen/git-worktree.nvim",

  {
    "epwalsh/obsidian.nvim",
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({})
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = true,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = true,
  },
  --
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  --   config = function()
  --     require("nvim-treesitter.config").setup({
  --       ensure_installed = {
  --         "go", "lua", "python", "rust", "typescript",
  --         "bash", "markdown", "html", "css", "javascript",
  --         "yaml", "json", "toml",
  --       },
  --       highlight = { enable = true },
  --       indent = { enable = true },
  --     })
  --   end,
  -- },
  --
  -- Completion plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  -- LSP config
  "neovim/nvim-lspconfig",
  -- LSP status
  "j-hui/fidget.nvim",
{
  "ray-x/go.nvim",
  dependencies = { "ray-x/guihua.lua" },
  ft = { "go", "gomod" },  -- only load for Go files
  config = function()
    -- setup the plugin itself
    require('go').setup()

    -- auto-format on save
    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
  end,
},

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  "theHamsta/nvim-dap-virtual-text",
  "leoluz/nvim-dap-go",
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "nvim-lualine/lualine.nvim",
  "tpope/vim-sleuth",

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  "nvim-telescope/telescope-symbols.nvim",

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },

  {
    "folke/twilight.nvim",
    ft = "markdown",
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = true,
  },

})

