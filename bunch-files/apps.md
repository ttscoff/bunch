---
layout: default
title: Apps
parent: Bunch Files
nav_order: 4
tags: [apps,screen,launch,file]
---
# Application Actions
{:.no_toc}

* Table of Contents
{:toc}

## Launching Apps {#launchingapps}

Within a Bunch file you simply list the apps you want it to launch, one per line. For example, in "Comms.bunch":

```bunch
Messages
Slack
Mail
Twitter
```

You can add additional lines to perform actions like [opening files](#opening-files).

If the app in question is not responding, see the troubleshooting section on [App Names]({{ site.baseurl }}/docs/troubleshooting#appnames).

## Opening Files

You can additionally have an app open specific documents, if the app supports that. After the app name, simply add one or more documents on lines that begin with a dash. For example, to have Numbers open two specific spreadsheets:

```bunch
Numbers
- ~/Documents/job 1.numbers
- ~/Documents/job 2.numbers
```

> Paths to documents can use a tilde `~` to represent the home directory. Spaces are fine, no quotes or escaping needed.
{:.tip}

You may want to close all open windows before opening new files. To do that, [use XX](#closingwindows)

```bunch
Numbers
- XX
- ~/Documents/job 1.numbers
```

You can also specify a file as a URL to have Bunch open it in whatever app is defined as the default handler for it. For example, if you put the following on its own line, Bunch would open TaskPaper\* with the file (note that spaces are replaced with `%20`):

```bunch
file:///Users/Dropbox/Code/Bunch%20Work/bunch.taskpaper
```

This is the same as specifying "default" as the app (see [below](#defaultapp)).

_\* This assumes TaskPaper is installed._

### Opening Finder Tabs {#findertabs}

There's a special syntax that currently only applies to Finder. If you want multiple folders to open in tabs, list the first folder on a normal file line, then the other folders that should open in the same window with `->` preceding them:

```bunch
Finder
- ~/Desktop
-> ~/Documents
-> ~/Pictures
```

You can open multiple windows by starting a new line without the `>`. The following will open two windows with two tabs each:

```bunch
Finder
- ~/Desktop
-> ~/Documents
- /Volumes/SSDDrive
-> /Volumes/OtherDrive
```

> For reasons I can't explain, doing this via System Events is exceedingly slow. This process will run in the background and it's OK to click other windows while waiting for the Finder tabs to finish opening.
{:.warning}

## Opening Files in Their Default Application {#defaultapp}

You can just put the word "Default" on a line before some file lines, and it will open all of those files in whatever app is assigned as the default on your system. PDFs might open in Preview or PDFpen, Pages files would open in Pages, etc.

```bunch
Default
- File 1.pages
- File 2.numbers
- File 3.md
```

This is especially handy when using [Spotlight searches]({{ site.baseurl }}/docs/bunch-files/spotlight-searches) instead of files.

### Inserting a Pause {#filepause}

You can pause between files by inserting a file line containing `(pause 5)` (for a 5 second pause). The number must be a positive integer representing a number of seconds, with no letters or decimals. This is mostly useful if you want to send keystrokes or wait for a URL to load between actions.

```bunch
TextEdit
- ~/Documents/file1.txt
- (pause 5)
- ~/Documents/file2.txt
```

## Closing Windows {#closingwindows}

If you include a file line containing only "XX", then all windows for the app will be closed. This can be included before lines that open new files/windows to start with a clean slate.

```bunch
Finder
- XX
- ~/Desktop/
```

> This will only work if the app responds to the AppleScript command `close every window.` Most apps do, but there are exceptions. A warning dialog will be displayed if the command fails and you should remove the instruction from your Bunch.
{:.tip}

## Hiding Apps {#hidingapps}

If you use "@@" alone on a line, Bunch will hide all visible apps. (Menu bar apps like Dash or TextExpander may not hide properly.) This is ideal for use at the very beginning of a Bunch, giving you a clean slate for a new set of apps.

Note that a windowed app in the foreground when you run the Bunch will likely fail to hide. The better option is to [focus](#focus) one of the apps that the Bunch launches.

> You can also append an underscore to any single app name and Bunch will attempt to hide it after launching. (This can be flaky depending on how long the app takes to launch.)
{:.tip}

## Activating Apps {#activatingapps}

By default apps will launch without activating, meaning that if the app allows it, it won't become the foreground app when it launches, keeping focus on whatever app you're working in. If the app is already running, it won't activate, and if it's hidden, it will remain hidden.

To force an app to become foreground (and unhide if hidden), append a caret (^) to the app name.

```bunch
Visual Studio Code^
```

## "Focusing" an App {#focus}

If you start an app line with an `@` symbol, it will attempt to focus that app. This should be run as the last line of the file, after all other lines have run. Make sure the app you want to focus has already been launched (_this line will not launch the app, only focus a running app_).

```bunch
OmniFocus
MultiMarkdown Composer
@OmniFocus
```

Everything is launched in the order listed in the Bunch file. Some apps take longer than others to launch or open a file, so execution will continue in the background after the initial launch of the app.

If an app is still launching at the time another app is focused, windows from the slower app may appear after other windows are hidden. To ensure that the app you want focused remains the only app visible, you can add a delay to the focus command. Make it just long enough for other apps to finish launching.

```bunch
@Omnifocus ~5
```

As an alternative to hiding and focusing apps, see the [`screen` command]({{ site.baseurl }}/docs/bunch-files/commands/screen/).

## Quitting Apps {#quitting}

Put an exclamation point before the app name to quit that app if it's open.  For example, to quit Mail and launch MailMate instead:

```bunch
!Mail
MailMate
```

You can also have apps [launch when closing the Bunch]({{ site.baseurl }}/docs/bunch-files/run-on-close/#doublenegative).

If the app in question is not responding, see the troubleshooting section on [App Names]({{ site.baseurl }}/docs/troubleshooting#appnames).

## Ignoring apps/commands on close {#ignoring}

When you close a Bunch (or "Toggle Bunches" or "Single Bunch Mode" are enabled), any apps launched by the Bunch will be quit. To avoid quitting an app when the Bunch is closed or toggled off, place a percent symbol before it in the Bunch (e.g. `%iTerm`). This will launch the app as normal, but ignore it when closing the Bunch.

```bunch
%iTerm
CodeRunner
```

In this example, CodeRunner will launch and quit with the Bunch, but iTerm will only launch if it's not already running, and will remain running if the Bunch is closed.

> If an app is called multiple times in a Bunch (perhaps to focus it or send keystrokes to it after another app has launched), only one instance needs to be marked with `%` to avoid closing the app. Once an app is marked as "ignore on close" at any point in the Bunch, it won't be quit when the Bunch closes.
{:.tip}

This works for commands as well:

```bunch
%(dark mode)
```

This will enable Dark Mode when opening the Bunch, and leave it in Dark Mode when closing.

> Finder is always ignored (won't be quit) when closing a Bunch. If you want to actually quit Finder when closing a Bunch, use a [triple negative]({{ site.baseurl }}/docs/bunch-files/run-on-close/#triplenegative):
>
> ```bunch
> Finder
> - ~/Desktop
> !!!Finder
> ```
{:.tip}
