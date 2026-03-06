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

-- Terminal mode: navigate between windows with Ctrl-h/j/k/l
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to window below" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to window above" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window" })

-- Forward Shift+Enter to terminal apps (e.g. Claude Code newline)
vim.keymap.set("t", "<S-CR>", function()
  vim.fn.chansend(vim.bo.channel, "\x1b[13;2u")
end, { noremap = true, desc = "Send Shift+Enter to terminal" })
