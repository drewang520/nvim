return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- 指定需要的语法解析器
			local ensure_installed = { "c", "cpp", "python", "lua", "vimdoc", "markdown" }
			require("nvim-treesitter").install(ensure_installed)

			--对指定文件类型自动启用高亮
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensure_installed,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
