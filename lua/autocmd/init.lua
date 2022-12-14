-- Swap numbers
local numbertoggle = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
    callback = function()
        vim.cmd([[ if &nu && mode() != "i" | set rnu   | endif ]])
    end,
    group = numbertoggle,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
    callback = function()
        vim.cmd([[ if &nu                  | set nornu | endif ]])
    end,
    group = numbertoggle,
})

vim.api.nvim_create_autocmd({ "BufWrite" }, {
    callback = function()
        vim.cmd([[ !black  *.py]])
    end,
})
