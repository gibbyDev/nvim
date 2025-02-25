-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

local pywal_colors = vim.fn.expand("~/.config/nvim/colors-wal.vim")

if vim.fn.filereadable(pywal_colors) == 1 then
    vim.cmd("source " .. pywal_colors) -- Load Pywal colors

    -- Apply Pywal colors to Neovim highlights using Lua
    local set_hl = function(group, fg, bg)
        vim.api.nvim_set_hl(0, group, { fg = fg, bg = bg })
    end

    set_hl("Normal", vim.g.foreground, vim.g.background)
    set_hl("Cursor", vim.g.cursor, vim.g.background)
    set_hl("LineNr", vim.g.color8, nil)
    set_hl("Comment", vim.g.color8, nil)
    set_hl("Visual", nil, vim.g.color4)
    set_hl("StatusLine", vim.g.color15, vim.g.color1)
    set_hl("VertSplit", vim.g.color1, vim.g.color1)
    set_hl("Pmenu", vim.g.color15, vim.g.color1)
    -- Ensure Pywal colors apply to syntax elements
    set_hl("Statement", vim.g.color12, nil) -- Keywords (if, else, return)
    set_hl("Function", vim.g.color14, nil)  -- Function names
    set_hl("String", vim.g.color11, nil)    -- Strings
    set_hl("Identifier", vim.g.color6, nil) -- Variables
    set_hl("Type", vim.g.color10, nil)      -- Types (int, char, struct)
    set_hl("PreProc", vim.g.color5, nil)    -- Preprocessor (import, include)
    set_hl("Constant", vim.g.color3, nil)   -- Constants (true, false, NULL)
    set_hl("Special", vim.g.color9, nil)    -- Special characters ([], {}, @)

    set_hl("NvimTreeFolderName", vim.g.color4, nil)
    set_hl("NvimTreeOpenedFolderName", vim.g.color6, nil)
    set_hl("NvimTreeFolderIcon", vim.g.color9, nil)
    set_hl("NvimTreeIndentMarker", vim.g.color8, nil)

    -- Apply Pywal colors to CmdLine
    set_hl("CmdLine", vim.g.color8, vim.g.color15)      -- Command line (default colors)
    set_hl("CmdLineInfo", vim.g.color15, vim.g.color1)  -- Command line input
    set_hl("CmdLineError", vim.g.color9, vim.g.color15) -- Error messages in cmdline
    set_hl("CmdLinePopup", vim.g.color2, vim.g.color15) -- Command line popup

else
    vim.cmd.colorscheme("default")
end

--vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
vim.o.conceallevel=2

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

