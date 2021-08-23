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

Put a `*` at the beginning of a line to have the line interpreted as raw AppleScript. There will be some permissions requests and some commands that just refuse to run, but most commands will work fine. {% available 119 %}If you need to use multiple lines, you can either create an external [script file](#script), or use a [heredoc](#heredoc) or [snippet import](#snippet).{% endavailable %}

```bunch
* say "Welcome to the communications context"
* do shell script "/bin/bash my_cli_tool.sh" 
* display notification "Bunch Opened"
```

## Running an AppleScript Script {#script}

If the content of a `*` line references an existing filename, that file will be executed as an AppleScript using the `osascript` command. If the script is in your Bunch directory, you can run it with just the filename (or a relative path to a subfolder[^relative]). Otherwise, specify an absolute path to the script.

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

{% available 119 %}

## Multi-line/Heredoc {#heredoc}

Multi-line scripts can also be embedded using the same [heredoc syntax]({{ site.baseurl }}/docs/bunch-files/variables/#heredoc) as variable assignment. The contents of the heredoc block will be saved to a temporary file and executed as AppleScript. This allows you to embed multi-line AppleScripts in your Bunch without having to generate external script files for every one.

All lines within a block will be outdented to the indent level of the first line.

__Markdown Syntax__

````bunch
* ```
set source_folder to choose folder with prompt "Please select directory."
-- do some cool stuff
```
````

__Heredoc Syntax__

```bunch
* <<EOFILE
set source_folder to choose folder with prompt "Please select directory."
-- do some cool stuff
EOFILE
```

Variable placeholders can be used in heredocs. Heredocs do not accept environment variables on file lines following them the way that regular script/command lines do.

{% endavailable %}

{% available 119 %}

## Snippets {#snippet}

You can also use [snippet syntax]({{ site.baseurl }}/docs/bunch-files/snippets/) to import AppleScript, allowing for use of fragments to combine multiple scripts into one file (or an embedded snippet, as shown below).

```bunch
* <<#AppleScript Fragment
___
--[AppleScript Fragment]
set source_folder to choose folder with prompt "Please select directory."
set newline to ASCII character 10

set finalText to ""

tell application "Mail"
  set theMessages to (messages of inbox whose read status is false)
  set {astid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, " "}
[...]
```

This works for both shell (`$`) and AppleScript (`*`) script lines. In most cases you'll probably want to just write actual scripts and execute them directly, but if you want to combine multiple scripts with fragment headers or make use of embedded snippets to store scripts for the current Bunch, this syntax will do the trick.

{% endavailable %}

## Running with Automator

You can also wrap the AppleScript in an Automator Workflow and [run it using `&` commands]({{ site.baseurl }}/docs/bunch-files/scripts/automator-workflows). This also makes it easy to use variables and control where output goes.


