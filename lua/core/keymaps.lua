local map = vim.keymap.set

-- 搜索清除
map("n", "<leader><esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- 编辑配置文件
map("n", "<leader>ve", "<cmd>edit ~/.config/nvim/init.lua<CR>", { desc = "edit init.lua" })
map("n", "<leader>vb", "<cmd>edit ~/.config/nvim/lua/core/options.lua<CR>", { desc = "edit option;lua" })
map("n", "<leader>vk", "<cmd>edit ~/.config/nvim/lua/core/keymaps.lua<CR>", { desc = "edit keymaps.lua" })

-- 帮助
map("n", "<leader>h?", function()
	vim.cmd("help " .. vim.fn.expand("<cword>"))
end)

-- 重新加载配置
map("n", "<leader>s", "<cmd>source ~/.config/nvim/init.lua<CR>")

-- 插件管理（lazy.nvim 自带命令，无需自定义，但保留也可以）
map("n", "<leader>pi", "<cmd>Lazy install<CR>")
map("n", "<leader>pu", "<cmd>Lazy update<CR>")
map("n", "<leader>pc", "<cmd>Lazy clean<CR>")

-- 系统剪贴板
map("v", "<leader><leader>y", '"+y')
map("n", "<leader><leader>p", '"+p')

-- Buffer 切换
map("n", "<C-l>", "<cmd>bnext<CR>")
map("n", "<C-h>", "<cmd>bprevious<CR>")
map("n", "<leader>d", "<cmd>bd<CR>")
map("n", "<leader>1", "<cmd>b1<CR>")
map("n", "<leader>2", "<cmd>b2<CR>")

-- 显示/隐藏行号
map("n", "<leader>snu", "<cmd>set nu<CR>", { silent = true })
map("n", "<leader>snn", "<cmd>set nonu<CR>", { silent = true })
