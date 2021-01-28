---
layout: default
title: Commands
parent: Bunch Files
---
# Bunch Special Commands

Lines surrounded in parenthesis are Bunch commands. These offer shortcuts to some system tasks.

    (dark mode [on|off])
    (do not disturb [on|off])
    ([hide|show] dock)
    (dock [left|right|bottom])
    ([hide|show] desktop)
    (wallpaper [path(s)])
    (audio [input|output] device_name)
    (audio [input|output] volume [0-100])
    (audio [input|output] [mute|unmute])
    (notify text)
    (sleep [display])

### __Dark Mode__ Commands

Turn macOS Dark Mode on and off: `(dark mode on)`, `(dark mode off)`. An "on" command can be shortened to just `(dark mode)`, and `(dark mode off)` can be shortened to `(light mode)`.

### __Do Not Disturb__ Commands

Toggle notifications. The commands can be abbreviated as `(dnd on)` and `(dnd off)`. Actually, `(dnd on)` can just be `(dnd)`, too. I like to make things intuitive by overcomplicating them sometimes.

### __Dock__ Commands 

(`(hide dock)`, `(show dock)`) show and hide the Dock (Turn Hiding On), or reposition the dock (`(dock left)`, `(dock bottom)`, `(dock right)`).

### __Desktop__ Commands

Hide and show desktop icons: `(hide desktop)`, `(show desktop)`.

### __Wallpaper__ Commands 

Set the Desktop Image for one or more displays. Provide a full path to the image, e.g. `(wallpaper ~/Pictures/my desktop.jpg)`. If a single path is given, all available displays will be set to that image. If multiple paths separated by a pipe (`|`) are provided, images will be applied to the available displays in order (first image path to first display, second path to second display, etc.). If you declare more paths than you have displays, additional paths will be ignored. The desktop image(s) that are in place when Bunch first launches will be restored when quitting any Bunch. 

> If you manually change the Desktop image while Bunch is running, use __Preferences->*Save Current Wallpaper as Default*__ to update the fallback image(s).
{:.tip}

### __Audio__ Commands

Change your system input and output devices, as well as control the volume of either. 

To set an audio device, you just need to specify input or output, and then provide all or a unique part of the name of an existing device (case insensitive, first match wins). For example, `(audio input scarlett)` would set my system input to my Scarlett Solo. `(audio output io hub)` would change my system audio output to my iO Hub. 

The volume command defaults to output volume if `input` or `output` is not specified (e.g. `(audio volume 50)`). Specify input or output before a volume or mute command to affect one channel or the other. `(audio output 0)` will simulate mute --- use `(audio output mute)` to actually mute the channel while preserving volume setting. (All of the preceding commands will work with either `input` or `output`.)

See [Bunch gets audio control](https://brettterpstra.com/2020/09/10/bunch-gets-audio-control/) for more info.

### __Notify__ Command

This simply takes a string of text and creates a Notification Center alert or banner (depending on your settings). Banners are assigned an identifier with the calling Bunch's name, so subsequent alerts overwrite the first, avoiding a pileup of notifications.

> I highly recommend setting your alert style for Bunch to "Alerts" in System Preferences->Notifications. This makes the information from Bunches more useful, and allows some actions (like scheduled Bunches) to provide a cancel method that would otherwise be immediately hidden.
{:.tip}

### __Sleep__ Commands

`(sleep)` will immediately sleep your Mac. 

`(sleep display)` will sleep the display.

`(sleep screensaver)` will start the screen saver, also locking your machine if you have that set up in System Preferences.

## Reversing Commands

All commands are automatically reversed when closing a Bunch (hidden Desktop icons are shown, hidden dock is revealed, wallpapers switch back, etc.), with the exception of the Dock positioning, notification, and audio commands. 

To _avoid_ reversing a command when closing the Bunch, precede the line with a `%` symbol, e.g. `%(hide dock)` (similar to [ignoring applications when quitting](/bunch/docs/bunch-files/ignore-on-close.html)). 

To run the command _only_ when closing a bunch, use an exclamation point (`!`) before the command, e.g. `!(show desktop)`.
