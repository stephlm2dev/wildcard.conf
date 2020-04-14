-- Specify Spoons which will be loaded
hs.loadSpoon("SpoonInstall")
Installer = spoon.SpoonInstall
Installer:asyncUpdateAllRepos()

-- Define my constants
myHotkeys = {"ctrl", "alt", "cmd"}
icons = {
  default = "/Applications/Hammerspoon.app/Contents/Resources/AppIcon.icns",
  alert = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/Actions.icns",
  network = "/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AirDrop.icns",
  photo = "/Applications/Polarr Photo Editor.app/Contents/Resources/AppIcon-Lite.icns",
  skype = "/Applications/Skype.app/Contents/Resources/Skype.icns",
  zoom = "/Applications/zoom.us.app/Contents/Resources/ZPLogo.icns"
}

-- https://www.hammerspoon.org/Spoons/Keychain.html
Installer:andUse('Keychain')
Keychain = spoon.Keychain

-- http://www.hammerspoon.org/Spoons/PushToTalk.html
Installer:andUse('PushToTalk', {
  config = {
    app_switcher = {
      ['zoom.us'] = 'push-to-talk',
      ['skype'] = 'push-to-talk'
    }
  }
})
pushToTalk = spoon.PushToTalk

-- http://www.hammerspoon.org/Spoons/MiroWindowsManager.html
Installer:andUse('MiroWindowsManager', {
  config = {
    sizes = {2},
    fullScreenSizes = {1, 2}
  },
  hotkeys = {
    up = {myHotkeys, "up"},
    right = {myHotkeys, "right"},
    down = {myHotkeys, "down"},
    left = {myHotkeys, "left"},
    fullscreen = {myHotkeys, "f"}
  }
})

-- Utilities function
function notify(title, message, icon)
  icon = icon or ''
  hs.notify.new({
    title=title,
    informativeText=message,
    setIdImage=icon,
    withdrawAfter=5
  }):send()
end

function networkPassword(SSID_NETWORK)
  ssid = Keychain:getItem({ account = SSID_NETWORK })
  return ssid.password
end

function connectToNetwork(SSID_NETWORK)
  SSID_PASSWORD = networkPassword(SSID_NETWORK)

  hs.wifi.setPower(true)
  hs.wifi.associate(SSID_NETWORK, SSID_PASSWORD)
end

-- Reload Hammerspoon config
function reloadHammerspoonConfiguration()
  hs.reload()

  notify(
    "Hammerspoon",
    "Configuration reloaded",
    icons.default
  )
end

hs.hotkey.bind(myHotkeys, "R", reloadHammerspoonConfiguration)

-- TODO Development
function triggerDevelopmentMode()
  -- 1. Start "Slack"
  slack = hs.application.open("Slack", 10, true)

  -- 2. Start "Trello"
  trello = hs.application.open("Trello", 10, true)

  -- 3. Start "Mail"
  mail = hs.application.open("Mail")

  -- 4. Start "Safari Technology Preview"
  browser = hs.application.open("Safari Technology Preview")

  -- 5. Start "Alacritty"
  alactritty = hs.application.open("Alacritty")

  -- 6. Focus on "Alacritty"
  alactritty:activate()

  -- FIXME 6.1 Start `tmuxdev`
  -- hs.eventtap.keyStrokes("tmuxdev")

  -- FIXME 6.2 Trigger tmux ressurect
  -- hs.eventtap.keyStroke({"ctrl"}, "B R")

  -- 7. Set brightness to 100% (ie max)
  hs.brightness.set(50)

  notify("Development", "Go dev !")
end

hs.hotkey.bind(myHotkeys, "$", triggerDevelopmentMode)

-- Photography
function triggerPhotographyMode()
  -- 1. Open Finder -> Publications -> Retouche
  os.execute("open $HOME/Publications/Retouche/")

  -- 2. Open "Polarr Photo Editor"
  hs.application.launchOrFocus('Polarr Photo Editor')

  -- 3. Set brightness to 100% (ie max)
  hs.brightness.set(100)

  notify(
    "Photography",
    "Enjoy editing your photos !",
    icons.photo
  )
end

hs.hotkey.bind(myHotkeys, "P", triggerPhotographyMode)

-- Shut down my Mac !
function shutdownMac()
  notify(
    "System",
    "Shutdown in progress !",
    icons.alert
  )

  -- 1. Stop application watcher
  appWatcher:stop()

  -- 2. Stop wifi watcher
  wifiWatcher:stop()

  -- 3. Shutdown system
  hs.caffeinate.shutdownSystem()
end

hs.hotkey.bind(myHotkeys, "Q", shutdownMac)

-- https://www.hammerspoon.org/docs/hs.application.watcher.html
function applicationListener(appName, eventType, appObject)
  if (appName == "Skype" or appName == 'zoom.us') then
    local icon = (appName == "Skype") and icons.skype or icons.zoom
    muteMyVoiceOnMeeting(eventType, icon)
  end
end

-- Switch btw mute and activated microphone
function muteMyVoiceOnMeeting(eventType, icon)
  if (eventType == hs.application.watcher.launched) then
    pushToTalk:start()
    pushToTalk:toggleStates({'push-to-talk', 'release-to-talk'})
    notify(
      "PushToTalk",
      "You can now use 'fn' to speak.",
      icon
    )
  elseif (eventType == hs.application.watcher.terminated) then
    pushToTalk:stop()
    notify(
      "PushToTalk",
      "Hope your meeting was productive !",
      icon
    )
  end
end

function wifiListener(watcher, message, interface)
  local currentNetwork = hs.wifi.currentNetwork(interface)
  if (not currentNetwork) then return end

  local hour = tonumber(os.date("%H"))
  local isAtWork = (currentNetwork == 'FIXME')
  local homeNetworks = { 'FIXME' }
  local isHomeNetwork = not not (hs.fnutils.find(homeNetworks, function(homeNetwork)
    return homeNetwork == currentNetwork
  end))
  local isAtHome = (isHomeNetwork and (hour >= 7 and hour <= 10))

  if (isAtWork or isAtHome) then
    notify(
      isAtWork and "At work" or "Home",
      "Development mode has been triggered !",
      icons.network
    )

    -- 1. Trigger development mode
    triggerDevelopmentMode()

    -- 2. Do not need anymore wifi watcher
    watcher:stop()
  end
end

-- Application watcher
appWatcher = hs.application.watcher.new(applicationListener)
appWatcher:start()

-- Wifi watcher
wifiWatcher = hs.wifi.watcher.new(wifiListener)
wifiWatcher:watchingFor({ "SSIDChange" })
wifiWatcher:start()

-- By default, mute the sound !
audio = hs.audiodevice.defaultOutputDevice()
-- audio:setVolume(0)

-- My meny bar !
menuBar = hs.menubar.new()
menuBar
  :setIcon("./menu.png")
  :setTooltip("Hammerspoon - Menu")
  :setMenu(
    {
      { title = "Reload Hammerspoon conf", fn = reloadHammerspoonConfiguration },
      { title = "-" },
      {
        title = "Mode",
        menu = {
          { title = "Development", fn = triggerDevelopmentMode },
          { title = "Photography", fn = triggerPhotographyMode }
        }
      }
    }
  )

-- TODO input action in Alacritty (try AppleScript)