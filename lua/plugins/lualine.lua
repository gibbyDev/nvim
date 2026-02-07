-- Safety check: if wal hasn't loaded yet, bail
if not vim.g.background then
  return
end

local bubbles_theme = {
  normal = {
    a = { fg = vim.g.background, bg = vim.g.color4 },
    b = { fg = vim.g.foreground, bg = vim.g.color8 },
    c = { fg = vim.g.foreground, bg = vim.g.background },
  },

  insert  = { a = { fg = vim.g.background, bg = vim.g.color2 } },
  visual  = { a = { fg = vim.g.background, bg = vim.g.color5 } },
  replace = { a = { fg = vim.g.background, bg = vim.g.color1 } },

  inactive = {
    a = { fg = vim.g.foreground, bg = vim.g.background },
    b = { fg = vim.g.foreground, bg = vim.g.background },
    c = { fg = vim.g.foreground, bg = vim.g.background },
  },
}

require("lualine").setup {
  options = {
    theme = bubbles_theme,
    component_separators = "",
    section_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "filename", "branch" },
    lualine_c = { "%=" },
    lualine_x = {},
    lualine_y = { "filetype", "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
}


