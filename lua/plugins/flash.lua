return {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash 跳转",
		},
		{
			"<leader>S",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter 选择",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "远程操作（不移动光标执行命令）",
		},
		{
			"<C-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "命令行搜索时切换 Flash",
		},
	},
}
