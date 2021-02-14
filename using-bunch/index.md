---
layout: default
title: Using Bunch
nav_order: 50
has_children: true
---
First, you need some Bunch files located in [your Bunch folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder). There's an example one in there, so go ahead and get started by editing that. See the [Bunch Files]({{ site.baseurl }}/docs/bunch-files) section to learn all about the syntax and features.

Once you have one or more `.bunch` files in your Bunch folder, launch Bunch (or right click it and choose "Refresh Bunches"). Now when you right-click the Dock icon, you'll see all available Bunches listed at the top of the popup menu. Select one to launch, quit, or focus the apps as defined in that Bunch file.

If you prefer to run Bunch in the Menu Bar at the top of your display, use __Preferences->Run in Menu Bar__ to move it up there. When it's in the Menu Bar, the menu is available with a single click (no right click). You can move it back to the Dock using __Preferences->Run in Dock__.

If "Preferences->Toggle Bunches" is enabled, when a Bunch is opened its menu item receives a checkmark. Selecting a Bunch with an active checkmark will "toggle" the Bunch, quitting any apps it launched (if they're running) and reversing any Dock commands.

If "Preferences->Single Bunch Mode" is enabled, clicking a Bunch will quit apps in the previous Bunch before opening it.

Otherwise, clicking a Bunch will always launch the apps in the Bunch, or bring them to front if they're already running.
