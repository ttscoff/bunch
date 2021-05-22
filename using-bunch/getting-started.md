---
layout: default
title: Getting Started
parent: Using Bunch
nav_order: 20
tags: [preferences,basics]
---
# Getting Started With Bunch

First, you need some Bunch files located in [your Bunch folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder). There's an example one in there, so go ahead and get started by editing that. See the [Bunch Files]({{ site.baseurl }}/docs/bunch-files) section to learn all about the syntax and features.

Once you have one or more `.bunch` files in your Bunch folder they should show up automatically when you open the Bunch menu by clicking the Bunch icon in the menu bar. Select a Bunch in the menu to perform the actions defined in that Bunch file.

{% gif /images/menubarclick.gif %}

If "Toggle Bunches" is enabled in Preferences, each Bunch gets a circle indicator on the left. When a Bunch is opened its indicator is filled in, indicating it's open. Selecting an open Bunch will "toggle" the Bunch, quitting any apps it launched (if they're running and not open in other Bunches), restoring commands, and running any [On-Close items]({{ site.baseurl }}/docs/bunch-files/run-on-close).

If "Single Bunch Mode" is enabled, clicking a closed Bunch will close the previous Bunch before opening it.

If neither "Toggle Bunches" nor "Single Bunch Mode" is enabled, clicking a Bunch will always launch the apps and commands in the Bunch, or bring them to front if they're already running.

## Create Your First Bunch

The first time you run Bunch, a Bunch Folder will be created in your Documents folder. You can change this location, but you probably won't need to. See [The Bunch Folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder) for more information.

The Bunch folder contains Bunch files, also called "Bunches." A Bunch file is just a plain text file with the extension `.bunch`. You can edit them in TextEdit (in plain text mode, ___not Rich Text___), or in any plain text editor such as VS Code, Sublime Text, or any Markdown editor.

> Bunch files absolutely require the extension `.bunch`. If you have macOS set to hide extensions, it may be assigning another extension in addition to `.bunch` (e.g. `.bunch.txt`). If your Bunches aren't showing up in the menu, open Finder Preferences and check "Show all filename extensions" to double check.
> 
> {% img aligncenter /images/showextensions.jpg 412 158 %}
{:.warning}

Each Bunch is a separate file, and the name of the Bunch will be taken from the filename (without the `.bunch` extension). Once you've added your own configuration(s), delete the `Example.bunch` file (or rename it with an extension other than `.bunch`).

The fastest way to create a simple Bunch is to open the apps you want your Bunch to launch and choose "New Bunch With Open Apps" from the [Bunch menu]({{ site.baseurl }}/docs/using-bunch/menu). Your new Bunch will show up in the menu immediately, ready to try out. Opening and closing this new Bunch will launch and quit all of the apps listed in it. You can edit this file to remove apps you don't want affected, or prefix lines with `%` to indicate they [should be ignored]({{ site.baseurl }}/docs/bunch-files/apps/#ignoring) when closing; the Bunch will launch them when it opens, but not quit them when it closes.

Bunch can do much more than just launch apps, though. Take some time to explore [all of the possibilities]({{ site.baseurl }}/docs/bunch-files). You don't have to learn it all, you can just look up how to do something as you need it. The [Syntax Reference]({{ site.baseurl }}/docs/bunch-files/quick-reference) offers quick reminders for how to accomplish most tasks in a Bunch.
