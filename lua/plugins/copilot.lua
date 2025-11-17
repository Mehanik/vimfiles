return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<Tab>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-\\>",
      },
    },
    panel = {
      enabled = false,
    },
  },
}
