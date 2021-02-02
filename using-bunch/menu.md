---
layout: default
title: Bunch Menu
parent: Using Bunch
nav_order: 1
---
When running in the Dock the menu is accessed by right clicking the Dock icon. When in the menu bar, just click on the Bunch status item. The menu items are the same for either.

At the top you'll see your available Bunches. Clicking any of them will launch that Bunch. If you have "Toggle Bunches" enabled, a checkmark will appear next to open Bunches in the menu. Clicking a checked Bunch will close it, reversing app launches and commands, and running any "[run on close]({{ site.baseurl }}/docs/bunch-files/run-on-close.html)" lines.

## Main Menu

Clear Checkmarks
: When in Toggle Bunches or Single Bunch modes, this options will clear the checkmarks next to "active" Bunches, forcing them to relaunch next time even if they're already running. You can also clear a single checkmark by Option-clicking a checked Bunch in the menu.

Quit Apps in...
: You can quit the apps listed in any Bunch from this submenu. Files, scripts, and urls (as well as `!` lines that already quit an app) are ignored, unless they're preceded with a `!` to indicate they run on quit. Some commands are reversed (Dock, Wallpaper, DND, Desktop icons...).

## Preferences

[See Preferences.]{{ site.baseurl }}/docs/using-bunch/preferences.html)

## Help

Open Log
: Open the Bunch log in Console for debugging.

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
