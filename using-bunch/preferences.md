---
layout: default
title: Preferences
parent: Using Bunch
nav_order: 30
---
# Preferences Menu

Toggle Bunches
: When this is enabled, running bunches are shown with a checkmark in the menu, and clicking them again will quit apps contained in that bunch instead of relaunching them.

Single Bunch Mode
: Turning this on will cause the active Bunch to quit when opening a new Bunch. Any apps in the last Bunch that are not included in the new Bunch will be terminated, and any Bunch commands will be reversed unless the new Bunch contains a Bunch command of the same type (e.g. if the command affects the Dock and the new bunch command also affects the Dock, no action is taken).
: You can exclude a Bunch from Single Bunch Mode by using the [frontmatter key]({{ site.baseurl }}/docs/bunch-files/frontmatter/) `single bunch mode: ignore`. When this key is set, the Bunch will not be automatically closed when opening another Bunch, and opening at launch will not prevent other Bunches from opening.

Launch Items in Parallel
: Determines whether your Bunch items launch in order or all at once. See [Execution Sequence]({{ site.baseurl }}/docs/bunch-files/sequence/) for more information.

Quit Apps Open in Other Bunches
: When this is off and you toggle a Bunch closed, it will avoid quitting apps that are currently open in another Bunch. Turn it on to quit all apps in the Bunch, regardless of other Bunches. This can be enabled on individual Bunches using the [`quits apps: always` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior).

Remember Open Bunches
: If this option is enabled, any Bunches you had open when Bunch was quit (or terminated) will be reloaded when Bunch is relaunched. If an open Bunch is also part of a [startup script]({{ site.baseurl }}/docs/bunch-files/startup-scripts/), it will be ignored during launch.

Save Current Wallpaper as Default
: When you use [Wallpaper commands](http://brettterpstra.com/bunch-beta/docs/bunch-files/commands/#wallpaper), Bunch stores your current wallpaper so it can restore it when the Bunch closes. Use this option if you change your wallpaper while Bunch is running and want to make sure it has the right desktops stored.

---

Run In Menu Bar/Run In Dock
: Switch between running Bunch with an icon in the Dock and running as a Menu Bar item. In Menu Bar state Bunch won't show up in the Application Switcher (Cmd-Tab).

Launch at Login
: Add and remove Bunch from your User Login Items.

---

Change Bunch Folder
: Select a new folder where Bunch will look for `.bunch` files. At the bottom of the menu you'll find quick links to previous Bunch folders, which is handy if you switch Bunch sets frequently.

Reveal Bunches in Finder
: Opens the folder containing your `.bunch` configuration files (Bunches) in Finder for editing.

Refresh Bunches
: You can use "Refresh Bunches" at any time to update the menu after editing your configutation files. As of version 1.0.10 this shouldn't be necessary, changes will automatically be detected. You can still use this to force a refresh if something seems out of date.

---

Recent Bunch Folders
: If you've changed your Bunch folder, you'll find previous folders listed here for quick switching.
