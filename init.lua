-- setting mapleader
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- load core
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.neovide")

-- load plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	import = "plugins",
	change_detection = {
		enabled = true,
		notify = true,
	},
})

require("core.highlights")
