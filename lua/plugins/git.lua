return {
	{
		"tpope/vim-fugitive",
		cmd = { "G", "Git", "Gvdiffsplit" },
		config = function()
			vim.g.NERDTreeGitStatusIndicatorMapCustom = {
				Modified = "✹",
				Staged = "✚",
				Untracked = "✭",
				Renamed = "➜",
				Unmerged = "═",
				Deleted = "✖",
				Dirty = "✗",
				Ignored = "☒",
				Clean = "✔︎",
				Unknown = "?",
			}
		end,
	},
}
