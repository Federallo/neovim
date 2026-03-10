local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client,bufnr)
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
		'hls',--haskell
		'java_language_server',
		'quick_lint_js',
		'ltex',
		'lua_ls',
		'jedi_language_server',--python

	},
	handlers = {
		lsp_zero.default_setup,
		--myserver = function()
		--	require('lspconfig').myserver.setup({
		--	})
		--end,
	},
})

vim.diagnostic.config({
  virtual_text = true, -- Mostra l'errore a fine riga (molto utile)
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
