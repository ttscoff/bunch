---
layout: default
title: Changelog
nav_order: 99
page_id: changelog
---
1.4.0 (Beta 67)
#### NEW

: "New Bunch With Open Apps" command
: Option to [execute Bunch items in parallel]({{ site.baseurl }}/docs/bunch-files/sequence) (all at once)
: "Recent Bunch Folders" in Preferences submenu
: Better log messages for shell script errors
: Move initial Bunch Folder location to ~/Documents/Bunches
: Change wording of menu item from "Quit Apps In..." to "Close Items in..."
: Changed "No" button in Optional Snippets dialog to "Cancel" so Escape key works
: Offer relaunch dialog if log detail level is changed
: Sort preferences in Bunch menu in Dock mode
: %{} variable placeholder url encodes replacement
: $BUNCH_PHASE [environment variable]({{ site.baseurl }}/docs/bunch-files/shell-scripts#argsandenv) for shell scripts to determine whether the Bunch is opening or closing
: Improved: shell script parsing and execution
: Fixed: Users couldn't set log level to Debug
: Offer "relaunch" dialog if log level is changed
: `?"Optional Snippet"` queries now work with on-close `!<Snippets` too

1.4.0 (Beta 66)
: Allow frontmatter `from script` to wait for input, allowing [scripts with dialogs]({{ site.baseurl }}/docs/integration/advanced-scripting#password)
: Only run frontmatter `from script` when opening, not when pre-loading tasks
: Allow `startup` frontmatter to accept value of `ask`, offer yes/no dialog before loading
: Better error handling for recursive nesting (Bunchception)

---

1.4.0 (Beta 65)
: Sort menu by display title (ignoring emoji)
: "menu order" frontmatter to force menu display order

---

1.4.0 (Beta 62)
: Don't lowercase notify command text

---

1.4.0 (Beta 61)
: Introduced [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter)
: Change menu display title with frontmatter
: Set [arbitrary snippet variables]({{ site.baseurl }}/docs/bunch-files/frontmatter/#arbitrarykeys) with frontmatter
: "from script" and "from file" allow [dynamic frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dynamicfrontmatter)
: Mark a Bunch as a startup bunch with frontmatter
: [Schedule bunches]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) to open and close at specified days and times using frontmatter
: [Tag search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#tagsearch) for files to open
: [Full Spotlight search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#spotlightsearch) for files to open
: [Launch files in their default app]({{ site.baseurl }}/docs/bunch-files/apps/#defaultapp) by using "Default" as app name
: (notify) command to [trigger notification center]({{ site.baseurl }}/docs/bunch-files/commands/#notify)
: (sleep) commands ([sleep, sleep display, sleep screensaver]({{ site.baseurl }}/docs/bunch-files/commands/#sleep))
: Indent snippets 4 spaces/1 tab to have them [wait for all apps in the Bunch to launch or quit]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet)
: < snippets can have a delay ~5
: !< snippets will run on close
: !< snippets can have a delay ~5
: << [Embedded snippets]({{ site.baseurl }}/docs/bunch-files/snippets#embeddedsnippets)
: [Bunch Log]({{ site.baseurl }}/docs/using-bunch/bunch-log) with customizable log levels
: Detect shebang and execute appropriate binary for non-executable shell scripts
: Attempt at smarter app hiding
: Update example Bunch
: New features for the [Bunch CLI]({{ site.baseurl }}/docs/integration/cli), including "load as snippet" and interactive Bunch URL
: Smarter shell script loading, better script shebang handling, binary detection
: Documentation updates

---

1.3.6
: Preference option to restore previously open Bunches when launching
: Close launched Bunches when closing Bunch
: Use !Name.bunch to close a bunch within a Bunch
: Avoid infinite loops when opening/closing Bunches within Bunches (a Bunch can't call itself)

---

1.3.5
: New `snippet` url method ([see docs]({{ site.baseurl }}/docs/integration/url-handler.html#urlhandlersnippet))
: New `x-success` and `x-delay` parameters for all URL methods
: New AppleScript method `run snippet` to mirror url handler
: Allow [default values]({{ site.baseurl }}/docs/bunch-files/snippets.html#defaultvalues) for variables (`${var:default}`)
: Don't freak out if variable placeholders are included in snippets but values are not provided when importing

---

1.3.4
: Bugfix release

---

1.3.3
: Launch Bunches on startup with *.startup files
: On/Off images for Bunches in menu bar mode
: Allow Bunches to be launched like applications
: If a Bunch is launched by another Bunch, affect its checkmark
: Keyboard shortcuts in menu bar menu
: Snippet files not found when they absolutely do exist
: Better handling if a fragment isn't matched
: When a Bunch causes errors, gracefully ignore and continue processing other bunches

---

1.3.2
: Update help links to new mini-site

---

1.3.1
: Handle Do Not Disturb commands on Big Sur
: Add syntax for confirm dialog when loading snippets, e.g. `<test.snippet ?"Load this snippet?"`
: Allow Option-click on checked Bunch to clear checkmark
: AppleScript command "process text" to process raw Bunch commands

---

1.3.0
: Fix for delayed apps not quitting on close

---

1.2.9
: Better at maintaining "open" checkmarks
: Reduce delay when storing and changing wallpaper
: Add option to delay a launch or command with ~X at the end of line
: Big Sur Dock Icon

---

1.2.8
: add `(audio mute)` and `(audio unmute)` commands
: allow separate input/output muting and volume commands
: improved method for setting output volume

---

1.2.7
: Allow !! to launch apps when closing a Bunch
: Better error handling for unreadable Bunch files
: Allow sections in snippets that can be called individually

---

1.2.6
: New audio commands for switching inputs, outputs, and setting volume

---

1.2.5
: Fix for issues when changing Bunch Folder preference

---

1.2.4
: Add Microsoft Edge to browser-specific url options

---

1.2.3
: Allow urls to be [opened in a specific browser](#specificbrowser).

---

1.2.2
: Change escape codes for up and down from "\\\\p" and "\\\\n" to "\\\\u" and "\\\\d"
: Add \\\\h delete, \\\\a home, \\\\e end escape codes
: Allow leading and trailing space for `[ typed string ]` commands
: Allow system key names in key commands, e.g. {@up}
: Allow unicode characters for arrow keys, e.g. {@↑}
: Allow hyphenated long-form commands, e.g. {opt-left opt-left cmd-shift-up}
: Make about panel appear in foreground when running in menu bar mode

---

1.2.1
: `(wallpaper [path])` command to specify desktop images

---

1.2.0
: Ability to import "snippets" with variables for repeatable bunch actions

---

1.1.9
: $BUNCH_DND environment variable for shell scripts, shows current Do Not Disturb state
: $BUNCH_DOCK environment variable for shell scripts, shows current Dock visibility
: $BUNCH_DESKTOP_ICONS environment variable for shell scripts, shows whether Desktop icons are visible

---

1.1.8
: Send key commands using `{@~w}` in app file params
: Type key sequences using `[type this out]` in app file params
: Improve hiding all apps (`@@`)

---

1.1.7
: New commands `dark mode` and `dark mode off`
: Optimizations and fixes

---

1.1.6
: Run commands when closing a Bunch: `!(hide dock)`
: Dock positioning commands: `!(dock [left|right|bottom])`
: Launch At Login preference handling
: Fixes Dock show/hide commands being reversed

---

1.1.5
: Better reporting for Workflow errors
: More dependable implementation for "@@" (hide all apps)

---

1.1.4
: Fix for AppleScript "Corrupted Dictionary" errors

---

1.1.3
: AppleScript improvements that will be invisible to the naked eye. Or really any end user.
: Donate button twice in the menu bar version. Nobody needs that much prodding. I mean, you're going to pitch in or you're not, right?

---

1.1.2
: Bunch can be automated with AppleScript
: URL method setPrefs to change certain preferences from script
: Bind bunch menu item states to a property so they're always up-to-date

---

1.1.1
: Additional environment variables for shell scripts
: Updated Example.bunch with all the latest goodness
: A script line (\*&$) preceded by ! will only run that script when closing the Bunch
: Status item submenu with Check For Updates (and Donate)

---

1.1.0
: Preferences->"Run in Menu Bar" option
: Preferences->"Launch at Login" option

---

1.0.10
: Use `& workflowname` to run automator workflows
: Use `$ shell command` to run shell scripts/commands
: Menu command to clear checkmarks in toggle/single bunch mode (force launched Bunches to launch again)
: Url method `raw` for directly loading any Bunch-formatted file or directly passing bunch commands as a string
: (dnd on) and (dnd off) commands for Do Not Disturb
: Watch bunch folder for changes and refresh automatically
: Opening or closing a Bunch via url command now toggles launched state in Dock menu when Toggle Bunches is active

---

1.0.9
: Add `close` method to url handler
: Add `toggle` method to url handler
: Allow url handler methods to toggle Bunch state in Dock Menu
: Show an alert when commands fail to make it easier to diagnose and fix Bunches
: Add LaunchBar, Alfred, and CLI scripts to documentation

---

1.0.8
: Add percent (`%`) before app name to ignore it when closing a Bunch
: Add `XX` as a filename to close all windows for the app\
: Desktop icons commands: `(hide desktop)` and `(show desktop)`

---

1.0.7
: Toggle Bunches mode, checkmark opened Bunches, click checkmarked Bunch to close
: Single Bunch Mode
: Quit Apps in Bunch... submenu
: Bunch commands `(hide dock)` `(show dock)`

---

1.0.6
: `@@` alone on a line will hide all apps

---

1.0.5
: New URL handler `x-bunch:`
: Ability to change location of Bunches folder

---

1.0.4
: Allow URL schemes (in addition to http)
: Test if app is running or hidden before launching, hiding, quitting
: Use NSWorkspace instead of AppleScript where possible
: Allow `_` suffix to hide app (experimental)

---

1.0.3
: Add @focus syntax
: Add \*AppleScript syntax

---

1.0.2
: Improve launch speed
: Allow `![app name]` to quit an app
: Build for older macOS versions
: Sort Bunches alphabetically in Dock menu

---

1.0.1
: Remove cruft from app menus
: Add "Show Bunches in Finder" to Dock and File menus
