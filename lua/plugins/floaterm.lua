return {
    'voldikss/vim-floaterm',
    config = function()
        vim.keymap.set('n', '<leader>lg', ':FloatermNew lazygit<CR>', {})
    end
}
