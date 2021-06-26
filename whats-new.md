---
layout: default
title: What's New?
nav_order: 50
page_id: whatsnew
---
# Key Changes in Bunch 1.4

- Bunch is now a menu bar application, no more Dock mode
- New [Preference Pane]({{ site.baseurl }}/docs/using-bunch/preferences/)
- Keyboard friendly
    - Assign a [global keyboard shortcut]({{ site.baseurl }}/docs/using-bunch/keyboard-control/) for opening Bunch menu in menu bar mode
    - Assign keyboard shortcuts for each Bunch using [`shortcut:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts)
    - More keyboard shortcuts for internal commands
- [Frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter) allows setting Bunch display title and [menu order]({{ site.baseurl }}/docs/bunch-files/frontmatter/#sortorder), [scheduling Bunches]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches), [arbitrary variables]({{ site.baseurl }}/docs/bunch-files/frontmatter/#arbitrarykeys) for use in logic and scripting, and more
- Bunches can be organized in subfolders, which will create submenus in the main Bunch menu
- Option to [execute Bunch items in parallel]({{ site.baseurl }}/docs/bunch-files/sequence/) for increased speed
- More [interactivity]({{ site.baseurl }}/docs/bunch-files/interactivity/) with multiple-choice dialogs and snippet branching
    - You can now [assign variables on the fly using dialogs]({{ site.baseurl }}/docs/bunch-files/#variables) (text input, select dialog)
- [Bunch Log]({{ site.baseurl }}/docs/using-bunch/bunch-log) with customizable log levels
- << [Embedded snippets]({{ site.baseurl }}/docs/bunch-files/snippets#embeddedsnippets)
- Indent snippets 4 spaces/1 tab to have them [wait for all apps in the Bunch to launch or quit]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet)
- Snippets can have a delay and run on close
- New [commands]({{ site.baseurl }}/docs/bunch-files/commands/): [log]({{ site.baseurl }}/docs/bunch-files/commands/log/), [sleep]({{ site.baseurl }}/docs/bunch-files/commands/sleep/), [notify]({{ site.baseurl }}/docs/bunch-files/commands/notify/), [stay awake]({{ site.baseurl }}/docs/bunch-files/commands/awake/), [audio]({{ site.baseurl }}/docs/bunch-files/commands/audio/), [input source]({{ site.baseurl }}/docs/bunch-files/commands/input-source/), [screen]({{ site.baseurl }}/docs/bunch-files/commands/screen/), and more.
	- Use the [(display) command]({{ site.baseurl }}/docs/bunch-files/commands/display/) to create Single Site Browsers, tail log files, or display any file in a customizable window
- Improved shell script parsing and execution
    - [Task monitors]({{ site.basurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts) for shell scripts launched by a Bunch
- [Full Spotlight search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#spotlightsearch) and [tag search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#tagsearch) for files to open
    - [Launch files in their default app]({{ site.baseurl }}/docs/bunch-files/apps/#defaultapp) by using "Default" as app name
- Use `${variables}` inside of Bunches (like you would in Snippets), populated by frontmatter keys or manually when calling a Bunch from a Bunch. [Documentation]({{ site.baseurl }}/docs/bunch-files/variables/)
- Set variables [with script results]({{ site.baseurl }}/docs/bunch-files/variables/#script)
- Allow [global variable assignments]({{ site.baseurl }}/docs/bunch-files/variables/#global) that persist across launches and are available in all Bunches
- Variable placeholders allow default values and built-in transforms (url encode, raw newlines, etc.)
- If/Else [logic parsing]({{ site.baseurl }}/docs/bunch-files/logic/)
- "New Bunch With Open Apps" command
- Syntax for [opening Finder windows in tabs]({{ site.baseurl }}/docs/bunch-files/apps/#findertabs)
- Complete rewrite of [keystroke functionality]({{ site.baseurl }}/docs/bunch-files/keystrokes/) for macOS 10.15+
    - Repeating syntax for key commands `{@n (right)10}`
	- You can now type strings within key combo syntax by surrounding with double quotes, e.g. `{@n (tab)3 "typing an email\\n\\n-Brett" @$d}`
	- Allow [sending global keyboard shortcuts]({{ site.baseurl }}/docs/bunch-files/keystrokes/#sending-global-key-combinations) (not tied to specific app)
- Allow Command-Clicking an app in the menu to open it in your editor of choice
- Added [new formats for comments]({{ site.baseurl }}/docs/bunch-files/comments/), `//` and block comments `/* ... */`
- Expanded [AppleScript dictionary]({{ site.baseurl }}/docs/integration/applescript/)
