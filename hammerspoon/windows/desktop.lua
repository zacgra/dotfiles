
local spaceNames = hs.spaces.missionControlSpaceNames()

-- Create array of nums 1-9
local desktopNums = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}

for i = 1, #desktopNums do
    hs.hotkey.bind({"ctrl", "shift"}, desktopNums[i] , function()
        -- get the spaceNumberKey from the Desktop number (Ex: "Desktop 1")
        local spaceNumberKey = findKeyByValue(spaceNames, "Desktop" .. " " .. desktopNums[i] )

        --
        hs.spaces.moveWindowToSpace(hs.window.focusedWindow(), spaceNumberKey)
        hs.alert.show("Sent to" .. " " .. desktopNums[i])
    end)
end

function switch_desktop(desktopNum)
  hs.eventtap.keyStroke({"ctrl", "alt"}, tostring(desktopNum))
end

function display_desktop_num(desktopNum)
  hs.alert.show("Desktop " .. tostring(desktopNum), 0.5)
end

for i = 1, #desktopNums do
    hs.hotkey.bind({"ctrl"}, desktopNums[i] , function()
      switch_desktop(i)
    end)
end

-- findKeyByValue(tbl, val)
--
-- The hs.spaces.missionControlSpaceNames() function assigns seemingly arbitrary
--   values to a space name.  This does a reverse lookup by providing a desktop
--   string and returning a space name key.
--
-- Example:
-- For a multi-monitor set up, hs.spaces.missionControlSpaceNames() might return
--  a table like this:
-- {
--   ["31DA635A-3001-09F4-7845-DA2574E1CC7A"] = {
--     [10] = "Desktop 6",
--     [11] = "Desktop 7",
--     [68] = "Desktop 8"
--     [5] = "Desktop 9",
--     [12] = "Desktop 10",
--   },
--   ["8918051B-790E-3DB5-E216-3B8A3693F99C"] = { "Desktop 1",
--     [6] = "Desktop 2",
--     [7] = "Desktop 3",
--     [8] = "Desktop 4",
--     [9] = "Desktop 5"
--   }
-- }
--
-- local spaceNames = hs.spaces.missionControlSpaceNames()
-- findKeyByValue(spaceNames, "Desktop 2") => 6
--
-- Note that findKeyByValue(spaceNames, "Desktop 1") => 1

function findKeyByValue(tbl, val)
  for k, v in pairs(tbl) do
    if type(v) == "table" then
      for i, j in pairs(v) do
        if j == val then
          return i
        end
      end
    elseif v == val then
      return k
    end
  end
  return nil
end
