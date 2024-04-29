function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
  end

   --- quick open applications

   hs.hotkey.bind({"cmd", "shift"}, "i", open("iTerm"))
   hs.hotkey.bind({"cmd", "shift"}, "c", open("Visual Studio Code"))
