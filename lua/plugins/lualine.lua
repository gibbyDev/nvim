require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" }, -- Rounded separators
    section_separators = { left = "", right = "" }, -- Rounded section separators
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_a = {
      {
        'buffers',
      }
    }
  }
}

