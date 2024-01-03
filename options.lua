local options = {
    opt = {
        autowrite = true,     -- enable auto write
        clipboard = "unnamedplus", -- sync with the system clipboard
        completeopt = { "menu", "menuone", "noselect" },
        conceallevel = 3,     -- hide * markup for bold and italic
        confirm = true,       -- confirm to save changes before exiting modified buffer
        cursorline = true,    -- enable highlighting of the current line
        expandtab = true,     -- use spaces instead of tabs
        formatoptions = "jcroqlnt", -- tcqj
        grepformat = "%f:%l:%c:%m",
        grepprg = "rg --vimgrep",
        ignorecase = true,
        inccommand = "nosplit", -- preview incremental substitute
        incsearch = true,
        laststatus = 3,   -- global statusline
        list = true,      -- show some invisible characters (e.g. tabs)
        mouse = "a",
        number = true,
        pumblend = 10,  -- popup blend
        pumheight = 10, -- maximum number of entries in a popup
        relativenumber = false,
        scrolloff = 5,  -- lines of context
        sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
        shiftround = true, -- round indent
        shiftwidth = 4, -- size of indent
        showmode = false, -- don't show mode since we have a statusline
        sidescrolloff = 8, -- columns of context
        signcolumn = "yes", -- always show the signcolumn, otherwise it would shift the text each time
        smartcase = true, -- don't ignore cases with capitals
        smartindent = true, -- insert indents automatically
        spelllang = { "en", "de" },
        splitbelow = true, -- put new windows below current
        splitright = true, -- put new windows right of current
        tabstop = 4,    -- number of spaces a tab counts for
        termguicolors = true, -- true color support
        -- speed must be under 500ms in order for keys to work (should be increased if for some reason this can't be
        -- accomplished)
        timeoutlen = 500,
        undofile = true,
        undolevels = 10000,
        updatetime = 200,         -- save swap file and trigger CursorHold
        wildmode = "longest:full,full", -- command-line completion mode
        winminwidth = 5,          -- minimum window width
        wrap = false,             -- disable line wrap
        endoffile = true,
    },
    g = {
        mapleader = " ",                           -- set leader key
        maplocalleader = ",",                      -- set local leader key
        max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files
        -- enable of disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        autoformat_enabled = false,
        autopairs_enabled = true, -- enable autopairs at start
        cmp_enabled = true, -- enable completion at start
        codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that supports it
        -- set the visibility of diagnostics in the UI (0 = off, 1 = only show in status line, 2 = vritual text off,
        -- 3 = all on)
        diagnostics_mode = 3,
        highlighturl_enabled = true, -- highlight URLs by default
        icons_enabled = true,      -- enable icons in the UI (should be disabled, if no nerd font is available)
        inlay_hints_enabled = false, -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
        lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signature help)
        semantic_tokens_enabled = true, -- enable or disable LSP semantic tokens on startup
        ui_notifications_enabled = true, -- enable or disable notifications
        git_worktrees = nil,
    },
    -- initialize buffers for the current tab
    t = _G.vim.bufs and _G.vim.t.bufs or { bufs = _G.vim.api.nvim_list_bufs() },
}

for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        _G.vim[scope][setting] = value
    end
end
