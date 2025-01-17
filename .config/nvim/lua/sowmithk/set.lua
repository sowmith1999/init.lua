vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr-o:hor20"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
--vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 20

vim.g.mapleader = " "


vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.haha",
    command = "set filetype=racket",
})
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.slog",
  command = "set filetype=clojure",
})
-- GPT:Create an autocmd for a specific file type
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", -- Replace 'markdown' with your desired filetype
    callback = function()
        -- Set your options here
        vim.opt_local.textwidth = 0       -- Set textwidth to 0
        vim.opt_local.wrapmargin = 1     -- Set wrapmargin to 1
        vim.opt_local.formatoptions:append("t") -- Add 't' to formatoptions
        vim.opt_local.formatoptions:remove("l") -- Remove 'l' from formatoptions
    end,
})
