return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "  查找文件", "<cmd>Telescope find_files<CR>"),
			dashboard.button("r", "  最近文件", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("g", "  全局搜索", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("n", "  新建文件", "<cmd>ene<CR>"),
			dashboard.button("c", "  编辑配置", "<cmd>edit ~/.config/nvim/init.lua<CR>"),
			dashboard.button("p", "  插件管理", "<cmd>Lazy<CR>"),
			dashboard.button("q", "  退出", "<cmd>qa<CR>"),
		}

		local function footer()
			local stats = require("lazy").stats()
			local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
			return " 已加载 "
				.. stats.loaded
				.. "/"
				.. stats.count
				.. " 个插件"
				.. "  ·  启动耗时 "
				.. ms
				.. "ms"
		end

		dashboard.section.footer.val = footer()

		-- 高亮配色
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- 如果 footer 想实时刷新（插件懒加载后数字会变），加个自动更新
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				dashboard.section.footer.val = footer()
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		alpha.setup(dashboard.opts)
	end,
}
