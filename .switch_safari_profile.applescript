tell application "System Events"
  tell (first process whose frontmost is true) 
    set activeWindow to window 1
    set activeWindowName to name of activeWindow
    set activeProfile to word 1 of activeWindowName
  end tell
end tell

if activeProfile is "School" then
  activate application "Safari"
  tell application "Safari"
    set currentWindows to every window
    set activeWindow to first window
    set activeWindowName to name of activeWindow
    set activeProfile to word 1 of activeWindowName
    if count of currentWindows = 1 then
      tell application "System Events" to click menu item "New Personal Window" of menu "File" of menu bar 1 of application process "Safari"
    else if count of currentWindows > 1 then
      repeat with i from 2 to count of currentWindows
        set thisWindow to item i of currentWindows
        set thisWindowName to name of item i of currentWindows
        set thisProfile to word 1 of thisWindowName
        if thisProfile is not equal to activeProfile then
          set index of thisWindow to 1
          exit repeat
        end if
      end repeat
    end if
  end tell
else if activeProfile is "Personal" then
  activate application "Safari"
  tell application "Safari"
    set currentWindows to every window
    set activeWindow to first window
    set activeWindowName to name of activeWindow
    set activeProfile to word 1 of activeWindowName
    if count of currentWindows = 1 then
      tell application "System Events" to click menu item "New School Window" of menu "File" of menu bar 1 of application process "Safari"
    else if count of currentWindows > 1 then
      repeat with i from 2 to count of currentWindows
        set thisWindow to item i of currentWindows
        set thisWindowName to name of item i of currentWindows
        set thisProfile to word 1 of thisWindowName
        if thisProfile is not equal to activeProfile then
          set index of thisWindow to 1
          exit repeat
        end if
      end repeat
    end if
  end tell
else
  activate application "Safari"
  tell application "Safari"
    set currentWindows to every window
    set activeWindow to first window
    set activeWindowName to name of activeWindow
    set activeProfile to word 1 of activeWindowName
    if activeProfile is "School" then
      tell application "System Events" to click menu item "New Personal Window" of menu "File" of menu bar 1 of application process "Safari"
      tell "Safari" to close activeWindow
      tell "Safari" to activate
    end if
  end tell
end if
