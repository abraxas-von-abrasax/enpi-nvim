local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    [[     ______            _      __ _  ]],
    [[    / ____/___  ____  (_)   _/_/| | ]],
    [[   / __/ / __ \/ __ \/ /  _/_/  / / ]],
    [[  / /___/ / / / /_/ / /  < <   _>_> ]],
    [[ /_____/_/ /_/ .___/_/   / / _/_/   ]],
    [[            /_/          \_\/_/     ]],
}

dashboard.section.buttons.val = {
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
    dashboard.button("r", "󰾆  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
    dashboard.button("q", "󰅚  Quit Neovim", ":qa<CR>"),
}

local function footer()
    return "ALL YOUR BASE ARE BELONG TO US!!"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)

