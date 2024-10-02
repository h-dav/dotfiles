vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)     -- Open to netrw

vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit) -- Vertical split
vim.keymap.set("n", "<leader>s", vim.cmd.split)   -- Horizontal split
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.wq)

-- Move selection (found this spell from github.com/nickbryan/dotfiles)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
