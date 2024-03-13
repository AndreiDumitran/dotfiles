local wezterm = require("wezterm")

local color = (function()
	local COLOR = require("colors")

	local coolors = {
		-- COLOR.VERIDIAN,
		-- COLOR.PAYNE,
		-- COLOR.INDIGO,
		-- COLOR.CAROLINA,
		-- COLOR.FLAME,
		-- COLOR.JET,
		COLOR.BLACK,
		-- COLOR.TAUPE,
		-- COLOR.ECRU,
		-- COLOR.VIOLET,
		-- COLOR.VERDIGRIS
	}

	return coolors[math.random(#coolors)]
end)()

local color_primary = color

local title_color_bg = color_primary.bg
local title_color_fg = color_primary.fg

local color_off = title_color_bg:lighten(0.4)
local color_on = color_off:lighten(0.4)
wezterm.on("update-right-status", function(window)
	local bat = ""
	local b = wezterm.battery_info()[1]
	bat = wezterm.format({
		{ Foreground = {
			Color = b.state_of_charge > 0.2 and color_on or color_off,
		} },
		{ Text = "▉" },
		{ Foreground = {
			Color = b.state_of_charge > 0.4 and color_on or color_off,
		} },
		{ Text = "▉" },
		{ Foreground = {
			Color = b.state_of_charge > 0.6 and color_on or color_off,
		} },
		{ Text = "▉" },
		{ Foreground = {
			Color = b.state_of_charge > 0.8 and color_on or color_off,
		} },
		{ Text = "▉" },
		{ Background = {
			Color = b.state_of_charge > 0.98 and color_on or color_off,
		} },
		{
			Foreground = {
				Color = b.state == "Charging" and color_on:lighten(0.3):complement()
					or (b.state_of_charge < 0.2 and wezterm.GLOBAL.count % 2 == 0) and color_on
						:lighten(0.1)
						:complement()
					or color_off:darken(0.1),
			},
		},
		{ Text = " ⚡ " },
	})

	local time = wezterm.strftime("%a %b %-d %H:%M")

	local bg1 = title_color_bg:lighten(0.1)
	local bg2 = title_color_bg:lighten(0.2)

	window:set_right_status(wezterm.format({
		{ Background = { Color = title_color_bg:lighten(0.1) } },
		{ Foreground = { Color = title_color_fg } },
		{ Foreground = { Color = bg1 } },
		{ Background = { Color = bg2 } },
		{ Foreground = { Color = title_color_bg:lighten(0.4) } },
		{ Foreground = { Color = title_color_fg } },
		{ Text = " " .. time .. " " .. bat },
	}))
end)

wezterm.on("gui-startup", function(cmd)
	local mux = wezterm.mux

	local padSize = 80
	local screenWidth = 2560
	local screenHeight = 1600

	local tab, pane, window = mux.spawn_window(cmd or {
		workspace = "main",
	})

	if window ~= nil then
		window:gui_window():set_position(padSize, padSize)
		window:gui_window():set_inner_size(screenWidth - (padSize * 2), screenHeight - (padSize * 2) - 48)
	end
end)

local TAB_EDGE_LEFT = wezterm.nerdfonts.ple_left_half_circle_thick
local TAB_EDGE_RIGHT = wezterm.nerdfonts.ple_right_half_circle_thick

local function tab_title(tab_info)
	local title = tab_info.tab_title

	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title:gsub("%.exe", "")
end


wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local edge_background = title_color_bg
	local background = title_color_bg:lighten(0.05)
	local foreground = title_color_fg

	if tab.is_active then
		background = background:lighten(0.1)
		foreground = foreground:lighten(0.1)
	elseif hover then
		background = background:lighten(0.2)
		foreground = foreground:lighten(0.2)
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = TAB_EDGE_LEFT },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = TAB_EDGE_RIGHT },
	}
end)

local config = {}

wezterm.max_fps = 120

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}
config.color_scheme = "Tokyo Night"
config.front_end = "WebGpu"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.font = wezterm.font("Monaspace Krypton")
config.macos_window_background_blur = 20
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = title_color_bg:lighten(0.03),
			fg_color = title_color_fg:lighten(0.8),
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = title_color_bg:lighten(0.01),
			fg_color = title_color_fg,
			intensity = "Half",
		},
		inactive_tab_edge = title_color_bg,
	},
	split = title_color_bg:lighten(0.3):desaturate(0.5),
}
config.window_frame = {
	active_titlebar_bg = title_color_bg,
	inactive_titlebar_bg = title_color_bg,
	font_size = 12.0,
}

config.font_size = 14.0
config.use_fancy_tab_bar = false
config.webgpu_preferred_adapter = {
	backend = "Metal",
	device = 0,
	device_type = "IntegratedGpu",
	name = "Apple M1 Pro",
	vendor = 0,
}
config.win32_system_backdrop = "Acrylic"
config.show_tab_index_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "P",
		mods = "CTRL",
		action = wezterm.action.ShowDebugOverlay,
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "/",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '|',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config
