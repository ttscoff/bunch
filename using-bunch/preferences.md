---
layout: default
title: Preferences
parent: Using Bunch
nav_order: 30
---
Toggle Bunches
: When this is enabled, running bunches are shown with a checkmark in the menu, and clicking them again will quit apps contained in that bunch instead of relaunching them.

Single Bunch Mode
: Turning this on will cause the active Bunch to quit when opening a new Bunch. Any apps in the last Bunch that are not included in the new Bunch will be terminated, and any Bunch commands will be reversed unless the new Bunch contains a Bunch command of the same type (if the command affects the Dock and the new bunch command also affects the Dock, no action is taken).

Remember Open Bunches
: If this option is enabled, any Bunches you had open when Bunch was quit (or terminated) will be reloaded when Bunch is relaunched. If an open Bunch is also part of a [startup script]({{ site.baseurl }}/docs/bunch-files/startup-scripts.html), it will be ignored during launch.

Refresh Bunches
: You can use "Refresh Bunches" at any time to update the menu after editing your configutation files. As of version 1.0.10 this shouldn't be necessary, changes will automatically be detected. You can still use this to force a refresh if something seems out of date.

Change Bunches Folder
: Select a new folder where Bunch will look for `.bunch` files.

Reveal Bunches in Finder
: Opens the folder containing your `.bunch` configuration files (Bunches) in Finder for editing.

Run In Menu Bar/Run In Dock
: Switch between running Bunch with an icon in the Dock and running as a Menu Bar item. In Menu Bar state Bunch won't show up in the Application Switcher (Cmd-Tab).

Launch at Login
: Add and remove Bunch from your User Login Items.
