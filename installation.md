---
layout: default
title: Installation
nav_order: 3
---
# Download And Install

Just {% download download the DMG %} and double click it to mount. Drag the Bunch icon to the Applications folder. You can then launch Bunch from your Applications folder. (Or with Spotlight. Or [Launchbar or Alfred]({{ site.baseurl }}/docs/integration/launchbar-and-alfred). Or [the command line]({{ site.baseurl }}/docs/integration/cli). Or [AppleScript]({{ site.baseurl }}/docs/integration/applescript)...)

Run Bunch from your Applications folder. When it launches, it will appear in your menu bar (no Dock icon). All of Bunch's features are accessed by clicking the stem icon in the menu bar.

{% img aligncenter mx-auto /bunch/images/menubar-highlight.png 800 52 %}

You'll probably want Bunch to stay in your menu bar for easy access, so go ahead and launch it once, then use __Preferences->Launch at Login__ to add it to your Login Items. 

See the [configuration section]({{ site.baseurl }}/docs/bunch-files/) for instructions on personalizing the setup. Use "Reveal Bunches in Finder" to go directly to that folder and start editing/adding Bunches.

## Accessibility Permissions

To use some of Bunch's features, you'll need to give it Accessibility permission in System Preferences. During the welcome sequence, Bunch will ask you to give it permission, and provide a shortcut to opening System Preferences.

In System Preferences, go to "Security & Privacy," then select the "Accessibility" tab from the list on the left. Click the lock icon in the bottom left and unlock the preferences with your system password. If Bunch isn't already in the list, use the (+) button to add it from your Applications folder. Ensure that the checkbox next to it in the list is _checked_.

{% img aligncenter /bunch/images/accessibility.png 917 787 %}

## Additional Permissions

As Bunch attempts to control various apps and features of the operating system, you will be asked to grant Bunch permission to perform new operations. Because Bunch is all about automating other apps, your first runs will include a lot of these dialogs. Once you allow an operation, though, you won't be asked again in the future.

## Notifications

At some point you will be asked to allow Bunch to send notifications. Please enable this, as some of Bunch's error reporting is done through the Notification Center in order to allow your Bunches to run without interrupting for non-fatal errors. It's recommended that you set the notification style to "Alerts" in __System Preferences->Notifications__. There's a shortcut to this System Preferences pane in Bunch Preferences.
