local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end)

require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls', 
        'rust_analyzer', 
        'docker_compose_language_service',
        'dockerls',
        'html',
        'hls',
        'jdtls',
        'lua_ls',
        'jedi_language_server',
        'ltex', -- Rimesso se vuoi usarlo
    },
    handlers = {
        -- Il setup di default di lsp-zero per tutti i server
        lsp_zero.default_setup,

        -- 🔥 Configurazione speciale per forzare il controllo degli errori in JS/JSX
        ts_ls = function()
            require('lspconfig').ts_ls.setup({
                settings = {
                    javascript = {
                        implicitProjectConfig = {
                            checkJs = true, -- <--- QUESTO FORZA IL CONTROLLO ERRORI NEI FILE JS/JSX!
                            jsx = "react"
                        },
                    },
                },
            })
        end,

        -- 🔥 Configurazione corretta per ltex (spostata qui dentro!)
        ltex = function()
            require('lspconfig').ltex.setup({
                filetypes = { "markdown", "tex", "bib" },
                settings = {
                    ltex = {
                        enabled = { "markdown", "tex", "bib" },
                    },
                },
            })
        end,
    },
})

vim.diagnostic.config({
  virtual_text = true, 
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.opt.updatetime = 300
