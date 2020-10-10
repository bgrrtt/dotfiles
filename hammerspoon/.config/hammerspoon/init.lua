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

function moveLeftHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function moveRightHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function maximize()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end

function moveToScreen(screenPos)
  window = hs.window.focusedWindow()
  screen = hs.screen.find({x=screenPos, y=0})
  window:moveToScreen(screen)
end

hs.hotkey.bind(hyper, "1", function()
  moveToScreen(0)
  moveLeftHalf()
end)

hs.hotkey.bind(hyper, "2", function()
  moveToScreen(0)
  moveRightHalf()
end)

hs.hotkey.bind(hyper, "M", maximize)
hs.hotkey.bind(hyper, "Return", maximize)
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
