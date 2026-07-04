return {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	keys = {
		{ "<C-\\>", desc = "打开/关闭终端" },
	},
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]], --使用Ctrl + \ 切换终端
			direction = "horizontal", --水平方向打开
			start_in_insert = true, --打开后进入插入模式
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			shade_terminals = true,
			shading_factor = -30,

			float_opts = {
				border = "rounded",
				width = 80,
				height = 20,
				winblend = 3,
				title_pos = "center",
			},

			-- 自定义高亮
			highlights = {
				NormalFloat = { guibg = "#282C34" },
				FloatBorder = { guifg = "#61AFEF", guibg = "NONE" },
			},
		})

		-- 快捷键映射
		-- 方向快捷键：Alt+h（水平）、Alt+v（垂直）、Alt+f（浮动）
		local Terminal = require("toggleterm.terminal").Terminal

		-- 创建三个不同方向的终端实例（但不设置固定命令，这样打开的是交互式 shell）
		local horizontal_term = Terminal:new({ direction = "horizontal" })
		local vertical_term = Terminal:new({
			direction = "vertical",
			height = 100,
		})
		local float_term = Terminal:new({ direction = "float" })

		-- 绑定快捷键（仅在普通模式和终端模式下生效）
		vim.keymap.set("n", "<leader>mh", function()
			horizontal_term:toggle()
		end, { desc = "Terminal horizontal" })
		vim.keymap.set("n", "<leader>mv", function()
			vertical_term:toggle()
		end, { desc = "Terminal vertical" })
		vim.keymap.set("n", "<leader>mf", function()
			float_term:toggle()
		end, { desc = "Terminal float" })
	end,
}
