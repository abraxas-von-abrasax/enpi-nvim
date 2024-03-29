local status_ok, which_key = pcall(require, "which-key")

if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true,        -- shows a list of your marks on ' and `
        registers = true,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20 -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            -- adds help for operators like d, y, ... and registers them for motion / text object completion
            operators = false,
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true             -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>"    -- binding to scroll up inside the popup
    },
    window = {
        border = "rounded",       -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3,                    -- spacing between columns
        align = "left"                  -- align columns left, center or right
    },
    -- enable this to hide mappings for which you didn't specify a label
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    -- show help message on the command line when the popup is visible
    show_help = true,
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" }
    }
}

local opts = {
    mode = "n",     -- NORMAL mode
    prefix = "<leader>",
    buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true   -- use `nowait` when creating keymaps
}

local mappings = {
    b = {
        name = "Buffer Tabs",
        c = { "<cmd>BufferClose<cr>", "Close Buffer" },
        m = {
            name = "Move",
            n = { "<cmd>BufferMoveNext<cr>", "Move Right" },
            p = { "<cmd>BufferMovePrevious<cr>", "Move Left" },
        },
        n = { "<cmd>BufferNext<cr>", "Next Buffer" },
        p = { "<cmd>BufferPrevious<cr>", "Previous Buffer" },
        r = { "<cmd>BufferRestore<cr>", "Close Buffer!" },
    },
    k = { "<cmd>bdelete<cr>", "Kill Buffer" }, -- Close current file
    w = { "<cmd>w!<cr>", "Save" },             -- Save current file
    q = { "<cmd>wqall!<cr>", "Quit" },         -- Quit Neovim after saving the file
    e = { "<cmd>Neotree toggle<cr>", "Explorer" },
    c = {
        name = "Code",
        n = { "<cmd>Lspsaga rename<cr>", "Rename" },
        o = { "<cmd>Lspsaga outline<cr>", "Code Outline" }
    },
    -- Telescope
    f = {
        name = "File Search",
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = {
            "<cmd>lua require('telescope.builtin').find_files()<cr>",
            "Find files"
        },
        t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern In All Files" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }
    },
    g = {
        name = "Git",
        g = { "<cmd>LazyGit<cr>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Diff",
        },
    },
    i = {
        name = "IDE Settings",
        p = { "<cmd>Lazy<cr>", "Plugin Manager" }, -- Invoking plugin manager
        m = { "<cmd>Mason<cr>", "Mason" },
    },
    l = {
        name = "LSP",
        a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        d = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Show diagnostic" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>TroubleToggle<cr>", "Trouble" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        },
    },
    p = {
        name = "Project Management",
        p = { "<cmd>Telescope projects<cr>", "Projects" },
        s = { "<cmd>PomodoroStart<cr>", "Start pomodoro timer" },
        e = { "<cmd>PomodoroStop<cr>", "End pomodoro timer" },
        i = { "<cmd>PomodoroStatus<cr>", "Pomodoro timer Info" }
    },
    r = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format Code" },
    s = {
        name = "Search",
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        c = { "<cmd>Telescope commands<cr>", "Commands" }
    },
    t = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },                            -- Node Terminal
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },                        -- Node Terminal
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },                   -- Node Terminal
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Node Terminal
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- Node Terminal
    },
    u = { "<cmd>lua require('undotree').toggle()<cr>", "Undo-Tree" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
