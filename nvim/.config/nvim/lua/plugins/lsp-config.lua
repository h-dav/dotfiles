return {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v4.x",
        lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            {
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                dependencies = { "rafamadriz/friendly-snippets" },
                build = "make install_jsregexp",
                config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
            },
            "saadparwaiz1/cmp_luasnip",
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local types = require("cmp.types")
            local luasnip = require("luasnip")
            local cmp_format = require("lsp-zero").cmp_format({ details = true })

            local select_ops = { behavior = types.cmp.SelectBehavior.Select }

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "nvim_lsp_signature_help" },
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s" }),
                    ["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "s" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" }),
                    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4, { "i", "s" })),
                    ["<C-n>"] = cmp.mapping(function(_)
                        if cmp.visible() then
                            cmp.select_next_item(select_ops)
                        else
                            cmp.complete()
                        end
                    end, { "i", "s" }),
                    ["<C-p>"] = cmp.mapping(function(_)
                        if cmp.visible() then
                            cmp.select_prev_item(select_ops)
                        else
                            cmp.complete()
                        end
                    end, { "i", "s" }),
                    ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = false }), { "i", "s" }),
                }),
                preselect = cmp.PreselectMode.None,
                completion = { completeopt = "menu,menuone,noinsert,noselect,preview" },
                formatting = cmp_format,
                window = {
                },
            })
        end,
    },
    {
        "hrsh7th/cmp-cmdline",
        event = "CmdlineEnter",
        config = function()
            local cmp = require("cmp")
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } }
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline({}),
                sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = function(_, bufnr)
                    local opts = { buffer = bufnr }

                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
                    vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", opts)
                end,
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            })

            require("mason-lspconfig").setup({
                automatic_installation = false,
                ensure_installed = { "gopls", "lua_ls" },
                handlers = {
                    -- This first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                    gopls = function()
                        require("lspconfig").gopls.setup({
                            settings = {
                                gopls = {
                                    buildFlags = { "-tags=unit,integration" }
                                }
                            }
                        })
                    end,
                },
            })
            lsp_zero.format_on_save({
                servers = {
                    ["gopls"] = { "go", "gomod", "gowork", "gotmpl" },
                    ["lua_ls"] = { "lua" },
                }
            })
        end,
    },
}
