---
layout: default
title: Bunch Menu
parent: Using Bunch
nav_order: 20
---
# The Bunch Menu

When running in the Dock the menu is accessed by right clicking the Dock icon. When in the menu bar, just click on the Bunch status item. 

The menu items are the same for both Dock and menu bar, with the exception of the __Bunch__ menu containing "About" and "Check For Updates." In Dock mode, this menu is found in the upper left of your menu bar. In menu bar mode, it's a submenu item in the dropdown.

## Bunch List

At the top you'll see your available Bunches. Clicking any of them will launch that Bunch. If you have "Toggle Bunches" enabled, a checkmark will appear next to open Bunches in the menu. Clicking a checked Bunch will close it, reversing app launches and commands, and running any "[run on close]({{ site.baseurl }}/docs/bunch-files/run-on-close/)" lines.

Bunches that have an active [schedule]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/) (e.g. scheduled to launch or waiting to close) will have a timer emoji after their title.

### Mouse-Based Menu Functions

Holding down modifier keys when clicking Bunches in the menu can perform different functions. These only work when using the mouse, they can't be used in combination with keyboard shortcuts.

|          Modifier         |       Function      |
|---------------------------|---------------------|
| Command (⌘-Click)         | Edit Selected Bunch |
| Option-Command (⌥⌘-Click) | Force Close         |
| Shift-Command  (⇧⌘-Click) | Force Open          |
| Option (⌥-Click)          | Clear Checkmark     |

The "Force" commands cause the Bunch to perform its open or close items even if it's already open or closed.

Clearing a checkmark causes the Bunch to register as closed without performing its close functions. This will also remove it from the list of Bunches to restore if "Remember Open Bunches" is enabled.

Holding any modifier combination while the menu is open will display its function at the top of the menu as a reminder.

{% img aligncenter /images/menumodifiers.jpg 400 79 %}

## Bunch

The Bunch menu is a submenu when in menu bar mode, but in Dock mode it's found in the upper left corner of your menu bar when Bunch is the foreground app (the same place as any regular Dock application).

About Bunch
: Standard About Panel.

Check For Updates
: Check for new versions and automatically update Bunch.

Changelog
: Quick access to the latest changes.

Make a Donation
: If you love Bunch, [pay what you can]({{ site.baseurl }}/donate/) for it.

There are also shortcuts to the [Preference items]({{ site.baseurl }}/docs/using-bunch/preferences/) in the Bunch menu when running in Dock mode.

## Main Menu

Clear Checkmarks
: When in Toggle Bunches or Single Bunch modes, this options will clear the checkmarks next to "active" Bunches, forcing them to relaunch next time even if they're already running. You can also clear a single checkmark by Option-clicking a checked Bunch in the menu.

Close Items in...
: You can quit the apps opened in any Bunch from this submenu. Files, scripts, and urls (as well as `!` lines that already quit an app) are ignored, unless they're preceded with a `!` to indicate they run on close. Some commands are reversed (Dock, Wallpaper, DND, Desktop icons...).

New Bunch With Open Apps
: Use this command to create a new Bunch file containing all of the currently open apps on your Mac. This will only include apps that show up in your Dock, not apps that run in your menu bar only (Finder and Bunch will also be ignored). You will have the option to name the new Bunch, and to either save the Bunch to your Bunch folder, or copy the contents to your clipboard.

: {% gif images/newbunchwithopenapps.gif "New Bunch With Open Apps" %}

Save Current Wallpaper as Default
: When you use [Wallpaper commands](http://brettterpstra.com/bunch-beta/docs/bunch-files/commands/wallpaper/), Bunch stores your current wallpaper so it can restore it when the Bunch closes. Use this option if you change your wallpaper while Bunch is running and want to make sure it has the right desktops stored.

Refresh Bunches
: You can use "Refresh Bunches" at any time to update the menu after editing your configutation files. As of version 1.0.10 this shouldn't be necessary, changes will automatically be detected. You can still use this to force a refresh if something seems out of date.

## Preferences

[See Preferences.]({{ site.baseurl }}/docs/using-bunch/preferences/)

## Help

Open Log
: Open the [Bunch log]({{ site.baseurl }}/docs/using-bunch/bunch-log/) in Console for debugging.

Set Log Level
: Set the verbosity of the log messages.

Bunch Help
: Opens this page in your browser.

Changelog
: Opens the full version history in your browser.

Make a donation
: Because it's the [right thing to do]({{ site.baseurl }}/donate/), in my opinion.

## Windows

In Dock mode you can just use <kbd>⌘H</kbd> to hide all windows ([file displays]({{ site.baseurl }}/docs/bunch-files/commands/display/), [task monitors]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts), etc.), and reactiving Bunch by clicking on the Dock icon or ⌘-Tabbing to it will show them again. This doesn't work in menu bar mode, so that menu has the extra options "Hide All Window" and "Unhide All Windows". These have the shortcuts <kbd>⌘H</kbd> and <kbd>⇧⌘H</kbd> respectively. Keyboard shortcuts are only active when the Bunch menu is showing.

> You can also refresh and reveal Bunches in Finder from the __File__ menu, and check for updates and control preferences (Bunch location, Single Bunch Mode) from the __Bunch__ menu.
{:.tip}
