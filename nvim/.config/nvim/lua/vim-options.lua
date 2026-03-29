vim.cmd("filetype plugin indent on")

vim.opt.termguicolors = true

-- Netrw
vim.g.netrw_bufsettings  = "noma nomod nu rnu nobl nowrap ro" -- Absolute and relative line numbers
vim.g.netrw_banner    = 1  -- Show the banner
vim.g.netrw_liststyle = 1  -- Long view (filename, size, timestamp)

-- File search
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ "*/.git/*", "*/vendor/*" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- System clipboard
vim.opt.clipboard = "unnamedplus"

-- Persistent undo, no swapfile
vim.opt.undofile = true
vim.opt.swapfile = false

-- Status bar
vim.opt.showmode = false
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

-- Statusline
vim.opt.laststatus = 2

local modes = {
    n  = "NORMAL",   i  = "INSERT",  v  = "VISUAL",
    V  = "V-LINE",   R  = "REPLACE", c  = "COMMAND",
    t  = "TERMINAL", ["\22"] = "V-BLOCK",
}

_G.Statusline = function()
    local mode = "-- " .. (modes[vim.fn.mode()] or vim.fn.mode()) .. " --"
    local branch = vim.b.gitsigns_head and (" [branch: " .. vim.b.gitsigns_head .. "]") or ""
    return " " .. mode .. " %f" .. branch .. "%m%=%y %{&fileencoding?&fileencoding:&encoding} [%{&fileformat}] %p%% %l:%c"
end

vim.opt.statusline = "%!v:lua.Statusline()"

-- Color column
vim.opt.colorcolumn = "120"

-- Make git blame text visible against cursorline
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#a8a8a8", italic = true })
