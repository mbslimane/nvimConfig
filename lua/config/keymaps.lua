-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

vim.keymap.set("n", "<leader>ci", "<cmd>TypescriptAddMissingImports<CR>", { desc = "Add missing imports" })
vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { desc = "Organize imports" })
vim.keymap.set("n", "<leader>cu", "<cmd>TypescriptRemoveUnused<CR>", { desc = "Remove unused" })
