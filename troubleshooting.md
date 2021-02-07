---
layout: default
title: Troubleshooting
nav_order: 75
---
## Debugging Bunches {#debugging}

If you're having issues with a Bunch not doing what you expected, consult the [Bunch Log]({{ site.baseurl }}/docs/using-bunch/bunch-log) to see if you can trace the issue. 

If needed, split out sections of a longer Bunch into temporary smaller Bunches and test them one at a time to narrow down any issues. Or just create one new, blank Bunch and copy one line at a time into it from the misbehaving Bunch, launching it for each now line until the behavior you're trying to avoid happens, thus narrowing it down to that line.

> If you're debugging the opening of a Bunch and have your Bunches set to toggle, you can avoid having to repeatedly close the Bunch by Option-clicking it in the menu, or by using Clear All Checkmarks, which will tell Bunch that the Bunches are closed without actually executing any on-close behaviors or quitting any apps.
{:.tip}

If you know which line is problematic and it doesn't make sense, post about it [in the forum]({{ site.forum }}). If it seems like a bug in Bunch, please [let me know here]({{ site.bugs }}).

## Specific App Not Launching or Quitting {#appnames}

If you list an app to launch or quit in your Bunch and nothing happens, the app in question may have a different name in the system than it shows in Finder. 

The first thing to try when tracking down the name an app responds to is to open Script Editor and go to __File->Open Dictionary__ (<kbd>⇧⌘O</kbd>). If the app has an AppleScript dictionary, it will show up in that list with the name you need to use to operate on it.

If that fails, you can locate the app in Finder (easy to do by <kbd>⌘</kbd>-clicking the app icon in the Dock while it's running). Right click (ctrl-click) on the app and choose [Show Package Contents]. Inside the "Contents" folder you'll find Info.plist. Open Info.plist in your text editor and locate the CFBundleName. If it's different than the display name, try that in your Bunch.

If all of these fail, please do leave a note on the [discussion forums]({{ site.forum }}).

## Empty Menu {#emptymenu}

If you make a change to a Bunch and suddenly your menu is empty, it means that something in the file caused Bunch to crash while reading in your Bunches. If possible, undo that change and use __Preferences->Refresh Bunches__ to attempt to reload.

On rare occasions something really screwy happens and Bunch just stops reading files in the chosen directory. The solution is to change your Bunches Folder using __Preferences->Change Bunches Folder__, then change it right back.

If these steps don't fix the issue, or the issue you're having is not mentioned here, [see the support page]({{ site.baseurl }}/docs/support) to get in touch.
