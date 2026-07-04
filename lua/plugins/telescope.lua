return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", desc = "搜索文件名" },
			{ "<leader>fg", desc = "全局内容搜索" },
			{ "<leader>fb", desc = "搜索buffer" },
			{ "<leader>fh", desc = "搜索帮助文档" },
			{ "<leader>fs", desc = "搜索符号" },
			{ "<leader>fd", desc = "搜索诊断" },
			{ "<leader>fo", desc = "搜索最近文件" },
			{ "<leader>fgs", desc = "查看git改动的文件" },
			{ "<leader>fgc", desc = "提交历史" },
			{ "<leader>fgb", desc = "查看分支" },
			{ "<leader>fk", desc = "搜索所有已注册的快捷键" },
			{ "<leader>fc", desc = "搜索所有可用命令" },
			{ "<leader>fr", desc = "恢复上一次搜索结果" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
					pickers = {
						find_files = {
							theme = "dropdown",
						},
					},
					preview = {
						treesitter = false,
					},
				},
			})

			-- 快捷键
			local map = vim.keymap.set
			map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
			map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
			map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
			map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
			map("n", "<leader>fs", "<cmd>Telescope lsp_workspace_symbols<CR>")
			map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>")
			map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
			map("n", "<leader>fgs", "<cmd>Telescope git_status<CR>")
			map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>")
			map("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>")
			map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>")
			map("n", "<leader>fc", "<cmd>Telescope commands<CR>")
			map("n", "<leader>fr", "<cmd>Telescope resume<CR>")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
