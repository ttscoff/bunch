---
layout: default
title: Getting Started
parent: Using Bunch
nav_order: 10
tags: [preferences]
---
### Set Your Preferences

To make the most of Bunch, you'll want to set some [Preferences]({{ site.baseurl }}/docs/using-bunch/preferences). Choose whether Bunches toggle open and closed, and whether opening a Bunch closes other Bunches. My personal recommendation is to turn "Toggle Bunches" on, and leave "Single Bunch Mode" off until you've explored a bit.

### Terminology

For the purposes of this documentation, here are some definitions:

Bunch
: The name of the app, but also a singular reference to a file containing a plain text list of apps, commands, and scripts it will launch. The latter is also referred to as a "Bunch File."

Bunch Folder
: The folder where your collection of Bunch files is stored.

Bunch Items
: Bunch Items are lines in a Bunch file, whether launching an app, running a script, or executing a command. This is a generic term for referencing all of the types below.

Open/Closed
: Bunches are either "opened" or "closed," and perform different tasks depending on the action. Closing a Bunch has a different meaning than "quitting," so I'll do my best not to refer to opening a Bunch as launching, or closing a Bunch as quitting it.

Quit/Launched
: Apps and scripts are "launched" and "quit" (or terminated) by Bunches when they open or close.

App Items
: App Items are lines in a Bunch file that launch an app. They start at the left margin, and the only characters that precede them are special characters like `!`, `%`, or `@` which affect the behavior of the app (like ignoring it when quitting, or focusing the app and hiding others after launching it).

Command Items
: Command Items are lines surrounded in parentheses. They perform tasks provided by Bunch, such as sending notifications, turning on Do Not Disturb, or sleeping your computer. Like App Items, they start against the left margin.

Script Items
: Script items start with a special character that indicates what type of script to run. Shell scripts start with `$`, AppleScripts start with `*`, and Automator Workflows start with `&`. Shell and AppleScript lines can run either script files or run commands directly.

File Items
: File Items are lines that come after an App Item that perform actions (like opening files or sending keystrokes) in the App Item that precedes them. Multiple File Items can come after a single App Item. These can also be used after Script Items to pass environment variables to the script.

Snippet
: A snippet is a file in the Bunch folder that has any extension other than `.bunch`. It can contain anything a Bunch can, and can be included from within a Bunch to allow sharing of common tasks between Bunches. Snippets are also used to allow interactivity, delayed execution, and other fun stuff.

### Create Your First Bunch

The first time you run Bunch, a Bunch Folder will be created in your Documents folder. You can change this location, but you probably won't need to. See [The Bunch Folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder) for more information.

The Bunch folder contains Bunch files, also called "Bunches." A Bunch file is just a plain text file with the extension `.bunch`. You can edit them in TextEdit (in plain text mode, not Rich Text), or in any text editor.

Each Bunch is a separate file, and the name of the Bunch will be taken from the filename (without the `.bunch` extension). Once you've added your own configuration(s), delete the `Example.bunch` file (or rename it with an extension other than `.bunch`).

The fastest way to create a simple Bunch is to open the apps you want your Bunch to launch and choose "New Bunch With Open Apps" from the [Bunch menu]({{ site.baseurl }}/docs/using-bunch/menu). Your new Bunch will show up in the menu immediately, ready to try out. Opening and closing this new Bunch will launch and quit all of the apps listed in it. You can edit this file to remove apps you don't want affected, or prefix lines with `%` to indicate they [should be ignored]({{ site.baseurl }}/docs/bunch-files/apps/#ignoring) when closing; the Bunch will launch them when it opens, but not quit them when it closes.

Bunch can do much more than just launch apps, though. Take some time to explore [all of the possibilities]({{ site.baseurl }}/docs/bunch-files). You don't have to learn it all, you can just look up how to do something as you need it. The [Syntax Reference]({{ site.baseurl }}/docs/bunch-files/quick-reference) offers quick reminders for how to accomplish most tasks in a Bunch.
