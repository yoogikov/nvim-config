vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.cmd([[
    set foldtext=MyFoldText()
    function MyFoldText()
      let line = getline(v:foldstart)
      let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
      return v:folddashes .. sub
    endfunction
            ]])

local term_buf = nil
local term_win = nil

function TermToggle(height)
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.cmd("hide")
    else
        vim.cmd("botright new")
        local new_buf = vim.api.nvim_get_current_buf()
        vim.cmd("resize " .. height)
        if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.cmd("buffer " .. term_buf)
            vim.cmd("bd " .. new_buf)
        else
            vim.cmd("terminal")
            term_buf = vim.api.nvim_get_current_buf()
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.wo.signcolumn = "no"
        end
    vim.cmd("startinsert!")
    term_win = vim.api.nvim_get_current_win()
    end
end

vim.keymap.set("n", "<C-]>", ":lua TermToggle(20)<CR>", { silent = true})
vim.keymap.set("i", "<C-]>", "<Esc>:lua TermToggle(20)<CR>", { silent=true})
vim.keymap.set("t", "<C-]>", "<C-\\><C-n>:lua TermToggle(20)<CR>", { silent=true})


