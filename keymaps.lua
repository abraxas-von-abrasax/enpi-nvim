local opts = { noremap = true, silent = true }
local term_options = { silent = true }

-- shorten function name
local keymap = _G.vim.api.nvim_set_keymap

-- ----------- --
-- normal mode --
-- ----------- --

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- left window
keymap("n", "<C-k>", "<C-w>k", opts) -- up window
keymap("n", "<C-j>", "<C-w>j", opts) -- down window
keymap("n", "<C-l>", "<C-w>l", opts) -- right window

-- resize with arrows when using multiple windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize +2<cr>", opts)

-- navigate buffers
keymap("n", "<tab>", ":bnext<cr>", opts)          -- Next Tab
keymap("n", "<s-tab>", ":bprevious<cr>", opts)    -- Previous tab
keymap("n", "<leader>h", ":nohlsearch<cr>", opts) -- No highlight search

-- move text up and down
keymap("n", "<a-k>", "<esc>:m .-2<cr>==", opts) -- Alt-k
keymap("n", "<a-j>", "<esc>:m .+1<cr>==", opts) -- Alt-j

-- code navigation
keymap("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)      -- gd
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", opts) -- gt
keymap("n", "gi", "<cmd>Lspsaga finder<cr>", opts)               -- gi
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)             -- hover doc

-- ------ --
-- insert --
-- ------ --

-- press jk fast to exit insert mode
keymap("i", "jk", "<esc>", opts) -- Insert mode -> jk -> Normal mode
keymap("i", "kj", "<esc>", opts) -- Insert mode -> kj -> Normal mode

-- ------ --
-- visual --
-- ------ --

keymap("v", "<", "<gv", opts) -- Right Indentation
keymap("v", ">", ">gv", opts) -- Left Indentation

-- move text up and down
keymap("v", "<a-k>", ":m .-2<cr>==", opts)
keymap("v", "<a-j>", ":m .+1<cr>==", opts)

-- ------------ --
-- visual block --
-- ------------ --

-- terminal --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_options)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_options)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_options)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_options)
