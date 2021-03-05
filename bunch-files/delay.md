---
layout: default
title: Delayed Launch
parent: Bunch Files
---
# Launching After A Delay

You can have an app, script, or command execute after a delay by adding a tilde immediately followed by a number (integer) at the end of the line. For example, to wait 5 seconds before executing an AppleScript, you would use:

    * say "I've been waiting for you" ~5

The delay only applies to the line it's on, it doesn't delay the processing of lines after it. Anything without a delay specified will launch immediately.

## Delaying Groups

You can use snippets to delay groups of items. Just put the items into a [snippet file]({{ site.baseurl }}/docs/bunch-files/snippets/) (or an [embedded snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets)) and add the tilde+number.

    < example.snippets ~5

You can also put a delay on snippets that run when the Bunch closes, triggered X seconds after closing the Bunch:

    !< example.snippets ~5

See the [Snippets]({{ site.baseurl }}/docs/bunch-files/snippets) documentation to learn how to have snippets [wait until apps have finished launching]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet).
