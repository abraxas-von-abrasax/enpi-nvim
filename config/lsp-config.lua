local status_ok, lsp_zero = pcall(require, "lsp-zero")

if not status_ok then
    return
end

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local mason_status_ok, mason = pcall(require, "mason")
local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_status_ok or not mason_lspconfig_ok then
    return
end

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
})

lsp_zero.set_sign_icons({
    error = "✘",
    warn = "▲",
    hint = "⚑",
    info = "",
})

_G.vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

local cmp_status_ok, cmp = pcall(require, "cmp")

if not cmp_status_ok then
    return
end

local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()

local luasnip_loader_ok, luasnip_loader = pcall(require, "luasnip.loaders.from_vscode")

if not luasnip_loader_ok then
    return
end

local copilot_suggestion_status, copilot_suggestion = pcall(require, "copilot.suggestion")


if not copilot_suggestion_status then
    return
end

luasnip_loader.lazy_load()

_G.vim.opt.completeopt = { "menu", "menuone", "noselect" }

local get_toggle_completion_key = function()
    if _G.vim.fn.has("mac") == 1 then
        -- Use ctrl+k on mac
        return "<c-k>"
    else
        -- Use ctrl+space on linux or windows
        return "<c-space>"
    end
end

cmp.setup({
    formatting = cmp_format,
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
    },
    mapping = cmp.mapping.preset.insert({
        -- autocomplete copilot suggestion with tab
        ["<tab>"] = cmp.mapping(function(fallback)
            if copilot_suggestion.is_visible() then
                copilot_suggestion.accept()
            else
                fallback()
            end
        end, { "i", "s" }),

        -- select the current item with enter
        ["<c-l>"] = cmp.mapping.confirm({ select = true }),

        -- ctrl+space to trigger completion menu
        [get_toggle_completion_key()] = cmp_action.toggle_completion(),

        -- tab complete
        ["<s-tab>"] = cmp.mapping.select_prev_item(),

        -- navigate between snippet placeholder
        ["<c-f>"] = cmp_action.luasnip_jump_forward(),
        ["<c-b>"] = cmp_action.luasnip_jump_backward(),

        -- scroll up and down in the completion documentation
        ["<c-u>"] = cmp.mapping.scroll_docs(-4),
        ["<c-d>"] = cmp.mapping.scroll_docs(4),
    }),
})

local null_ls_ok, null_ls = pcall(require, "null-ls")
local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")

if not null_ls_ok or not mason_null_ls_ok then
    return
end

null_ls.setup({})
mason_null_ls.setup({
    handlers = {
        stylua = function(_, _)
            null_ls.register(null_ls.builtins.formatting.stylua)
        end,
    },
})
