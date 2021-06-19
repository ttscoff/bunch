---
layout: default
title: Run On Close
parent: Bunch Files
tags: [apps,snippets]
---
# Running Scripts Only When Closing a Bunch

If you precede any script lines (starting with `*`, `&`, or `$`) with an exclamation point, that script will be ignored when opening a Bunch and instead run only when the Bunch is closed. Here's an example that uses the same script with different arguments for open and quit:

```bunch
# Run this when opening the Bunch
$ ~/scripts/myscript.sh open
- STATUS=opening

# Run this when closing the bunch
!$ ~/scripts/myscript.sh close
- STATUS=closing
```

The same works for commands. To run a command when a Bunch closes, use:

```bunch
!(hide dock)
```

## Launching Multiple Items on Close

You can also set an entire [snippet]({{ site.baseurl }}/docs/bunch-files/snippets/) to open when the Bunch closes using the same syntax. Just use `!<snippet.name` to have the contents of that snippet or snippet fragment load when the Bunch is closed.

```bunch
!<<#On Close
___
#[On Close]
Tweetbot
Messages
* tell application "Moom" to arrange windows according to snapshot "Comms"
```

## Launch an App When Closing {#doublenegative}

Note that in the case of apps, a single exclamation point (`!AppName`) quits the app rather than performing an action on close. Bunch doesn't automatically relaunch apps that are quit this way; you have to explicitly instruct it with `!!` (a double negative).

The following will force quit Dropbox when opening the Bunch, and then restart it when closing.

```bunch
$ killall Dropbox
!!Dropbox
```

To quit Twitter when opening the Bunch, then re-launch it on close:

```bunch
!Twitter
!!Twitter
```

## Quit an App When Closing {#triplenegative}

Normally an app launched by a Bunch would quit when the Bunch closes (unless ignored with `%`). You can also specify that an app should quit when closing a Bunch --- without having to launch it first --- by using `!!!AppName`. If the app is running, it will be quit when the Bunch closes, but the item will have no effect when opening the Bunch.

```bunch
// Slack is quit when this Bunch is closing
!!!Slack
```

This can be useful as a workaround when an app like FileMaker Pro Advanced or Visual Studio Code will launch with one name, but needs another to quit. In the case of FileMaker, you would use:

```bunch
FileMaker Pro 18 Advanced
!!!FileMaker Pro Advanced
```

(The specific cases of FileMaker and VS Code are handled automatically by Bunch, but there will almost certainly be other examples of this where you'll need to manually specify.)
