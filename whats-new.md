---
layout: default
title: What's New?
nav_order: 50
page_id: whatsnew
---
# Key Changes in Bunch 1.4

Menu Bar Only
: Bunch is now a menu bar application, no more Dock mode


Visual Stuff
: New Preference Pane. [It's pretty.]({{ site.baseurl }}/docs/using-bunch/preferences/)

<section class="term-section-green" markdown=1>

Keyboard Stuff
: Assign a [global keyboard shortcut]({{ site.baseurl }}/docs/using-bunch/keyboard-control/) for opening Bunch menu in menu bar mode
: Assign keyboard shortcuts for each Bunch using [`shortcut:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts)
: More keyboard shortcuts for internal commands

</section>

<section class="term-section-yellow" markdown=1>

Frontmatter
: Vastly extend the capabilities of a Bunch with metadata at the top of a Bunch file
: [Set a custom display title]({{ site.baseurl }}/docs/bunch-files/frontmatter/#displaytitle) for any Bunch
: Curate the [menu order]({{ site.baseurl }}/docs/bunch-files/frontmatter/#sortorder)
: [schedule execution]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) days and times
: Create [arbitrary variables]({{ site.baseurl }}/docs/bunch-files/frontmatter/#arbitrarykeys) for use in logic and scripting, and more

</section>

<section class="term-section-red" markdown=1>

Subfolders
: Bunches can be organized in subfolders, which will create submenus in the main Bunch menu

Speed Stuff
: Option to [execute Bunch items in parallel]({{ site.baseurl }}/docs/bunch-files/sequence/) for faster execution of Bunches

Dialog Stuff
: Add [interactivity]({{ site.baseurl }}/docs/bunch-files/interactivity/) with multiple-choice dialogs and snippet branching
: You can also [assign variables on the fly using dialogs]({{ site.baseurl }}/docs/bunch-files/#variables) (text input, select dialog)

Debugging Stuff
: A Bunch Log [with customizable log levels]({{ site.baseurl }}/docs/using-bunch/bunch-log)

</section>

<section class="term-section-bright-blue" markdown=1>

Snippet Stuff
: << [Embedded snippets]({{ site.baseurl }}/docs/bunch-files/snippets#embeddedsnippets)
: Indent snippets 4 spaces/1 tab to have them [wait for all apps in the Bunch to launch or quit]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet)
: Snippets can have a delay and run on close

Command Stuff
: New commands like [log]({{ site.baseurl }}/docs/bunch-files/commands/log/), [sleep]({{ site.baseurl }}/docs/bunch-files/commands/sleep/), [notify]({{ site.baseurl }}/docs/bunch-files/commands/notify/), [stay awake]({{ site.baseurl }}/docs/bunch-files/commands/awake/), [audio]({{ site.baseurl }}/docs/bunch-files/commands/audio/), [input source]({{ site.baseurl }}/docs/bunch-files/commands/input-source/), [screen]({{ site.baseurl }}/docs/bunch-files/commands/screen/), and more.
: Use the [(display) command]({{ site.baseurl }}/docs/bunch-files/commands/display/) to create Single Site Browsers, tail log files, or display any file in a customizable window

</section>

<section class="term-section-silver" markdown=1>

Shell Script Stuff
: Improved shell script parsing and execution
: [Task monitors]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts) for shell scripts launched by a Bunch

Spotlight Stuff
: [Full Spotlight search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#spotlightsearch)
: [Tag search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#tagsearch) for files to open
: [Launch files in their default app]({{ site.baseurl }}/docs/bunch-files/apps/#defaultapp) by using "Default" as app name

Variable Stuff
: Use `${variables}` inside of Bunches (like you would in Snippets), populated by frontmatter keys or manually when calling a Bunch from a Bunch. [Documentation]({{ site.baseurl }}/docs/bunch-files/variables/)
: Set variables [with script results]({{ site.baseurl }}/docs/bunch-files/variables/#script)
: Allow [global variable assignments]({{ site.baseurl }}/docs/bunch-files/variables/#global) that persist across launches and are available in all Bunches
: Variable placeholders allow [default values]({{ site.baseurl }}/docs/bunch-files/variables/#defaultvalues) and [built-in transforms]({{ site.baseurl }}/docs/bunch-files/variables/#transforms) (url encode, raw newlines, etc.)

</section>

Super Nerdy Stuff
: If/Else [logic parsing]({{ site.baseurl }}/docs/bunch-files/logic/)

<section class="term-section-blue" markdown=1>

More Stuff
: "New Bunch With Open Apps" command
: Syntax for [opening Finder windows in tabs]({{ site.baseurl }}/docs/bunch-files/apps/#findertabs)
: Complete rewrite of [keystroke functionality]({{ site.baseurl }}/docs/bunch-files/keystrokes/) for macOS 10.15+
:   - Repeating syntax for key commands `{@n (right)10}`
:	- You can now type strings within key combo syntax by surrounding with double quotes, e.g. `{@n (tab)3 "typing an email\\n\\n-Brett" @$d}`
:	- Allow [sending global keyboard shortcuts]({{ site.baseurl }}/docs/bunch-files/keystrokes/#sending-global-key-combinations) (not tied to specific app)
: Command-Click a Bunch in the menu to open it in your editor of choice
: [New formats for comments]({{ site.baseurl }}/docs/bunch-files/comments/), `//` and block comments `/* ... */`
: Expanded [AppleScript dictionary]({{ site.baseurl }}/docs/integration/applescript/)

</section>
