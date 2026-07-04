return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
			delay = 300,
			icons = {
				breadcrumb = "»",
				separator = "➜",
				group = "+",
			},
			win = {
				border = "rounded",
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "缓冲区快捷键提示",
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			-- ============================================================
			-- 分组注册：给 <leader> 开头的键位加上中文分类说明
			-- 按下 <leader> 后停顿即可看到分组菜单
			-- ============================================================
			wk.add({
				-- 顶层分组
				{ "<leader>f", group = "󰍉 查找 (Telescope)" },
				{ "<leader>v", group = "󰈔 配置文件" },
				{ "<leader>p", group = "󰏗 插件管理 (Lazy)" },
				{ "<leader>h", group = "󰊢 Git Hunk" },
				{ "<leader>x", group = "󰄾 诊断/Trouble" },
				{ "<leader>c", group = "󰘦 LSP/代码" },
				{ "<leader>b", group = "󰓩 Buffer/标签页" },
				{ "<leader>d", group = "󰃤 诊断信息" },
				{ "<leader>s", group = "󰑖 重载/搜索" },
				{ "<leader>t", group = "󰙅 大纲/终端" },

				-- ---------------- 查找 f ----------------
				{ "<leader>ff", desc = "搜索文件名" },
				{ "<leader>fg", desc = "全局内容搜索 (grep)" },
				{ "<leader>fb", desc = "搜索已打开 buffer" },
				{ "<leader>fh", desc = "搜索帮助文档" },
				{ "<leader>fs", desc = "搜索工作区符号" },
				{ "<leader>fd", desc = "搜索诊断信息" },
				{ "<leader>fo", desc = "最近打开的文件" },
				{ "<leader>fk", desc = "搜索所有快捷键" },

				-- ---------------- 配置文件 v ----------------
				{ "<leader>ve", desc = "编辑 init.lua" },
				{ "<leader>vb", desc = "编辑 options.lua" },
				{ "<leader>vk", desc = "编辑 keymaps.lua" },

				-- ---------------- 插件管理 p ----------------
				{ "<leader>pi", desc = "Lazy 安装插件" },
				{ "<leader>pu", desc = "Lazy 更新插件" },
				{ "<leader>pc", desc = "Lazy 清理插件" },

				-- ---------------- Git Hunk h ----------------
				{ "<leader>hs", desc = "暂存当前改动块" },
				{ "<leader>hr", desc = "撤销当前改动块" },
				{ "<leader>hp", desc = "预览当前改动块" },
				{ "<leader>hb", desc = "查看当前行 blame" },
				{ "<leader>hd", desc = "对比与上次提交差异" },

				-- ---------------- 诊断/Trouble x ----------------
				{ "<leader>xx", desc = "打开/关闭诊断列表" },
				{ "<leader>xX", desc = "打开/关闭当前 buffer 诊断" },
				{ "<leader>xL", desc = "Location List" },
				{ "<leader>xQ", desc = "Quickfix List" },

				-- ---------------- LSP/代码 c ----------------
				{ "<leader>ca", desc = "代码操作 (Code Action)" },
				{ "<leader>cl", desc = "LSP 定义/引用列表" },
				{ "<leader>cs", desc = "符号列表" },

				-- ---------------- Buffer b ----------------
				{ "<leader>bp", desc = "快速选择跳转 buffer" },
				{ "<leader>bc", desc = "快速选择关闭 buffer" },
				{ "<leader>bo", desc = "关闭其他所有 buffer" },

				-- ---------------- 诊断信息 d ----------------
				{ "<leader>ds", desc = "悬浮显示当前行诊断" },
				{ "<leader>dl", desc = "诊断信息丢进 location list" },
				{ "<leader>d", desc = "关闭当前 buffer" }, -- 注意：与你 keymaps.lua 中原有映射一致

				-- ---------------- 重载/其他 s ----------------
				{ "<leader>s", desc = "重新加载 init.lua" },

				-- ---------------- 大纲/终端 t ----------------
				{ "<leader>t", desc = "打开/关闭代码大纲 (Aerial)" },
				{ "<leader>tb", desc = "开关行尾常驻 Git Blame" },

				-- ---------------- 顶层无分组的单键 ----------------
				{ "<leader>e", desc = "聚焦文件树" },
				{ "<leader>rn", desc = "LSP 重命名" },
				{ "<leader>h?", desc = "查看光标词帮助文档" }, -- 注意：与上面 Git Hunk 分组键冲突，见下方说明
				{ "<leader>snu", desc = "显示行号" },
				{ "<leader>snn", desc = "隐藏行号" },
				{ "<leader><esc>", desc = "清除搜索高亮" },
			})
		end,
	},
}
