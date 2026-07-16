return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      provider = "native",
    },
    -- Claude wraps its OSC 52 clipboard writes in tmux's DCS passthrough envelope
    -- (\ePtmux;...\e\\) whenever $TMUX is set. Inside nvim's :terminal the immediate
    -- terminal is nvim, not tmux, so nvim's vterm can't unwrap it: the inner sequence
    -- leaks onto the screen as "52;c;<base64>" and the copy never reaches the clipboard.
    -- Strip TMUX/TMUX_PANE for the Claude process (env -u) so it emits plain OSC 52,
    -- which nvim consumes and forwards to the system clipboard via its own provider.
    -- nvim itself keeps $TMUX, so its `tmux load-buffer` clipboard provider still works.
    terminal_cmd = "env -u TMUX -u TMUX_PANE claude",

  },
}
