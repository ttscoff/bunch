---
layout: default
title: Delayed Launch
parent: Bunch Files
tags: [delay]
---
# Launching After A Delay

You can have an app, script, or command execute after a delay by adding a tilde immediately followed by a number (integer) at the end of the line. For example, to wait 5 seconds before executing an AppleScript, you would use:

```bunch
* say "I've been waiting for you" ~5
```

The delay only applies to the line it's on, it doesn't delay the processing of lines after it. Anything without a delay specified will launch immediately.

## Delaying Groups

You can use snippets to delay groups of items. Just put the items into a [snippet file]({{ site.baseurl }}/docs/bunch-files/snippets/) (or an [embedded snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets)) and add the tilde+number.

```bunch
< example.snippets ~5
```

You can also put a delay on snippets that run when the Bunch closes, triggered X seconds after closing the Bunch:

```bunch
!< example.snippets ~5
```

See the [Snippets]({{ site.baseurl }}/docs/bunch-files/snippets) documentation to learn how to have snippets [wait until apps have finished launching]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet).

## Delay Command

You can also insert delays as commands. This only works when the Bunch's [execution sequence](,,{{ site.baseurl }}/docs/bunch-files/sequence/) is set to sequential (or Parallel execution is [disabled entirely in Preferences](,,{{ site.baseurl }}/docs/using-bunch/preferences/#prefsbunchbehavior)).

To pause a Bunch before opening remaining items, use `(pause X)`, where X is a number of seconds to wait (must be a whole, positive integer). You can also use `(delay X)`, which is a synonym for pause.

```bunch
Affinity Publisher
(pause 15)
& MyWorkflow
```

This will launch Affinity Publisher, then wait 15 seconds. The Bunch menu will be inaccessible during this time, but Affinity Publisher (and any apps/scripts/commands before the pause command) will continue to launch. After 15 seconds, processing will continue, starting with the execution of `MyWorkflow`.

You can also insert pauses [between file lines]({{ site.baseurl }}/docs/bunch-files/apps/#filepause):

```bunch
TextEdit
- My first file.txt
- [type some stuff]
- (delay 5)
- My second file.txt
```

