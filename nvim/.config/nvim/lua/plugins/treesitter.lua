return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context"
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "gitcommit",
                "git_config",
                "git_rebase",
                "go",
                "gomod",
                "gowork",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "rust",
                "xml",
                "yaml",
            }
        })
    end
}
