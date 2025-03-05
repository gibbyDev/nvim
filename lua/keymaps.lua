vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})
-- buffers
vim.api.nvim_set_keymap("n", "tk", ":blast<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", ":bfirst<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", ":bprev<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", ":bnext<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", ":bdelete<enter>", {noremap=false})
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
--
-- splits
--
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")
-- Quicker close split
vim.keymap.set("n", "<leader>qq", ":q<CR>",
  {silent = true, noremap = true}
)


-- Nvim Tree Toggle
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) 

-- Move selected lines up and down in visual mode while preserving the selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Smoothly join lines without moving the cursor to the end of the joined line
vim.keymap.set("n", "J", "mzJz")

-- Search for the next occurrence and center it on the screen
vim.keymap.set("n", "n", "nzzzv")

-- Search for the previous occurrence and center it on the screen
vim.keymap.set("n", "N", "Nzzzv")

-- Re-indent a paragraph and move back to the original position after the edit
vim.keymap.set("n", "=ap", "ma=ap'a")

-- Restart the LSP (Language Server Protocol)
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- The greatest remap ever: paste without affecting the clipboard or register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard in normal and visual mode
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Yank the entire line to the system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register, preventing overwriting of clipboard
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Open a new tmux window for session management with <C-f>
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format the current buffer using LSP on <leader>f
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Navigate to the next error in the quickfix list, centering the cursor
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Navigate to the previous error in the quickfix list, centering the cursor
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Navigate to the next item in the location list, centering the cursor
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- Navigate to the previous item in the location list, centering the cursor
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the word under the cursor throughout the file, case-insensitive
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable with <leader>x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Noice
vim.api.nvim_set_keymap("n", "<leader>nn", ":Noice dismiss<CR>", {noremap=true})

vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>",
  {silent = true, noremap = true}
)

vim.api.nvim_set_keymap('n', '<leader>rr', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })

function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match("^lua/") then
      package.loaded[name] = nil
    end
  end
  vim.cmd("source $MYVIMRC")
  print("Config Reloaded!")
end
