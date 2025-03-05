require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" }, -- Small rounded edges between components
    section_separators = { left = "", right = "" }, -- Full rounded sections (pill shape)
  },
  sections = {
    lualine_a = {
      {
        'mode',
        separator = { left = "", right = "" }, -- Ensures the section is enclosed
        color = { fg = "#000000", bg = "#ff9e64" }, -- Custom colors if needed
      },
    },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        separator = { left = "", right = "" },
        color = { fg = "#000000", bg = "#ff9e64" },
      },
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        separator = { left = "", right = "" },
        color = { fg = "#000000", bg = "#ff9e64" },
      },
    },
  }
}

