return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({
			check_ts = true, -- 配合 treesitter，更智能地判断是否需要补全括号
			disable_filetype = { "TelescopePrompt", "vim" },
		})

		-- 让补全确认时（比如输完函数名按回车）自动加上配对括号
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
