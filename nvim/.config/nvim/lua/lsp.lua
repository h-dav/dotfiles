-- Native LSP configuration (requires Neovim 0.11+)
-- LSP servers must be installed manually:
--   go install golang.org/x/tools/gopls@latest
--   rustup component add rust-analyzer
--   brew install lua-language-server
--   cargo install harper-ls

-- gopls (Go)
vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
        gopls = {
            buildFlags = { "-tags=unit,integration" },
            gofumpt = true,
        },
    },
})

-- rust-analyzer (Rust)
vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock", ".git" },
    settings = {
        ["rust-analyzer"] = {
            cargo = { buildScripts = { enable = true } },
            procMacro = { enable = true },
        },
    },
})

-- lua-language-server (Lua)
vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- harper-ls (grammar and spell checking)
vim.lsp.config("harper_ls", {
    cmd = { "harper-ls", "--stdio" },
    filetypes = { "markdown", "text", "gitcommit" },
    root_markers = { ".git" },
    settings = {
        ["harper-ls"] = {
            dialect = "British",
        },
    },
})

vim.lsp.enable({ "gopls", "rust_analyzer", "lua_ls", "harper_ls" })

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.go", "*.rs", "*.lua" },
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})
