local status_ok, lspsaga = pcall(require, "lspsaga")

if not status_ok then
    return
end

lspsaga.setup({
    outline = {
        win_width = 20,
        auto_close = true,
    },
})
