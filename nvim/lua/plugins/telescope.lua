return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',

    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- project file
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {}) -- project grep
    end

}
