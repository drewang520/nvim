local colors = require("plugins.lualine.colors")

local M = {}

function M.get_theme()
	return {
		normal = {
			a = { fg = colors.black, bg = '#528BFF'},
			b = { fg = colors.white, bg = colors.odark },
			c = { fg = colors.white, bg = colors.odark },
			x = { fg = colors.white, bg = colors.odark },
			y = { fg = colors.white, bg = colors.odark },
			z = { fg = colors.black, bg = '#528BFF'},
		},
		insert = {
			a = { fg = colors.black, bg = colors.green },
			b = { fg = colors.white, bg = colors.odark },
			c = { fg = colors.white, bg = colors.odark },
			x = { fg = colors.white, bg = colors.odark },
			y = { fg = colors.white, bg = colors.odark },
			z = { fg = colors.black, bg = colors.green, gui = "bold" },
		},
		visual = {
			a = { fg = colors.black, bg = colors.magenta },
			b = { fg = colors.white, bg = colors.odark },
			c = { fg = colors.white, bg = colors.odark },
			x = { fg = colors.white, bg = colors.odark },
			y = { fg = colors.white, bg = colors.odark },
			z = { fg = colors.black, bg = colors.magenta, gui = "bold" },
		},
		replace = {
			a = { fg = colors.black, bg = colors.red },
			b = { fg = colors.black, bg = colors.odark },
			c = { fg = colors.white, bg = colors.odark },
			x = { fg = colors.white, bg = colors.odark },
			y = { fg = colors.white, bg = colors.odark },
			z = { fg = colors.black, bg = colors.red, gui = "bold" },
		},
		command = {
			a = { fg = colors.black, bg = colors.gold },
			b = { fg = colors.white, bg = colors.odark },
			c = { fg = colors.white, bg = colors.odark },
			x = { fg = colors.white, bg = colors.odark },
			y = { fg = colors.white, bg = colors.odark },
			z = { fg = colors.black, bg = colors.gold, gui = "bold" },
		},
		inactive = {
			a = { fg = colors.odark, bg = colors.odark },
			b = { fg = colors.odark, bg = colors.odark },
			c = { fg = colors.odark, bg = colors.odark },
			x = { fg = colors.odark, bg = colors.odark },
			y = { fg = colors.odark, bg = colors.odark },
			z = { fg = colors.odark, bg = colors.odark },
		},
	}
end

return M
