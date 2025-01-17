local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'T', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-t>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['tsserver'].setup {
--   capabilities = capabilities
-- }
function add_capabilities()
  for _, lsp in ipairs(servers) do
    require('lspconfig')[lsp].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    end
end

add_capabilities()

require'lspconfig'.eslint.setup{
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

-- require("vim.lsp.health").check()

-- require'lspconfig'.grammarly.setup{
--   init_options = {
--       https://hanspinckaers.com/use-grammarly-premium-with-grammarly-lsp-in-neovim/
--     clientId = "xxx"
--   },
-- }

-- require('lspconfig').yamlls.setup {
--   settings = {
--     yaml = {
--       -- schemas = {
--       --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
--       --   ["../path/relative/to/file.yml"] = "/.github/workflows/*",
--       --   ["/path/from/root/of/project"] = "/.github/workflows/*",
--       -- },
--     },
--   }
-- }

require'lspconfig'.yamlls.setup{}
