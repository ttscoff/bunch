---
layout: default
title: Bunch Menu
parent: Using Bunch
nav_order: 20
---
When running in the Dock the menu is accessed by right clicking the Dock icon. When in the menu bar, just click on the Bunch status item. 

The menu items are the same for both Dock and menu bar, with the exception of the __Bunch__ menu containing "About" and "Check For Updates." In Dock mode, this menu is found in the upper left of your menu bar. In menu bar mode, it's a submenu item in the dropdown.

At the top you'll see your available Bunches. Clicking any of them will launch that Bunch. If you have "Toggle Bunches" enabled, a checkmark will appear next to open Bunches in the menu. Clicking a checked Bunch will close it, reversing app launches and commands, and running any "[run on close]({{ site.baseurl }}/docs/bunch-files/run-on-close/)" lines.

Bunches that have an active [schedule]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) (e.g. scheduled to launch or waiting to close) will have a timer emoji after their title.

## Bunch

The Bunch menu is a submenu when in menu bar mode, but in Dock mode it's found in the upper left corner of your menu bar when Bunch is the foreground app (the same place as any regular Dock application).

About Bunch
: Standard About Panel.

Check For Updates
: Check for new versions and automatically update Bunch.

Changelog
: Quick access to the latest changes.

Make a Donation
: If you love Bunch, [pay what you can]({{ site.baseurl }}/donate) for it.

There are also shortcuts to the [Preference items]({{ site.baseurl }}/docs/using-bunch/preferences) in the Bunch menu when running in Dock mode.

## Main Menu

Clear Checkmarks
: When in Toggle Bunches or Single Bunch modes, this options will clear the checkmarks next to "active" Bunches, forcing them to relaunch next time even if they're already running. You can also clear a single checkmark by Option-clicking a checked Bunch in the menu.

Close Items in...
: You can quit the apps opened in any Bunch from this submenu. Files, scripts, and urls (as well as `!` lines that already quit an app) are ignored, unless they're preceded with a `!` to indicate they run on close. Some commands are reversed (Dock, Wallpaper, DND, Desktop icons...).

New Bunch With Open Apps
: Use this command to create a new Bunch file containing all of the currently open apps on your Mac. This will only include apps that show up in your Dock, not apps that run in your menu bar only (Finder and Bunch will also be ignored). You will have the option to name the new Bunch, and to either save the Bunch to your Bunch folder, or copy the contents to your clipboard.

: {% gif images/newbunchwithopenapps.gif "New Bunch With Open Apps" %}

## Preferences

[See Preferences.]({{ site.baseurl }}/docs/using-bunch/preferences)

## Help

Open Log
: Open the [Bunch log]({{ site.baseurl }}/docs/using-bunch/bunch-log) in Console for debugging.

Set Log Level
: Set the verbosity of the log messages.

Bunch Help
: Opens this page in your browser.

Changelog
: Opens the full version history in your browser.

Make a donation
: Because it's the [right thing to do]({{ site.baseurl }}/donate), in my opinion.

> You can also refresh and reveal Bunches in Finder from the __File__ menu, and check for updates and control preferences (Bunch location, Single Bunch Mode) from the __Bunch__ menu.
{:.tip}
