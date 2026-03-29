return {
    {
        url = "https://github.com/saghen/blink.cmp",
        version = "1.*",
        opts = {
            sources = { default = { "lsp", "snippets", "buffer", "path" } },
            snippets = { preset = "default" },
            completion = {
                menu = {
                    draw = {
                        columns = { { "label" }, { "kind" } },
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 100,
                },
            },
            signature = { enabled = true },
            keymap = { preset = "default" },
        },
    },
}
