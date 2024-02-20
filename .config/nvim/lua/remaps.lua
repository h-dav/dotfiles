vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Navigate to netrw

-- save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim-go remaps
vim.keymap.set("n", "<leader>gl", vim.cmd.GoLint)
vim.keymap.set("n", "<leader>gf", vim.cmd.GoFmt)
vim.keymap.set("n", "<leader>gfs", vim.cmd.GoFillStruct)

-- nvim-tree
vim.keymap.set("n", "<leader>nt", vim.cmd.NvimTreeOpen)
