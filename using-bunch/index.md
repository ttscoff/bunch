---
layout: default
title: Using Bunch
nav_order: 50
has_children: true
---
First, you need some Bunch files located in [your Bunch folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder). There's an example one in there, so go ahead and get started by editing that. See the [Bunch Files]({{ site.baseurl }}/docs/bunch-files) section to learn all about the syntax and features.

Once you have one or more `.bunch` files in your Bunch folder they should show up automatically when you open the Bunch menu by clicking the Bunch icon in the menu bar. Select a Bunch in the menu to launch, quit, or focus the apps as defined in that Bunch file.

If "Toggle Bunches" is enabled in Preferences, when a Bunch is opened its menu item receives a checkmark. Selecting a Bunch with an active checkmark will "toggle" the Bunch, quitting any apps it launched (if they're running and not open in other Bunches) and reversing any Dock commands.

If "Single Bunch Mode" is enabled, clicking a Bunch will quit apps in the previous Bunch before opening it.

If neither "Toggle Bunches" nor "Single Bunch Mode" is enabled, clicking a Bunch will always launch the apps and commands in the Bunch, or bring them to front if they're already running.
