local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-ö>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = _G.vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = { border = "Normal", background = "Normal" },
    },
})

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    local buf_set_keymap = _G.vim.api.nvim_buf_set_keymap

    buf_set_keymap(0, "t", "<esc>", [[<C-ö><C-n>]], opts)
    buf_set_keymap(0, "t", "<jk>", [[<C-ö><C-n>]], opts)
    buf_set_keymap(0, "t", "<C-h>", [[<C-ö><C-n><C-W>h]], opts)
    buf_set_keymap(0, "t", "<C-j>", [[<C-ö><C-n><C-W>j]], opts)
    buf_set_keymap(0, "t", "<C-k>", [[<C-ö><C-n><C-W>k]], opts)
    buf_set_keymap(0, "t", "<C-l>", [[<C-ö><C-n><C-W>l]], opts)
end

_G.vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local terminal_status_ok, terminal = pcall(require, "toggleterm.terminal")

if not terminal_status_ok then
    return
end

local Terminal = terminal.Terminal
local lazygit = Terminal:new({ cmd = "node", hidden = true })

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
    node:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
    python:toggle()
end
