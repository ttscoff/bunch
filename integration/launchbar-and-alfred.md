---
layout: default
title: LaunchBar and Alfred
parent: Integration
tags: [integration]
---
# LaunchBar and Alfred

Despite Bunch having plenty of its own [keyboard shortcuts]({{ site.baseurl }}/docs/using-bunch/keyboard-control), you may want to integrate with your favorite launcher. There are existing options for doing so with both LaunchBar and Alfred.

> You can also create integrations with [Keyboard Maestro]({{ site.baseurl }}/docs/integration/keyboard-maestro/) or [BetterTouchTool]({{ site.baseurl }}/docs/integration/bettertouchtool/) to fit other workflows.
{:.tip}

## LaunchBar

Download the [Bunches Action for LaunchBar](https://cdn3.brettterpstra.com/downloads/Bunches2.0.3.zip)

I've added a LaunchBar action for Bunch. Download, unzip it, then double click the unzipped action to install. 

Selecting the Bunch action in LaunchBar and pressing return will list your available Bunches. If you have "Toggle Bunches" enabled, selecting a Bunch from the list will toggle it (quitting apps if it's already been opened), otherwise it will simply open the Bunch. Each Bunch in the menu will also have a submenu you can access by pressing the right arrow which contains the actions (open, close, toggle) that aren't the default action.

Holding modifier keys when opening the action changes the default methods for that run:

* __Ctrl__: close Bunches
* __Command__: toggle Bunches
* __Shift__: open Bunches

The menu also contains the ability to switch your opening preference between "Open" and "Toggle." This will affect your Bunch preferences directly.

If you bring up the Bunches action and press Space, you can type or paste raw Bunch commands to be executed.

See ["Better Bunch for LaunchBar"](https://brettterpstra.com/2019/06/10/better-bunch-for-launchbar/) for the latest changes to the Action.

## Alfred

Jay Miller has created [an Alfred action for use with Bunch](https://github.com/kjaymiller/Bunch_Alfred).
