local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require'lspconfig'.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
})
