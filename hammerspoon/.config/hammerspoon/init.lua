-- https://medium.com/@robhowlett/hammerspoon-the-best-mac-software-youve-never-heard-of-40c2df6db0f8
-- https://ulrik.is/writing/hammerspooning-osx/


-----------------------------------------------
-- Set: Hyper Key
-----------------------------------------------

hyper = {"ctrl", "alt", "cmd", "shift"}

-- hyper shift?

-----------------------------------------------
-- Scripts
-----------------------------------------------

amphetamine = require "amphetamine"
wifiMenu = require "wifiMenu"
longQuit = require "longQuit"

-----------------------------------------------
-- Window Management
-----------------------------------------------

hs.window.animationDuration = 0

-----------------------------------------------
-- Hotkeys
-----------------------------------------------

hs.hotkey.bind({"alt"}, "space", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
