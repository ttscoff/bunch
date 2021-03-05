---
layout: default
title: Preferences
parent: Using Bunch
nav_order: 30
---
# Preferences Menu

If you're running in Dock mode, Bunch preferences can be accessed from the menu item __Bunch->Preferences__ (or <kbd>⌘-comma</kbd>). In menu bar mode, click the Bunch icon in the menu bar and select __Preferences...__.

{% img mx-auto /bunch/images/BunchPreferences.png 528 392 "Bunch Preference Pane" "Preference Pane Screenshot" %}

## Application Settings

Run In Menu Bar
: Switch between running Bunch with an icon in the Dock and running as a Menu Bar item. In Menu Bar state Bunch won't show up in the Application Switcher (Cmd-Tab).

Launch at Login
: Add and remove Bunch from your User Login Items.

Remember Open Bunches
: If this option is enabled, any Bunches you had open when Bunch was quit (or terminated) will be reloaded when Bunch is relaunched. If an open Bunch is also part of a [startup script]({{ site.baseurl }}/docs/bunch-files/startup-scripts/), it will be ignored during launch.

Accessibility
: Bunch requires Accessibility permission to be granted to perform some of its functions. If permission isn't granted, you can click this button to open the appropriate Security pane in System Preferences.

Hotkey
: You can assign a global hotkey by clicking in the hotkey field and then pressing your desired key combination. The hotkey only works when running in the menu bar. When pressed while using any application, it will display the Bunch menu, allowing you to use [keyboard shortcuts]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shorcuts) to launch your Bunches.

## Bunch Behavior

Toggle Bunches
: When this is enabled, running bunches are shown with a checkmark in the menu, and clicking them again will quit apps contained in that bunch instead of relaunching them.

Single Bunch Mode
: Turning this on will cause the active Bunch to quit when opening a new Bunch. Any apps in the last Bunch that are not included in the new Bunch will be terminated, and any Bunch commands will be reversed unless the new Bunch contains a Bunch command of the same type (e.g. if the command affects the Dock and the new bunch command also affects the Dock, no action is taken).
: You can exclude a Bunch from Single Bunch Mode by using the [frontmatter key]({{ site.baseurl }}/docs/bunch-files/frontmatter/) `single bunch mode: ignore`. When this key is set, the Bunch will not be automatically closed when opening another Bunch, and opening at launch will not prevent other Bunches from opening.

Launch Items in Parallel
: Determines whether your Bunch items launch in order or all at once. See [Execution Sequence]({{ site.baseurl }}/docs/bunch-files/sequence/) for more information.

Quit Apps Open in Other Bunches
: When this is off and you toggle a Bunch closed, it will avoid quitting apps that are currently open in another Bunch. Turn it on to quit all apps in the Bunch, regardless of their state in other Bunches. This can be enabled on individual Bunches using the [`quits apps: always` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior).

## Bunch Folder

The field next to "Bunch Folder" will show your current Bunch Folder location. If you've changed the Bunch Folder location, clicking the popup button will allow you to quickly change between recent locations.

Set
: Select a new folder where Bunch will look for `.bunch` files.

Reveal
: Opens the folder containing your `.bunch` configuration files (Bunches) in Finder for editing.

## Bunch Editor

Click the button to select an external editor for your Bunch files. You can hold down Command while clicking any Bunch in the menu to open its file in your editor.

