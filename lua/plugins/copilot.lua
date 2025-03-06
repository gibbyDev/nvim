-- lua/plugins/copilot.lua
return {
    "github/copilot.vim",
    config = function()
        vim.cmd("Copilot setup")
        -- Keybinding to accept Copilot suggestion
        vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
}
