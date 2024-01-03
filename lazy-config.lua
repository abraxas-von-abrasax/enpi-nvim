local lazypath = _G.vim.fn.stdpath("data") .. "lazy/lazy.nvim"

if not _G.vim.loop.fs_stat(lazypath) then
    _G.vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

_G.vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
