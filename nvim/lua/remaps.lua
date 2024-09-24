vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Navigate to netrw
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit) -- Vertical split
vim.keymap.set("n", "<leader>s", vim.cmd.split) -- Horizontal split
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.wq)

-- formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim-go remaps
vim.keymap.set("n", "<leader>gc", vim.cmd.GoCallers)
vim.keymap.set("n", "<leader>gr", vim.cmd.GoReferrers)
vim.keymap.set("n", "<leader>gR", vim.cmd.GoRename)
vim.keymap.set("n", "<leader>gl", vim.cmd.GoLint)
vim.keymap.set("n", "<leader>gf", vim.cmd.GoFmt)
vim.keymap.set("n", "<leader>gfs", vim.cmd.GoFillStruct)
vim.keymap.set("n", "<leader>gi", vim.cmd.GoInfo)
vim.keymap.set("n", "<leader>gk", vim.cmd.GoImplements)

-- aerial
vim.keymap.set("n", "<leader>ao", vim.cmd.AerialOpen)
vim.keymap.set("n", "}", vim.cmd.AerialNext)
vim.keymap.set("n", "{", vim.cmd.AerialPrev)
