---
layout: default
title: Terminology
nav_order: 20
tags: [terminology]
---
# Bunch Terminology

For the purposes of this documentation, here are some definitions.

## Definitions

Bunch
: The name of the app, but also a singular reference to a file containing a plain text list of [apps]({{ site.baseurl }}/docs/bunch-files/apps/), [commands]({{ site.baseurl }}/docs/bunch-files/commands/), and [scripts]({{ site.baseurl }}/docs/bunch-files/scripts/) it will launch. The latter is also referred to as a "Bunch File."

Bunch Folder
: The folder where your collection of Bunch files is stored.

Open/Closed
: Bunches are either "opened" or "closed," and perform different tasks depending on the action. Closing a Bunch has a different meaning than "quitting," so I'll do my best not to refer to opening a Bunch as launching, or closing a Bunch as quitting it.

Quit/Launched
: Apps and scripts are "launched" and "quit" (or terminated) by Bunches when they open or close.

Comments
: [Comments]({{ site.baseurl }}/docs/bunch-files/comments/) are lines in a Bunch that are ignored, used for adding descriptive notes to yourself or others you might share the Bunch with. Comments can be lines or blocks on their own, or added at the end of any Bunch Item line.

Bunch Items
: Bunch Items are lines in a Bunch file, whether launching an app, running a script, or executing a command. This is a generic term for referencing all of the types below.

App Items
: [App Items]({{ site.baseurl }}/docs/bunch-files/apps/) are lines in a Bunch file that launch an app. They start at the left margin (unless in an indented [logic block]({{ site.baseurl }}/docs/bunch-files/logic/)), and the only characters that precede them are special characters like `!`, `%`, or `@` which affect the behavior of the app (like quitting instead of launching, ignoring it when closing, or focusing the app and hiding others after launching it).

Command Items
: [Command Items]({{ site.baseurl }}/docs/bunch-files/commands/) are lines surrounded in parentheses. They perform tasks provided by Bunch, such as sending notifications, turning on Do Not Disturb, or sleeping your computer. Like App Items, they start against the left margin.

Script Items
: [Script Items]({{ site.baseurl }}/docs/bunch-files/scripts/) start with a special character that indicates what type of script to run. Shell scripts start with `$`, AppleScripts start with `*`, and Automator Workflows start with `&`. Shell and AppleScript lines can run either script files or run commands directly.

File Items
: File Items are lines that come after an App Item that perform actions (like opening files or sending keystrokes) in the App Item that precedes them. Multiple File Items can come after a single App Item. These can also be used after Script Items to pass environment variables to the script, or after items that open Snippets or other Bunches to set frontmatter values.

Frontmatter
: [Frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/) is an optional block of text at the top of a Bunch. It's delimited by `---` at the top and bottom of the block. Frontmatter consists of key/value pairs and affect the display, behavior, and additional functionality of the Bunch that contains them.

Snippet
: A [snippet]({{ site.baseurl }}/docs/bunch-files/snippets/) is a file in the Bunch folder that has any extension other than `.bunch`. It can contain anything a Bunch can, and can be included from within a Bunch to allow sharing of common tasks between Bunches. Snippets are also used to allow interactivity, delayed execution, and other fun stuff. A snippet can be [embedded]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets) in a bunch.

Fragment
: A portion of a snippet or a bunch file introduced by a fragment header and terminated by the end of the file or another fragment header. A snippet or bunch can contain multiple fragments.

Fragment Header
: A line in a Bunch file or a snippet which indicates the beginning of a fragment.

Fragment Name
: The string between the brackets in a fragment header. Fragment names can include spaces.


## Keyboard Shortcuts

Keyboard shortcuts are displayed as symbols: {% kbd @$H %}. Hovering over a keyboard shortcut will display a tooltip showing the natural language version of the key combination, e.g. "Shift-Command-H."

| symbol          | meaning       |
| -------:        | ------------- |
| {% kbd cmd %}   | Command       |
| {% kbd shift %} | Shift         |
| {% kbd opt %}   | Option        |
| {% kbd ctrl %}  | Control       |
| {% kbd fn %}    | Function      |
| {% kbd click %} | Mouse Click   |
