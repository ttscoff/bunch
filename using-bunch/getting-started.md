---
layout: default
title: Getting Started
parent: Using Bunch
nav_order: 10
---
### Terminology

For the purposes of this documentation, here are some definitions:

Bunch
: The name of the app, but also singular reference to a file containing a plain text list of collection of apps, commands, and scripts it will launch. The latter is also referred to as a "Bunch File."

Bunch Folder
: The folder where your collection of Bunch files is stored.

Bunch Items
: Bunch Items are lines in a Bunch file, whether launching an app, running a script, or executing a command.

Snippet
: A snippet is a file in the Bunch folder that has any extension other than `.bunch`. It can contain anything a Bunch can, and can be included from within a Bunch to allow sharing of common tasks between Bunches. Snippets are also used to allow interactivity, delayed execution, and other fun stuff.

Open/Closed
: Bunches are either "opened" or "closed," and take different actions depending on the action. Closing a Bunch has a different meaning than "quitting," so I'll do my best not to refer to opening a Bunch as launching, or closing a Bunch as quitting it.

Quit/Launched
: Apps are "launched" and "quit" (or terminated). These are commands that can happen when a Bunch is open or closed, but they always refer to applications.


### Set Your Preferences

To make the most of Bunch, you'll want to set some [Preferences]({{ site.baseurl }}/docs/using-bunch/preferences). Most importantly, choose to run Bunch in the Dock or the menu bar, and whether Bunches toggle open and closed. My personal recommendation is to run Bunch in the menu bar, and have "Toggle Bunches" turned on.

### Create Your First Bunch

The first time you run Bunch, a Bunch Folder will be created in your Documents folder. You can change this location, but you probably won't need to. See [The Bunch Folder]({{ site.baseurl }}/docs/bunch-files/bunch-folder) for more information.

The Bunch folder contains Bunch files, also called "Bunches." A Bunch file is just a plain text file with the extension `.bunch`. You can edit them in TextEdit (in plain text mode, not Rich Text), or in any text editor.

Each Bunch is a separate file, and the name of the Bunch will be taken from the filename (without the `.bunch` extension). Once you've added your own configuration(s), delete the `Example.bunch` file (or rename it with an extension other than `.bunch`).

The fastest way to create a simple Bunch is to open the apps you want your Bunch to launch and choose "New Bunch With Open Apps" from the [Bunch menu]({{ site.baseurl }}/docs/using-bunch/menu). Your new Bunch will show up in the menu immediately, ready to try out. Opening and closing this new Bunch will open and close all of the apps listed in it.

But Bunch can do much more than just launch apps. Take some time to explore [all of the possibilities]({{ site.baseurl }}/docs/bunch-files). You don't have to learn it all, you can just look up how to do something as you need it. The [Syntax Reference]({{ site.baseurl }}/docs/bunch-files/quick-reference) offers quick reminders for how to accomplish most tasks in a Bunch.
