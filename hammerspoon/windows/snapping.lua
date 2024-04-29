hs.hotkey.bind({ "ctrl", "alt" }, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "alt" }, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "alt" }, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"ctrl", "alt"}, "f", function()
    local win = hs.window.focusedWindow()
    if win ~= nil then
        win:setFullScreen(not win:isFullScreen())
    end
end)

------------------------------------------------------------
hs.hotkey.bind({ "ctrl", "alt" }, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "alt" }, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({ "ctrl", "alt" }, "i", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-----------------------------------------------------

-- hs.hotkey.bind({ "ctrl", "alt" }, "1", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w * 2 / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({ "ctrl", "alt", "shift" }, "1", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w * 2/3)
--   f.y = max.y
--   f.w = max.w * 1 / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({ "ctrl", "alt" }, "2", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w * 1 / 6)
--   f.y = max.y
--   f.w = max.w * 2 / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({ "ctrl", "alt" }, "3", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w * 1 / 3)
--   f.y = max.y
--   f.w = max.w * 2 / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)

-- hs.hotkey.bind({ "ctrl", "alt", "shift" }, "3", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x
--   f.y = max.y
--   f.w = max.w * 1 / 3
--   f.h = max.h
--   win:setFrame(f)
-- end)
