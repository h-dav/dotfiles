vim.g.mapleader = " "

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
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.wq)

-- Move selection (found this spell from github.com/nickbryan/dotfiles)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
