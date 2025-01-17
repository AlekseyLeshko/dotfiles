vim.keymap.set("n", "<C-j>", "<cmd>:m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<C-k>", "<cmd>:m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move lines down" })
vim.keymap.set("x", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move lines up" })

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local signs = { Error = "✘", Warn = "", Hint = "•", Info = "" }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '●', '▎', 'x'
    }
})
vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local clients = vim.lsp.get_active_clients()
		if #clients > 0 then
		    vim.diagnostic.open_float()
		end
		-- if vim.lsp.buf.server_ready() then
		-- 	vim.diagnostic.open_float()
		-- end
	end,
})
