-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Disable diagnostics by default for markdown files (toggle back with <leader>ud)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

-- Prevent terminal windows from being resized when other windows close
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.wo.winfixheight = true
    vim.wo.winfixwidth = true
  end,
})

-- Auto-enter insert mode when switching to a terminal window
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- Reload files changed by Claude Code (or other tools) in embedded terminal
vim.api.nvim_create_autocmd({ "TermLeave", "BufEnter" }, {
  callback = function()
    if vim.bo.buftype ~= "terminal" then
      vim.cmd("checktime")
    end
  end,
})
