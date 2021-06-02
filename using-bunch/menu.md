---
layout: default
title: The Bunch Menu
parent: Using Bunch
nav_order: 30
tags: [shortcuts]
---
# The Bunch Menu

Just click on the Bunch status item to reveal the menu.

{% hovergif /images/menubarclick.gif "Animated GIF of the Bunch Menu in the Menu Bar" "The Bunch Menu in the Menu Bar" %}

## Bunch List

At the top you'll see your available Bunches. Clicking any of them will launch that Bunch. If you have "Toggle Bunches" enabled, a checkmark will appear next to open Bunches in the menu. Clicking a checked Bunch will close it, reversing app launches and commands, and running any "[run on close]({{ site.baseurl }}/docs/bunch-files/run-on-close/)" lines.

Bunches that have an active [schedule]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/) (e.g. scheduled to launch or waiting to close) will have a timer emoji after their title.

You can control the order Bunches appear in the menu [using frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#sortorder). You can also organize your [Bunches into submenus]({{ site.baseurl }}/docs/using-bunch/organizing-bunches/), if needed.

### Mouse-Based Menu Functions

Holding down modifier keys when clicking Bunches in the menu can perform different functions. These only work when using the mouse, they can't be used in combination with keyboard shortcuts.

|          Modifier         |       Function      |
|---------------------------|---------------------|
| Command (⌘-Click)         | Edit Selected Bunch |
| Option-Command (⌥⌘-Click) | Force Close         |
| Shift-Command  (⇧⌘-Click) | Force Open          |
| Option (⌥-Click)          | Clear Checkmark     |

To use the Edit command (⌘-Click), be sure to specify your preferred text editor in [Preferences]({{ site.baseurl }}/docs/using-bunch/preferences/).

The "Force" commands cause the Bunch to perform its open or close items even if it's already open or closed.

Clearing a checkmark causes the Bunch to register as closed without performing its close functions. This will also remove it from the list of Bunches to restore if "Remember Open Bunches" is enabled.

Holding any modifier combination while the menu is open will display its function at the top of the menu as a reminder.

{% hovergif /images/menumodifiers.gif "Animation showing menu with modifier keys held" "Pressing modifier keys" %}

## Bunch

The Bunch menu is a submenu that contains what would usually be in the application menu of a standard application.

About Bunch
: Standard About Panel.

Check For Updates
: Check for new versions and automatically update Bunch.

## Main Menu

Clear Checkmarks
: When in Toggle Bunches or Single Bunch modes, this options will clear the checkmarks next to "active" Bunches, forcing them to relaunch next time even if they're already running. You can also clear a single checkmark by Option-clicking a checked Bunch in the menu.

New Bunch With Open Apps
: Use this command to create a new Bunch file containing all of the currently open apps on your Mac. This will only include apps that show up in your Dock, not apps that run in your menu bar only (Finder and Bunch will also be ignored). You will have the option to name the new Bunch, and to either save the Bunch to your Bunch folder, or copy the contents to your clipboard.

    {% gif images/newbunchwithopenapps.gif "Animation demonstrating New Bunch With Open Apps command" "New Bunch With Open Apps" %}

Save Current Wallpaper as Default
: When you use [Wallpaper commands](http://brettterpstra.com/bunch-beta/docs/bunch-files/commands/wallpaper/), Bunch stores your current wallpaper so it can restore it when the Bunch closes. Use this option if you change your wallpaper while Bunch is running and want to make sure it has the right desktops stored.

Refresh Bunches
: You can use "Refresh Bunches" at any time to update the menu after editing your configutation files. Bunch should detect any changes and update automatically, but you can use this to force a refresh if something seems out of date.

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

You can hide all windows that Bunch creates ([file displays]({{ site.baseurl }}/docs/bunch-files/commands/display/), [task monitors]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts), etc.), using the "Hide All Window" and "Unhide All Windows". These have the shortcuts {% kbd ⌘H %} and {% kbd ⇧⌘H %} respectively. Keyboard shortcuts are only active when the Bunch menu is showing.

If a Bunch window is active, the menu item "Copy Dimensions of Active Window" will place the current dimensions and position of the window into your clipboard in a format that can be directly pasted into a display command to affect the window parameters next time it opens.
{:.tip}

