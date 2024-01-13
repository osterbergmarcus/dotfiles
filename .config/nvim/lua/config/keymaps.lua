-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local builtin = require("telescope.builtin")

vim.keymap.set("i", "jj", "<ESC>", { desc = "Fast escape" })
vim.keymap.set("i", "<C-q>", ":q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<C-q>", "<esc>:q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>conf", ":vsplit $MYVIMRC<cr>", { desc = "Vim conf" })
vim.keymap.set("n", "<silent> \\", builtin.buffers, { desc = "Telescope Buffers" })
