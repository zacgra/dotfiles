function send_window_prev_monitor()
local win = hs.window.focusedWindow()
local nextScreen = win:screen():previous()
win:moveToScreen(nextScreen)
end

function send_window_next_monitor()
local win = hs.window.focusedWindow()
local nextScreen = win:screen():next()
win:moveToScreen(nextScreen)
end

--- window
hs.hotkey.bind({"shift", "ctrl"}, "Left", send_window_next_monitor)
hs.hotkey.bind({"shift", "ctrl"}, "Right", send_window_prev_monitor)
