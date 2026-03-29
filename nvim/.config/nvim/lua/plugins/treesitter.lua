return {
    {
        url = "https://github.com/nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = { "go", "gomod", "gowork", "gosum", "rust", "lua", "luadoc" },
                auto_install = false,
            })

            -- Enable treesitter highlighting via native API
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "go", "gomod", "gowork", "gosum", "rust", "lua" },
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
    },
}
