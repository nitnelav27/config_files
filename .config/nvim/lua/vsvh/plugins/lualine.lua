-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- get lualine nightfly theme
local lualine_pc = require("lualine.themes.PaperColor")

-- new colors for theme
local new_colors = {
	blue = "#003a66",
	green = "#006633",
	violet = "#FF61EF",
	yellow = "#ffa102",
	black = "#000000",
}

-- change nightlfy theme colors
lualine_pc.normal.a.bg = new_colors.blue
lualine_pc.insert.a.bg = new_colors.green
lualine_pc.visual.a.bg = new_colors.violet
lualine_pc.command = {
	a = {
		gui = "bold",
		bg = new_colors.yellow,
		fg = new_colors.black, -- black
	},
}

-- configure lualine with modified theme
lualine.setup({
	options = {
		theme = lualine_pc,
	},
})
