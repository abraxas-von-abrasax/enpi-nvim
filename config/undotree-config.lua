local status_ok, undotree = pcall(require, "undotree")

if not status_ok then
    return
end

undotree.setup({
    float_diff = true, -- using float window previews diff, set this to `true` will disable the layout option
    layout = "left_bottom",
    ignore_filetype = {
        "Undotree",
        "UndotreeDiff",
        "qf",
        "TelescopePrompt",
        "spectre_panel",
        "tsplayground",
    },
    window = {
        winblend = 30,
    },
    keymaps = {
        j = "move_next",
        k = "move_prev",
        J = "move_change_next",
        K = "move_chnage_prev",
        ["<cr>"] = "action_enter",
        p = "enter_diffbuff",
        q = "quit",
    },
})
