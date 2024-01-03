local status_ok, indent_blankline = pcall(require, "ibl")

if not status_ok then
    return
end

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    _G.vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    _G.vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    _G.vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    _G.vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    _G.vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    _G.vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    _G.vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

indent_blankline.setup({ indent = { highlight = highlight } })
