return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
		notify = {
			enabled = true,
		},
	},
	config = function()
		require("noice").setup({
			presets = {
				long_message_to_split = true,
			},
		})

		require("notify").setup({
			background_colour = "#282C34", -- 解决报错
			timeout = 1000, -- 2秒后自动消失，不再停留太久
			max_height = function()
				return math.floor(vim.o.lines * 0.5)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.4)
			end,
			render = "compact",
			stages = "fade",
			-- level = vim.log.levels.WARN, -- 只显示警告和报错，普通信息类通知不弹（可选，看你是否需要
		})
	end,
}
