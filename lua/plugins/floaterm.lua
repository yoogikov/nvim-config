return {
    'voldikss/vim-floaterm',
    config = function()
        vim.keymap.set('n', '<C-space>', ':FloatermNew lazygit<CR>', {})
        vim.keymap.set('t', '<C-space>', '<C-\\><C-n>:FloatermKill<CR>', {})
    end
}
