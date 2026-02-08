return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_b = {} -- hide git branch
      opts.sections.lualine_z = {} -- hide time
    end,
  },
}
