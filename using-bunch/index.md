---
layout: default
title: Using Bunch
nav_order: 50
has_children: true
---
First, you need some Bunch files located in [your Bunch folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder). There's an example one in there, so go ahead and get started by editing that. See the [Bunch Files]({{ site.baseurl }}/docs/bunch-files) section to learn all about the syntax and features.

Once you have one or more `.bunch` files in your Bunch folder they should show up automatically when you open the Bunch menu (either by right-clicking the Dock icon or clicking Bunch in the menu bar). Select a Bunch in the menu to launch, quit, or focus the apps as defined in that Bunch file.

If you prefer to run Bunch in the Menu Bar at the top of your display, select __Run in Menu Bar__ in [Preferences]({{ site.baseurl }}/docs/using-bunch/preferences/) to move it up there. When it's in the Menu Bar, the menu is available with a single click (no right click). You can move it back to the Dock by unchecking __Run in Menu Bar__ in Preferences.

If "Toggle Bunches" is enabled in Preferences, when a Bunch is opened its menu item receives a checkmark. Selecting a Bunch with an active checkmark will "toggle" the Bunch, quitting any apps it launched (if they're running and not open in other Bunches) and reversing any Dock commands.

If "Single Bunch Mode" is enabled, clicking a Bunch will quit apps in the previous Bunch before opening it.

If neither "Toggle Bunches" nor "Single Bunch Mode" is enabled, clicking a Bunch will always launch the apps and commands in the Bunch, or bring them to front if they're already running.
