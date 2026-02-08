-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.opt.colorcolumn = "120"
vim.g.autoformat = false

-- disable copilot integration with cmp
vim.g.ai_cmp = false

-- disabl line numbers
vim.opt.number = false
vim.opt.relativenumber = false

-- don't sync unnamed register with system clipboard
vim.opt.clipboard = ""
--
-- lua/config/options.lua
local opt = vim.opt

-- Make vimgrep/globbing skip virtual envs
opt.wildignore:append({
  "*/venv/*",
  "*/.venv/*",
  "*/__pycache__/*",
  "*/build/*",
  "*/dist*/*",
  "*/target/*",
  "*/builds/*",
  "*/node_modules/*",
})

-- Use ripgrep for :grep and :vimgrep-like results
-- opt.grepprg = "rg --vimgrep --no-heading --smart-case"
-- opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep --smart-case"
vim.opt.grepformat = "%f:%l:%c:%m"

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
vim.opt.showbreak = "↪ "

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.opt_local.wrap = false
    vim.opt_local.linebreak = false
  end,
})

vim.opt.cursorline = false
