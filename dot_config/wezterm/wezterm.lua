local wezterm = require("wezterm")



local config = {}

wezterm.max_fps = 120

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

config.font_size = 14.0
config.use_fancy_tab_bar = true 
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
config.leader = { key = " ", mods = "SHIFT", timeout_milliseconds = 1000 }
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

return config
