---
layout: default
title: Preferences
parent: Using Bunch
nav_order: 10
tags: [preferences]
---
# Bunch Preferences

Click the Bunch icon in the menu bar and select __Preferences...__.

{% img aligncenter mx-auto /bunch/images/BunchPreferences.png 527 366 "Bunch Preference Pane" "Preference Pane Screenshot" %}

## Application Settings

Launch at Login
: Add and remove Bunch from your User Login Items.

Remember Open Bunches
: If this option is enabled, any Bunches you had open when Bunch was quit (or terminated) will be reloaded when Bunch is relaunched. If an open Bunch is also part of a [startup script]({{ site.baseurl }}/docs/bunch-files/startup-scripts/), it will be ignored by this option as it will launch anyway.

Hotkey
: You can assign a global shortcut by clicking in the hotkey field and then pressing your desired key combination. When pressed while using any application, it will display the Bunch menu, allowing you to use [keyboard shortcuts]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts) to launch your Bunches.

Accessibility
: Bunch requires Accessibility permission to be granted to perform some of its functions. If permission isn't granted, you can click this button to open the appropriate Security pane in System Preferences.

Notification Settings
: This is a shortcut to opening Bunch's notification settings in System Preferences. It's recommended that you enable notifications and set the notification style to "Alerts," which will allow Bunch to most conveniently provide status reports.

## Bunch Behavior

Toggle Bunches
: When this is enabled, running bunches are shown with a checkmark in the menu, and clicking them again will quit apps contained in that bunch instead of relaunching them.
: It's recommended that you turn this setting on. Bunches can do different things when opening and closing and if you can't toggle, you can't easily close a Bunch. You can always use `toggles: false` [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/) to override this setting on a per-Bunch basis.

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

## Copy UUID

This copies a unique identifier for the current Mac to your clipboard. This can be used in `startup` and `schedule if` frontmatter to only [run as startup]({{ site.baseurl }}/docs/bunch-files/startup-scripts/) or [add schedules]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/#selective) on the current Mac. This is useful if you run Bunch on multiple machines and sync your Bunch folder.

