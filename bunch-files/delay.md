---
layout: default
title: Delayed Launch
parent: Bunch Files
---
# Launching After A Delay

You can have an app, script, or command execute after a delay by adding a tilde immediately followed by a number (integer) at the end of the line. For example, to wait 5 seconds before executing an AppleScript, you would use:

    * say "I've been waiting for you" ~5

The delay only applies to the line it's on, it doesn't delay the processing of lines after it. Anything without a delay specified will launch immediately.
