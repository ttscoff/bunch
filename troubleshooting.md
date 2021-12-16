---
layout: default
title: Troubleshooting
nav_order: 90
tags: [error,debug,log,problem]
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

## Debugging Scripts {#scripts}

See [Debugging Scripts]({{ site.baseurl }}/docs/integration/advanced-scripting/debugging/) in the Advanced Scripting section for tips on tracking down issues with shell scripts.

## Specific App Not Launching or Quitting {#appnames}

If you list an app to launch or quit in your Bunch and nothing happens, the app in question may have a different name in the system than it shows in Finder. First double check that the filename you're listing in your Bunch exactly matches the name of the application in Finder (minus the `.app`). If it does, and still doesn't work, there are a couple of possibilities.

### Finding a "Registered" Name

The first thing to try when tracking down the name an app responds to is to open Script Editor and go to __File->Open Dictionary__ ({% kbd ⇧⌘O %}). If the app has an AppleScript dictionary, it will show up in that list with the name you _probably_ need to use to operate on it. In cases like the app Things, this will reveal that the app is actually called "Things3."

### Getting an App's "Real" Name

#### Method 1: From Finder

If that fails, you can locate the app in Finder (easy to do by {% kbd ⌘ %}-clicking the app icon in the Dock while it's running). Right click (CTRL-click) on the app and choose [Show Package Contents]. Inside the "Contents" folder you'll find `Info.plist`.

If `Info.plist` is in text format (they usually are), you can open it in your text editor and locate the key `CFBundleName`. If it's different than the display name, try that in your Bunch.

```
  [...]
  <key>CFBundleName</key>
  <string>Google Chrome</string>
  [...]
```

If `Info.plist` is in binary format (which will be obvious when you try to open it in your text editor), you'll need to use Terminal to get the info you're looking for.

#### Method 2: From Terminal

Open Terminal and enter the following command, substituting `[App Name]` with the actual application name. If the app is not located in `/Applications`, you'll need to correct that part of the path as well.

```bash
mdls -name kMDItemDisplayName -r "/Applications/[App Name].app"
```

### Using the Bundle Identifier {#bundleid}

You can also use an app's bundle identifier instead of the app name. Use the steps above to read the app's info, but look for the `CFBundleIdentifier` key instead.

```bash
mdls -name kMDItemCFBundleIdentifier -r "/Applications/[App Name].app"
```

This is the bundle identifier, and is a string that looks kind of like a URL. For example, Bunch's bundle identifier is `com.brettterpstra.Bunch`. If you use the bundle id instead of the app name, it can help Bunch clarify instances where the app responds to a different name than the app's filename.

If all of these fail, please do leave a note on the [discussion forums]({{ site.forum }}).

### Known Exceptions

> In cases where an app responds to one name when launching but needs a different name to quit the running application (such as those detailed below), you can use a [triple negative]({{ site.baseurl }}/docs/bunch-files/run-on-close/#triplenegative) to quit an app using a different name when closing.
>
> ```bunch
> %FileMaker Pro 18 Advanced
> !!!FileMaker Pro Advanced
> ```
{:.tip}

#### Coherence X

Single Site Browser's created using [Coherence X](https://www.bzgapps.com/buycoherence) suffer all kinds of problems in Bunch. They can't be launched if Chrome is running, you can't launch more than one, and once they're launched, quitting them is hit and miss, depending on what else is running. This is because they launch multiple instances of Chrome that NSWorkspace can't identify as separate applications.

As of v1.4.1, Bunch has a built-in workaround for this. You need to refer to the applications by their bundle identifier. This will usually be `com.BZG.Coherence[Name of App]`, but sometimes (for reasons I'm unclear on) is just `com.[Name of App]`. So for an app called MindMeister, the bundle id would be `com.BZG.CoherenceMindMeister`, or possibly `com.MindMeister`. Try both, or see ["Using the Bundle Identifier"](#bundleid) to track it down yourself.

If you use the correct bundle id instead of the app name in your Bunch, the app should be able to launch and quit, regardless of whether Chrome/Brave/Canary is running.

```bunch
// Doesn't work
MindMeister
// Does work
com.BZG.CoherenceMindMeister
```

#### Logic Pro (X)

__Logic Pro__ is a curious beast. It needs to be called "Logic Pro X" to launch, but "Logic Pro" to quit. Bunch has a workaround for this that should allow you to safely use "Logic Pro X" without issue.

#### Visual Studio Code

"__Visual Studio Code__" has the same issue as Logic above. Bunch has a hard coded workaround for VS Code that should allow you to safely use "Visual Studio Code" as the app name.

#### FileMaker Pro Advanced

You can launch the current version with `FileMaker Pro 18 Advanced`, but Bunch can't quit using the same name. If you use `FileMaker Pro Advanced`, Bunch will be able to quit it if it's already running, but won't be able to launch it.

In this case Bunch attempts to remove the number from the name when trying to quit the app, so use the numbered version in your Bunch, e.g. `FileMaker Pro 18 Advanced` or `FileMaker Pro 18`.

## Empty Menu or A Bunch Not Appearing {#emptymenu}

__Bunch files absolutely require the extension `.bunch`.__ If you have macOS set to hide extensions, it may be assigning another extension in addition to `.bunch` (e.g. `.bunch.txt`). If a Bunch isn't showing up in the menu, open Finder Preferences and check "Show all filename extensions" to double check.

{% img aligncenter /images/showextensions.jpg 412 158 %}

__Make sure your Bunch is plain text.__ If you edit in TextEdit or another Rich Text capable editor, the file may get saved as rich text. Switch to plain text mode and re-save the Bunch (double checking that it still has the `.bunch` extension).

If you make a change to a Bunch and __suddenly your menu is empty__, it means that something in the file caused Bunch to choke while reading in your Bunches. If possible, undo the last change and use __Refresh Bunches__ to attempt to reload.

On rare occasions something really screwy happens and Bunch just stops reading files in the chosen directory. The solution is to change your Bunch Folder using __Bunch Folder->Add__ button in Preferences, then change it right back (it will be in the dropdown).

If these steps don't fix the issue, or the issue you're having is not mentioned here, [see the support page]({{ site.baseurl }}/support) to get in touch.

## Hiding Bunch With Bartender {#bartender}

If you use [Bartender](https://www.macbartender.com/) to hide the Bunch menu item, you may get weird results when triggering Bunch using the [global hotkey]({{ site.baseurl }}/docs/using-bunch/preferences/#application-settings) (menu appearing offscreen, on secondary displays, etc.). To resolve this, disable the global hotkey in Bunch and add a hotkey for the menu item in Bartender settings (Bartender 4+)

1. Disable Bunch's global shortcut in Preferences
1. Open Bartender Preferences and select the Hot Keys pane
2. Click the "Add menu bar item hot key" button at the bottom of the window
3. Select Bunch from the list of menu items
4. Press your desired shortcut key and ensure that the action is set to Left Click.

Now when you hit your shortcut key, the Bunch menu item should be made visible momentarily before displaying the menu. Shortcuts for individual Bunches should work as expected once the menu is displayed.