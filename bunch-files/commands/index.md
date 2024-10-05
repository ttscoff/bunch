---
layout: default
title: Commands
parent: Bunch Files
has_children: true
---
# Bunch Special Commands

Commands are run by using lines surrounded by parenthesis in Bunch files. These offer shortcuts to some system tasks and special actions.

```bunch
(dark mode [on|off])
(do not disturb [on|off])
(hide dock)
(show dock)
(dock [left|right|bottom])
(hide desktop)
(show desktop)
(wallpaper [path(s)])
(screen)
(audio [input|output] device_name)
(audio [input|output] volume [0-100])
(audio [input|output] [mute|unmute])
(input source [name])
(notify TEXT)
(display FILE)
(sleep [display])
(awake [interval])
(log [MESSAGE])
(shortcut [SHORTCUT NAME])
```

## Reversing Commands

Most commands are automatically reversed when closing a Bunch (hidden Desktop icons are shown, hidden dock is revealed, wallpapers switch back, etc.). Notable exceptions include Dock positioning, notification, and audio commands, which are not restored to their previous state when the Bunch closes.

To _avoid_ reversing a command when closing the Bunch, precede the line with a `%` symbol, e.g. `%(hide dock)` (just like [ignoring applications when quitting]({{ site.baseurl }}/docs/bunch-files/apps#ignoring-appscommands-on-close)).

To run the command _only_ when closing a bunch, use an exclamation point (`!`) before the command, e.g. `!(show desktop)`.

