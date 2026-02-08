-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Highlight word under cursor without moving
vim.keymap.set("n", "*", function()
  local pos = vim.fn.getpos(".")
  local view = vim.fn.winsaveview()
  vim.cmd("normal! *")
  vim.fn.setpos(".", pos)
  vim.fn.winrestview(view)
end, { desc = "Search for word under cursor" })
