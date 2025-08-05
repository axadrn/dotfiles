local apps = {
  T = "Ghostty",
  C = "Google Chrome",
  S = "Safari",
}

local hyper = { "cmd", "alt", "ctrl", "shift" }

for key, appName in pairs(apps) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(appName)
  end)
end

hs.hotkey.bind(hyper, "X", function()
  hs.urlevent.openURL("https://twitter.com/intent/tweet")
end)
