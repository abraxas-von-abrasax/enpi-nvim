local status_ok, hop = pcall(require, "hop")

if not status_ok then
    return
end

hop.setup({ keys = "etovxqpdygfblzhckisuran", term_seq_bias = 0.5 })

-- Change the default f keyword
_G.vim.api.nvim_set_keymap("", "f", "<cmd>lua require('hop').hint_char1()<cr>", {})

-- Pattern matching with t keyword
_G.vim.api.nvim_set_keymap("n", "t", "<cmd>HopPattern<CR>", { noremap = true })
