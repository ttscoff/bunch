---
layout: default
title: Getting Started
parent: Using Bunch
nav_order: 20
tags: [preferences,basics]
---
# Getting Started With Bunch

Once you've gotten acquainted with [Bunch Preferences]({{ site.baseurl }}/docs/using-bunch/preferences/), it's time to start using Bunch.

## Create Your First Bunch

The first time you run Bunch, a Bunch Folder will be created in your Documents folder. You can change this location, but you probably won't need to. See [The Bunch Folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder) for more information.

By default this folder is __~/Documents/Bunches__. To get to it quickly, you can open Preferences and click "Reveal" next to the Bunch Folder setting.

The Bunch folder contains Bunch files, also called "Bunches." A Bunch file is just a plain text file with the extension `.bunch`. You can edit them in TextEdit (in plain text mode, ___not Rich Text___), in any plain text editor such as VS Code or Sublime Text, or in any Markdown editor.

> __If using TextEdit__, make sure it's in Plain Text mode for the current file by opening the __Format__ menu and selecting __Make Plain Text__ if that option is showing. If it says __Make Rich Text__, you're already in plain text mode.
{:.warning}

Each Bunch is a separate file, and the name of the Bunch will be taken from the filename, without the `.bunch` extension. (You can specify a separate "display name" for the menu item in [Frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/), but we'll get to that later.)

You can edit `Example.bunch` in your Bunch Folder to see what happens, or just use it as a reference for creating a new file. Bunch files just have to be plain text with the extension `.bunch`. Once you've added your own configuration(s), delete `Example.bunch` (or rename it with an extension other than `.bunch`).

> Bunch files absolutely require the extension `.bunch`. If you have macOS set to hide extensions, it may be assigning another extension in addition to `.bunch` (e.g. `.bunch.txt`). If your Bunches aren't showing up in the menu, open Finder Preferences and check "Show all filename extensions" to double check.
>
> {% img aligncenter /images/showextensions.jpg 412 158 %}
{:.tip}

See the [Bunch Files]({{ site.baseurl }}/docs/bunch-files) section to learn all about the syntax and features. All of the basic syntax can be found in the [Syntax Guide]({{ site.baseurl }}/docs/bunch-files/quick-reference/) for quick reference.

### New Bunch With Open Apps

The fastest way to create a simple Bunch is to open the apps you want your Bunch to launch and choose "New Bunch With Open Apps" from the [Bunch menu]({{ site.baseurl }}/docs/using-bunch/menu). Your new Bunch will show up in the menu immediately, ready to try out. Opening and closing this new Bunch will launch and quit all of the apps listed in it. You can edit this file to remove apps you don't want affected, or prefix lines with `%` to indicate they [should be ignored]({{ site.baseurl }}/docs/bunch-files/apps/#ignoring) when closing; the Bunch will launch them when it opens, but not quit them when it closes.

Bunch can do much more than just launch apps, though. Take some time to explore [all of the possibilities]({{ site.baseurl }}/docs/bunch-files). You don't have to learn it all, you can just look up how to do something as you need it. The [Syntax Reference]({{ site.baseurl }}/docs/bunch-files/quick-reference) offers quick reminders for how to accomplish most tasks in a Bunch.

## Using Your Bunches

Once you have one or more `.bunch` files in your Bunch folder they should show up automatically when you open the Bunch menu by clicking the Bunch icon in the menu bar. Select a Bunch in the menu to perform the actions defined in that Bunch file.

{% hovergif /images/menubarclick.mp4 "Animation of the Bunch menu item being clicked" %}

If "Toggle Bunches" is enabled in Preferences, each Bunch gets a circle indicator on the left. When a Bunch is opened its indicator is filled in, indicating it's open. Selecting an open Bunch will "toggle" the Bunch, quitting any apps it launched (if they're running and not open in other Bunches), restoring commands, and running any [On-Close items]({{ site.baseurl }}/docs/bunch-files/run-on-close).

See the [Bunch Menu]({{ site.baseurl }}/docs/using-bunch/menu/) page for more details and special features.

If "Single Bunch Mode" is enabled, clicking a closed Bunch will close the previous Bunch before opening it.

If neither "Toggle Bunches" nor "Single Bunch Mode" is enabled, clicking a Bunch will always launch the apps and commands in the Bunch, or bring them to front if they're already running.
