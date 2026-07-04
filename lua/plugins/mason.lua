return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "pyright", "lua_ls" },
				-- 0.12 用原生 vim.lsp.config，所以关掉 mason-lspconfig 的自动 setup
				automatic_installation = true,
			})
		end,
	},
}
