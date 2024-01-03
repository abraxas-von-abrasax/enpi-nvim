local status_ok, copilot = pcall(require, "copilot")

if not status_ok then
    return
end

copilot.setup({
    suggestion = {
        enabled = true,
        auto_trigger = true,
    },
    filetypes = {
        javascript = true,
        typescript = true,
    },
})
