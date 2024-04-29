
hs.hotkey.bind("cmd", 'h', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowWest()
    end
end)

hs.hotkey.bind("cmd", 'j', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowSouth()
    end
end)

hs.hotkey.bind("cmd", 'k', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowNorth()
    end
end)

hs.hotkey.bind("cmd", 'l', function()
    if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowEast()
    end
end)
