---
layout: default
title: Running AppleScript
parent: Running Scripts
grand_parent: Bunch Files
tags: [scripts,applescript]
---
# Running AppleScript

There are several ways to use AppleScript within Bunch.

## Running a Single AppleScript Command

Put a `*` at the beginning of a line to have the line interpreted as raw AppleScript. There will be some permissions requests and some commands that just refuse to run, but try it out. You can open Console.app to see any errors that your command might run into. This feature is only *marginally tested*.

```bunch
* say "Welcome to the communications context"
* do shell script "/bin/bash my_cli_tool.sh" 
* display notification "Bunch Opened"
```

## Running an AppleScript Script

If the content of a `*` line references an existing filename, that file will be executed as an applescript using the `osascript` command. If the script is in your Bunch directory, you can run it with just the filename (or a relative path to a subfolder[^relative]). Otherwise, specify an absolute path to the script.

[^relative]: Remember that relative paths in Bunches within subfolders are relative to the base Bunch Folder, not the containing subfolder.

```bunch
* MyScript.applescript
* OtherScript.scpt
```

If your script has a space in the name, you need to either quote the name or escape the spaces, e.g.:

```bunch
* "My Script With Spaces.scpt"
* My\ Script\ With\ Spaces.scpt
```

Arguments can be passed to the script on the same line (same escaping rules apply):

```bunch
* MyScript.scpt "argument 1" argument\ 2
```

Scripts run using `*` commands are monitored like shell scripts, and show up under the "🔴 Shell Scripts" menu.

## Running with Automator

You can also wrap the AppleScript in an Automator Workflow and [run it using `&` commands]({{ site.baseurl }}/docs/bunch-files/scripts/automator-workflows). This also makes it easy to use variables and control where output goes.


