-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>")
map("n", "<Leader>fm", ":Telescope media_files<CR>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")

map("n", "<Leader>gD", ":lua vim.lsp.buf.declaration()<CR>")
map("n", "<Leader>gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>K", ":lua vim.lsp.buf.hover()<CR>")
map("n", "<Leader>gi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader><C-k>", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Leader><space>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<Leader><space>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<Leader><space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<Leader><space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<Leader><space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader><space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<Leader><space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

-- Nvim Tree
map("n", "<Leader>tt", ":NvimTreeToggle<CR>")

