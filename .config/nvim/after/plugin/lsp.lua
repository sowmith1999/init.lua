local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' }
    }),
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.lsp.inlay_hint.enable()
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gn", ":cnext<CR>", opts)
    vim.keymap.set("n", "gp", ":cprev<CR>", opts)
    -- vim.keymap.set("n", "<leader>qo", ":copen<CR>", opts)
    -- vim.keymap.set("n", "<leader>qc", ":cclose<CR>", opts)
    -- if client.server_capabilities.inlayHintProvider then
    --     vim.g.inlay_hints_visible = true
    --     vim.lsp.inlay_hint(bufnr, true)
    -- else
    --     print("no inlay hints available")
    -- end
end)

function Toggle_inlay_hints()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

ColorMyPencils()
-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
    -- ensure_installed = { 'clangd' },
    handlers = {
        lsp.default_setup,
    },
})

require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.clangd.setup {
    cmd = { '/usr/bin/clangd', "--background-index" },
}

require 'lspconfig'.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false,
            }
        }
    }
}

require 'lspconfig'.cmake.setup {}

require 'lspconfig'.racket_langserver.setup {
    cmd = { "xvfb-run", "--auto-servernum", "racket", "--lib", "racket-langserver" },
    -- cmd = { "racket", "--lib", "racket-langserver" },
    -- cmd = { "racket", "-l", "racket-langserver" },
    -- racket -l racket-langserver
    -- Add any additional server-specific settings below
}
require 'lspconfig'.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391', 'W504' },
                    maxLineLength = 100
                },
                pyflakes = { enabled = false },
                pylint = { enabled = false },
            }
        }
    }
}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.asm_lsp.setup {}
require 'lspconfig'.markdown_oxide.setup {}
