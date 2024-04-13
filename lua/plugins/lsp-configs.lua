return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"golangci_lint_ls",
					"sqls",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.rust_analyzer.setup({
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					["rust-analyzer"] = {},
				},
			})
			lspconfig.golangci_lint_ls.setup({})
			lspconfig.sqls.setup({})
			lspconfig.tsserver.setup({})

			vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		end,
	},
}
