return {
    {
        url = "https://github.com/saghen/blink.cmp",
        version = "1.*",
        dependencies = {
            {
                url = "https://github.com/L3MON4D3/LuaSnip",
                version = "v2.*",
                dependencies = { url = "https://github.com/rafamadriz/friendly-snippets" },
                build = "make install_jsregexp",
                config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
            },
        },
        opts = {
            signature = { enabled = true },
            snippets = { preset = "luasnip" },
            sources = { default = { "lsp", "path", "snippets", "buffer" } },
            completion = {
                documentation = { auto_show = true },
                ghost_text = { enabled = false },
                menu = {
                    draw = {
                        columns = { { "label", "label_description", gap = 0 }, { "kind" } },
                    }
                }
            },
            keymap = { preset = 'default' },
        },
    },
    {
        url = "https://github.com/williamboman/mason-lspconfig.nvim",
        dependencies = {
            { url = "https://github.com/williamboman/mason.nvim", opts = {} },
            { url = "https://github.com/neovim/nvim-lspconfig" },
            { url = "https://github.com/saghen/blink.cmp" },
        },
        config = function()
            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        buildFlags = { "-tags=unit,integration" },
                        -- filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
                        gofumpt = true,
                    },
                },
            })

            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = { "gopls", "lua_ls", "rust_analyzer" },
            })

            require("fzf-lua").register_ui_select();
        end,
    },
    -- {
    --     url = "https://github.com/mfussenegger/nvim-lint",
    --     dependencies = {
    --         { url = "https://github.com/williamboman/mason.nvim" },
    --         { url = "https://github.com/rshkarin/mason-nvim-lint" },
    --     },
    --     events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    --     config = function()
    --         local lint = require("lint")
    --         lint.linters.golangcilint.args = vim.list_extend(
    --             lint.linters.golangcilint.args,
    --             { "--build-tags=unit,integration" }
    --         )
    --         lint.linters_by_ft = {
    --             go = { "golangcilint" },
    --         }
    --         vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
    --             group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
    --             callback = function()
    --                 lint.try_lint()
    --             end,
    --         })
    --         require("mason-nvim-lint").setup({
    --             ensure_installed = { "golangcilint" },
    --             automatic_installation = false,
    --         })
    --     end,
    -- },
}
