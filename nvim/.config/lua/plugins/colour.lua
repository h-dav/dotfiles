return {
    --"rose-pine/neovim",
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd("colorscheme github_dark")
        --vim.cmd("colorscheme rose-pine-moon")
    end
}
