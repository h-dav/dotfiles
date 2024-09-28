return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', telescope.find_files, {}) -- project file
        vim.keymap.set('n', '<leader>pg', telescope.live_grep, {}) -- project grep
        vim.keymap.set('n', '<leader>pr', telescope.registers, {})
        vim.keymap.set('n', '<leader>po', telescope.oldfiles, {}) -- recently opened files
    end

}
