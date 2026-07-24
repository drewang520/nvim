return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				-- cpp = { "clang-format" },
				python = { "black" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = false,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "格式化代码" })
	end,
}
