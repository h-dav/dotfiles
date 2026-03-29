vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pf", "<cmd>FzfLua files<cr>")
vim.keymap.set("n", "<leader>pb", "<cmd>FzfLua buffers<cr>")
vim.keymap.set("n", "<leader>pg", "<cmd>FzfLua live_grep<cr>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)  -- Open to netrw
vim.keymap.set("n", "<leader>vp", vim.cmd.Vexplore) -- Open to netrw in a visual split tab

vim.keymap.set("n", "<leader>nt", vim.cmd.tabnew)   -- Open new tab

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Split navigation
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit) -- Vertical split
vim.keymap.set("n", "<leader>s", vim.cmd.split)   -- Horizontal split
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- Save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- Move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- LSP (buffer-local, only when an LSP is attached)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,           opts)
        vim.keymap.set("n", "gd",         function() vim.lsp.buf.definition();    vim.cmd("normal! zz") end, opts)
        vim.keymap.set("n", "gD",         function() vim.lsp.buf.declaration();   vim.cmd("normal! zz") end, opts)
        vim.keymap.set("n", "gi",         vim.lsp.buf.implementation,  opts)
        vim.keymap.set("n", "go",         function() vim.lsp.buf.type_definition(); vim.cmd("normal! zz") end, opts)
        vim.keymap.set("n", "gr",         vim.lsp.buf.references,      opts)
        vim.keymap.set("n", "gs",         vim.lsp.buf.signature_help,  opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,          opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,     opts)
        vim.keymap.set("n", "<leader>f",  vim.lsp.buf.format,          opts)
        vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float,   opts)
        vim.keymap.set("n", "<leader>tt", vim.diagnostic.setloclist,   opts)
        vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,    opts)
        vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,    opts)
    end,
})

-- Git hunks
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>")
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>")
vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>")
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>")
