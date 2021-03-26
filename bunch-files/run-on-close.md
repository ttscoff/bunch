---
layout: default
title: Run On Close
parent: Bunch Files
tags: [apps,snippets]
---
# Launching Items Only When Closing a Bunch

If you precede any of the above lines (starting with `*`, `&`, or `$`) with an exclamation point, that script will be ignored when opening a Bunch and run only when the Bunch is closed (or toggled). Here's an example that uses the same script with different arguments for open and quit:

    # Run this when opening the Bunch
    $ ~/scripts/myscript.sh open
    - STATUS=opening

    # Run this when closing the bunch
    !$ ~/scripts/myscript.sh close
    - STATUS=closing

The same works for commands. To run a command when a Bunch closes, use:

    !(hide dock)

## Launching Multiple Items on Close

You can also set an entire snippet to launch on close with the same syntax. Just use `!<snippet.name` to have the contents of that snippet or snippet fragment load when the Bunch is closed.

## Launch an App When Quitting {#doublenegative}

You can also launch apps when quitting a Bunch. This is useful if your Bunch closed some apps when launching and you'd like them restored afterward. By default Bunch doesn't relaunch apps that are quit, so you have to explicitly instruct it with `!!` (a double negative).

The following will force quit Dropbox when launching the Bunch, and then restart it when quitting.

    $ killall Dropbox
    !!Dropbox
