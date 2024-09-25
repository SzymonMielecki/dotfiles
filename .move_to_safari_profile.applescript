
tell application "Safari"
  activate
  set currentWindows to every window
  set activeWindow to first window
  set activeWindowName to name of activeWindow
  tell activeWindow
    set activeTab to current tab
    tell current tab
      set tab_url to URL
    end tell
  end tell
  set activeProfile to word 1 of activeWindowName
  if count of currentWindows > 1 then
    repeat with i from 2 to count of currentWindows
      set thisWindow to item i of currentWindows
      set thisWindowName to name of item i of currentWindows
      set thisProfile to word 1 of thisWindowName
      tell activeWindow to delete activeTab
      if thisProfile is not equal to activeProfile then
        tell thisWindow to set current tab to make new tab with properties {URL:tab_url}
        set index of thisWindow to 1
        exit repeat
      end if
    end repeat
  else
    if activeProfile is "School" then
      tell activeWindow to delete activeTab
      tell application "System Events" to click menu item "New Personal Window" of menu "File" of menu bar 1 of application process "Safari"
      set thisWindow to first window
      set firstTab to first tab of thisWindow
      tell thisWindow to set current tab to make new tab with properties {URL:tab_url}
      delete firstTab
    else
      tell application "System Events" to click menu item "New School Window" of menu "File" of menu bar 1 of application process "Safari"
      set thisWindow to first window
      set firstTab to first tab of thisWindow
      tell thisWindow to set current tab to make new tab with properties {URL:tab_url}
      delete firstTab
    end if
  end if
end tell
