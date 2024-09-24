vim.cmd("filetype plugin indent on")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Status bar
vim.opt.showmode = false

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

-- Statusline

vim.opt.laststatus = 2

local function git_branch()
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if string.len(branch) > 0 then
        return "[branch: " .. branch .. "]"
    else
        return "[not in git repo]"
    end
end

local function statusline()
    local file_name = " %f"
    local branch = git_branch()
    local modified = "%m"
    local align_right = "%="
    local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
    local fileformat = " [%{&fileformat}]"
    local filetype = " %y"
    local percentage = " %p%%"
    local linecol = " %l:%c"

    return string.format(
        "%s %s%s%s%s%s%s%s%s",
        file_name,
        branch,
        modified,
        align_right,
        filetype,
        fileencoding,
        fileformat,
        percentage,
        linecol
    )
end

vim.opt.statusline = statusline()
