---
layout: default
title: Troubleshooting
nav_order: 75
---
# Troubleshooting Bunch
{:.no_toc}

* Table of Contents
{:toc}

## Debugging Bunches {#debugging}

If you're having issues with a Bunch not doing what you expected, consult the [Bunch Log]({{ site.baseurl }}/docs/using-bunch/bunch-log) to see if you can trace the issue. 

If needed, split out sections of a longer Bunch into temporary smaller Bunches and test them one at a time to narrow down any issues. Or just create one new, blank Bunch and copy one line at a time into it from the misbehaving Bunch, launching it for each now line until the behavior you're trying to avoid happens, thus narrowing it down to that line.

> If you're debugging the opening of a Bunch and have your Bunches set to toggle, you can avoid having to repeatedly close the Bunch by holding down the Option key while clicking the menu item, or by using Clear All Checkmarks, which will tell Bunch that the Bunches are closed without actually executing any on-close behaviors or quitting any apps.
{:.tip}

Also see the [`(log)` command]({{ site.baseurl }}/docs/bunch-files/commands/log/), which can be useful for pinpointing issues with variable assignment and execution sequence.

If you know which line is problematic and it doesn't make sense, post about it [in the forum]({{ site.forum }}). If it seems like a bug in Bunch, please [let me know here]({{ site.bugs }}).

## Debugging Scripts

See [Debugging Scripts]({{ site.baseurl }}/docs/integration/advanced-scripting/debugging/) in the Advanced Scripting section for tips on tracking down issues with shell scripts.

## Specific App Not Launching or Quitting {#appnames}

If you list an app to launch or quit in your Bunch and nothing happens, the app in question may have a different name in the system than it shows in Finder. First double check that the filename you're listing in your Bunch exactly matches the name of the application in Finder (minus the `.app`). If it does, and still doesn't work, there are a couple of possibilities.

The first thing to try when tracking down the name an app responds to is to open Script Editor and go to __File->Open Dictionary__ ({% kbd ⇧⌘O %}). If the app has an AppleScript dictionary, it will show up in that list with the name you _probably_ need to use to operate on it. In cases like the app Things, this will reveal that the app is actually called "Things3."

If that fails, you can locate the app in Finder (easy to do by {% kbd ⌘ %}-clicking the app icon in the Dock while it's running). Right click (ctrl-click) on the app and choose [Show Package Contents]. Inside the "Contents" folder you'll find Info.plist. Open Info.plist in your text editor and locate the CFBundleName. If it's different than the display name, try that in your Bunch.

Logic Pro is a curious beast. It needs to be called "Logic Pro X" to launch, but "Logic Pro" to quit. Bunch has a workaround for this that should allow you to safely use "Logic Pro X" without issue. I'm sure there are other weird cases I'll have to compensate for as they come up.

If all of these fail, please do leave a note on the [discussion forums]({{ site.forum }}).

## Empty Menu {#emptymenu}

If you make a change to a Bunch and suddenly your menu is empty, it means that something in the file caused Bunch to crash while reading in your Bunches. If possible, undo that change and use __Refresh Bunches__ to attempt to reload.

On rare occasions something really screwy happens and Bunch just stops reading files in the chosen directory. The solution is to change your Bunch Folder using __Bunch Folder->Set__ button in Preferences, then change it right back (it will be in the dropdown).

If these steps don't fix the issue, or the issue you're having is not mentioned heere, [see the support page]({{ site.baseurl }}/support) to get in touch.
