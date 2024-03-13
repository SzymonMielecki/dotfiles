-- Pull in the wezterm API
local wezterm = require("wezterm")
local k = require("utils/keys")

local warm = {
	black = "#191a1c",
	bg0 = "#2c2d30",
	bg1 = "#35373b",
	bg2 = "#3e4045",
	bg3 = "#404247",
	bg_d = "#242628",
	bg_blue = "#79b7eb",
	bg_yellow = "#e6cfa1",
	fg = "#b1b4b9",
	purple = "#c27fd7",
	green = "#99bc80",
	orange = "#c99a6e",
	blue = "#68aee8",
	yellow = "#dfbe81",
	cyan = "#5fafb9",
	red = "#e16d77",
	grey = "#646568",
	light_grey = "#8b8d91",
	dark_cyan = "#316a71",
	dark_red = "#914141",
	dark_yellow = "#8c6724",
	dark_purple = "#854897",
	diff_add = "#32352f",
	diff_delete = "#342f2f",
	diff_change = "#203444",
	diff_text = "#32526c",
}

-- This table will hold the configuration.
local config = {
	keys = {
		k.ctrl_to_tmux_prefix("Tab", "n"),
		k.ctrl_shift_to_tmux_prefix("Tab", "p"),
		k.cmd_key("[", wezterm.action.SendKey({ mods = "CTRL", key = "o" })),
		k.cmd_key("]", wezterm.action.SendKey({ mods = "CTRL", key = "i" })),
		k.ctrl_key(";", wezterm.action.SendKey({ mods = "ALT", key = ";" })),
		k.cmd_to_tmux_prefix(";", ":"),
		k.cmd_to_tmux_prefix("-", "-"),
		k.cmd_to_tmux_prefix("\\", "|"),
		k.cmd_to_tmux_prefix("|", "|"),
		k.cmd_to_tmux_prefix("1", "1"),
		k.cmd_to_tmux_prefix("2", "2"),
		k.cmd_to_tmux_prefix("3", "3"),
		k.cmd_to_tmux_prefix("4", "4"),
		k.cmd_to_tmux_prefix("5", "5"),
		k.cmd_to_tmux_prefix("6", "6"),
		k.cmd_to_tmux_prefix("7", "7"),
		k.cmd_to_tmux_prefix("8", "8"),
		k.cmd_to_tmux_prefix("9", "9"),
		k.cmd_to_tmux_prefix("`", "n"),
		k.cmd_to_tmux_prefix("b", "B"),
		k.cmd_to_tmux_prefix("C", "C"),
		k.cmd_to_tmux_prefix("d", "D"),
		k.cmd_to_tmux_prefix("G", "G"),
		k.cmd_to_tmux_prefix("g", "g"),
		k.cmd_to_tmux_prefix("K", "T"),
		k.cmd_to_tmux_prefix("h", "h"),
		k.cmd_to_tmux_prefix("j", "j"),
		k.cmd_to_tmux_prefix("k", "k"),
		k.cmd_to_tmux_prefix("l", "l"),
		k.cmd_to_tmux_prefix("n", "n"),
		k.cmd_to_tmux_prefix("p", "p"),
		k.cmd_to_tmux_prefix("o", "u"),
		k.cmd_to_tmux_prefix("T", "!"),
		k.cmd_to_tmux_prefix("t", "c"),
		k.cmd_to_tmux_prefix("w", "q"),
		k.cmd_to_tmux_prefix("z", "z"),
		k.cmd_to_tmux_prefix("Z", "Z"),
	},
	color_scheme = "OneDark",
	color_schemes = {
		["TokyoGogh"] = {
			brights = {
				"#414868",
				"#e87088",
				"#9ece6a",
				"#dec76e",
				"#7aa2f7",
				"#bb9af7",
				"#7dcfff",
				"#d4daf2",
			},
			ansi = {
				"#414868",
				"#e87088",
				"#9ece6a",
				"#dec76e",
				"#7aa2f7",
				"#bb9af7",
				"#7dcfff",
				"#d4daf2",
			},
			background = "#1d1b26",
			foreground = "#c0caf5",
			selection_bg = "#3b4261",
			selection_fg = "#0c0e15",
			cursor_bg = "#c0caf5",
			cursor_fg = "#24283b",
		},
		["OneDark"] = {
			foreground = "#a7aab0",
			background = "#232326",

			cursor_bg = "#2b5d63",
			cursor_fg = "#a7aab0",
			cursor_border = "#2b5d63",

			selection_fg = "#a7aab0",
			selection_bg = "#e2c792",

			scrollbar_thumb = "#282b26",

			split = "#35363b",

			ansi = {
				"#101012",
				"#833b3b",
				"#8fb573",
				"#c49060",
				"#57a5e5",
				"#79428a",
				"#51a8b3",
				"#a7aab0",
			},

			brights = {
				"#5a5b5e",
				"#de5d68",
				"#8fb573",
				"#dbb671",
				"#57a5e5",
				"#c49060",
				"#51a8b3",
				"#818387",
			},
		},
	},
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	font = wezterm.font_with_fallback({
		{
			family = "JetBrainsMono Nerd Font",
			weight = "Medium",
			stretch = "Expanded",
		},
		{
			family = "JetBrainsMono Nerd Font",
			weight = "Regular",
		},
		{
			family = "JetBrains Mono",
			weight = "Regular",
		},
	}),
	font_size = 15.0,
	line_height = 0.9,
	default_cursor_style = "SteadyBar",
	window_padding = {
		left = 0,
		right = 0,
		top = 5,
		bottom = 5,
	},
	window_close_confirmation = "NeverPrompt",
}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages

-- This is where you actually apply your config choices

-- For example, changing the color scheme:

-- and finally, return the configuration to wezterm
return config
