---
layout: default
title: Task Managers
parent: Integration
tags: [integration]
---
# Using Bunch With Your Task Manager

You can use Bunch's URL scheme with any app that allows clickable links. Whether you use TaskPaper, Things, OmniFocus, or something else, this means you can add a link to any to-do item that launches relevant applications.

When you call a Bunch URL, you can pass frontmatter keys to it that populate variables in your Bunches. This means that two links to the same Bunch can do different things, just by changing the parameters. You can pass a filename, a project name, etc., and have the Bunch customized for that particular to-do item.

Here's an example. You have an Audio Editing Bunch that you use when new audio files appear in your Dropbox. It loads your editor, but you need a different file every time. Your Bunch could be set up like this:

```bunch
---
title: Audio Editing
---
Fission
- ${audiofile}
```

If you load this Bunch normally, it will open Fission, it just won't open a specific file. But if the `audiofile` gets assigned, Fission can open the appropriate file immediately. When calling the Bunch from the URL handler, just add `&audiofile=/path/to/your audio file.mp3` to the URL:

	x-bunch://open?bunch=Audio%20Editing&audiofile=~/Dropbox/Inbox/new%20audio.mp3

With a little Hazel scripting, you can have an inbox folder in Dropbox watch for new files, and when they appear, a to-do item gets added to your task manager with a link to open that specific file in your audio editor.

You could also skip the task manager and [have Hazel open the Bunch immediately]({{ site.baseurl }}/docs/integration/hazel/), passing the new filename as a parameter.

