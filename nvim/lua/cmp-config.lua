local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-s>'] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' },
    { name = 'async_path' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'npm', keyword_length = 4 },
    { name = 'path', option = { trailing_slash = true }},
    { name = 'nvim_lsp_signature_help' },
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
    })
  }
})
