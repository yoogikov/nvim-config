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

--local term_buf = nil
--local term_win = nil
local is_created = false
--local is_open = false

function TermToggle(height)
    if is_created==true then
        vim.cmd("FloatermToggle")
    else
        vim.cmd("FloatermNew")
        is_created=true
   --[[     if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
            vim.cmd("buffer " .. term_buf)
            vim.cmd("bd " .. new_buf)
        else
            vim.cmd("terminal")
            term_buf = vim.api.nvim_get_current_buf()
            vim.wo.number = false
            vim.wo.relativenumber = false
            vim.wo.signcolumn = "no"
        end
--]]
    end
end

vim.keymap.set("n", "<C-space>", ":lua TermToggle(20)<CR>", { silent = true})
vim.keymap.set("i", "<C-space>", "<Esc>:lua TermToggle(20)<CR>", { silent=true})
vim.keymap.set("t", "<C-space>", "<C-\\><C-n>:lua TermToggle(20)<CR>", { silent=true})

