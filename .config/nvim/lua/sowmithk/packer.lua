--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine-moon')
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run, ':TSUpdate' })
    use('theprimeagen/harpoon')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- use("github/copilot.vim")
    use("HiPhish/rainbow-delimiters.nvim")
    use("edluffy/hologram.nvim")
    use({
        "stevearc/oil.nvim",
        requires = {
            {"nvim-tree/nvim-web-devicons"}
        },
        config = function()
            require("oil").setup{
                columns = {"icon"},
                view_options = {
                    show_hidden = true,
                },
            }

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory"})

            vim.keymap.set("n","<space>-", require("oil").toggle_float) 
        end
    })
    -- Inside a Lua module or directly in your packer startup function
    -- use("sudormrfbin/cheatsheet.nvim")
    -- use {
    --   "nvim-neorg/neorg",
    --   rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
    --   tag = "v9.1.1", -- Pin Neorg to the latest stable release
    --   config = function()
    --       require("neorg").setup()
    --   end,
    -- }
end)
