return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("harpoon").setup({})

        local function toggle_telescope_with_harpoon(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
                .new({}, {
                    prompt_title = "Harpoon",
                    finder = require("telescope.finders").new_table({
                        results = file_paths,
                    }),
                    previewer = require("telescope.config").values.file_previewer({}),
                    sorter = require("telescope.config").values.generic_sorter({}),
                })
                :find()
        end
        vim.keymap.set("n", "<leader>a", function()
            local harpoon = require("harpoon")
            toggle_telescope_with_harpoon(harpoon:list())
        end, { desc = "Open verbose harpoon window" })
    end,
    keys = {
        {
            "<leader>A",
            function()
                require("harpoon"):list():add()
            end,
            desc = "harpoon a file",
        },
        {
            "<leader>D",
            function()
                require("harpoon"):list():remove()
            end,
            desc = "remove harpoon'd a file",
        },
        {
            "<leader>h",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "harpoon quick menu",
        },
    },
}
