local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Disable audible bell
config.audible_bell = "Disabled"

config.keys = {
	{
		key = "E",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
