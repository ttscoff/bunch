---
layout: default
title: Changelog
nav_order: 99
page_id: changelog
---
# Bunch Release Notes

{% include news.html %}

{% docdiff %}

---

1.4.0 (β91)
: Url handler method for opening Preference pane in the GUI (`x-bunch://prefs`)
: Add user agent setting to HTML display windows to allow forcing Dekstop or Mobile views regardless of window size (`ua:desktop`)
: Fully activate an app when @focusing it
: Update all internal links to point to bunchapp.co
: Fix: Replace deprecated preference storage methods
: Fix: Spelling error in preferences (Thanks Jay)
: Fix: Directly close preference view rather than relying on a notification

---

1.4.0 (β88)
: Only run interactive dialogs to assign a variable if the variable isn't already defined (allow frontmatter to override dialogs)
: Remove "Working" highlight on menu item after 10 seconds as a fallback
: Crash caused by `(notify)` command

---

1.4.0 (β87)
: Fix: Double trimming brackets on on-quit commands
: Fix: Edge case where canceling a multiple choice dialog left Bunch with an empty string

---

1.4.0 (β86)
: Stop stripping underscores from variable names. Why did I think that was a good idea? I forget.
: Assigning variables from dialogs when no frontmatter has previously been defined
: Null logging when frontmatter wasn't changed
: Don't let a Bunch quit itself in Single Bunch Mode when forced open from the menu

---

1.4.0 (β85)
: Fix: Subfolder name appearing in menu item titles
: Fix: URL handler calling open or close wasn't ignoring current state

---

1.4.0 (β84)
: `get preference [key]` AppleScript command for retrieving various preference settings
: `list open bunches` AppleScript command to list only open Bunches
: `list bunches` returns an AppleScript list instead of a string
: Remove some frivolous debug logging statements. It's the economy.
: 10 second timeout for actions in sequential execution mode. The economy again.
: When calling other Bunches via Bunches or handlers, allow matching subfolder and Bunch by display titles or any combination of title and display title
: Allow Bunches with the same name in different subfolders
: Include subfolder in log identifier
: All Bunch name matching is case insensitive
: Code refactoring to do a better job of catching bugs early

---

1.4.0 (β83)
: !X syntax for inserting pauses [in key commands]({{ site.baseurl }}/docs/bunch-files/keystrokes/#combopause) and [typed strings]({{ site.baseurl }}/docs/bunch-files/keystrokes/#typedpause)
: (display) command accepts `chrome:none` for windows with no titlebar or buttons
: Fix: Force apps to foreground before sending key combos
: Fix: Pause Bunch item processing while sending key commands for better consistency
: Bring all windows to foreground when Unhiding All Windows
: Automatically resolve tildes (`~`) in shell command arguments to user's home directory
: Waiting Snippet waits for up to 10 seconds for presence of main window before considering an app launched.

---

1.4.0 (β82)
: Display and screen command, UUID matching for selective scheduling, various fixes
: `(display)` command parameters can now be in any order. This involved some changes to the syntax, please [see the documentation]({{ site.baseurl }}/docs/bunch-files/commands/display/).
: New `(screen)` command for creating a full-screen, solid color window with optional transparency for hiding all windows below it. [See docs for usage.]({{ site.baseurl }}/docs/bunch-files/commands/screen/)
: Support for `schedule if` and `schedule unless` frontmatter for [excluding Macs from scheduling]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/#selective) based on trigger file or UUID
: `startup` frontmatter can be one or more UUIDs to start only on matching Macs
: `startup unless` frontmatter can be one or more UUIDs
: Copy UUID button in preferences for use with `schedule if`, `schedule unless`, and `startup`
: Bunches can be organized in subfolders, which will create submenus in the main Bunch menu
: Allow `folder.frontmatter` to [set properties of submenu]({{ site.baseurl }}/docs/using-bunch/organizing-bunches/#frontmatter)
: Allow `folder.frontmatter` to [pass keys to all Bunches in a subfolder]({{ site.baseurl }}/docs/bunch-files/frontmatter/#folderfrontmatter)
: Rename Save to Done in Preferences
: More complete emoji handling
: Add keyboard shortcut for Open Log (⇧⌘L)
: Wait for Bunch commands and script items when executing sequentially
: If a background color is set for a `display` text file but no foreground, pick a contrasting color
: If a background color is specified for text or HTML display windows, change the window to dark mode appearance if the color is more than 50% black
: Enable edit menu commands (copy/paste/etc.) in display commands windows
: Don't cut top off scrolling quick look previews
: Allow text preview/file watching of any file with a text mimetype, not just .txt and .log
: Fix: Regression in schedule handling
: Fix: Fixes for changing Bunch Folder preferences and storing recents
: Fix: Ensure all window updates happen on the main thread
: Fix: Quick Look windows via `display` command set to wallpaper level were empty

---

1.4.0 (β80)
: If a background color is set for a `display` text file but no foreground, pick a contrasting color
: If a background color is specified for text or HTML display windows, change the window to dark mode appearance if the color is less than 50% brightness
: Enable edit menu commands (copy/paste/etc.) in display commands windows
: Don't cut top off scrolling quick look previews
: Allow text preview/file watching of any file with a text mimetype, not just .txt and .log
: Fix: Ensure all window updates happen on the main thread
: Fix: Quick Look windows via `display` command set to wallpaper level were empty

---

1.4.0 (β80)
: Set variables [with script results]({{ site.baseurl }}/docs/bunch-files/variables/#script)
: Remove option to run in Dock

---

1.4.0 (β79)
: Extra .01s delay when sending key combos to improve app responsiveness in some cases
: Complete refactoring to make "Bunch Items" their own custom object
: Move what can be truly executed in the background from async on main thread to a background thread
: Give Quick Look previews in display command their own positionable window
: Window titles for text and html display windows
: Fix: Attempt to fix Preference layout on 10.13
: Fix: Open-only Bunches not launching

---

1.4.0 (β78)
: Quick fix to clean up some debug logging

---

1.4.0 (β77)
: Major overhaul of shell command runner
: [__Task monitors__]({{ site.basurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts) for shell scripts launched by a Bunch
: [__(display) command__]({{ site.baseurl }}/docs/bunch-files/commands/display/) for positionable floating windows containing local HTML, web sites, text or log files, or other filetypes as Quick Look previews
: Specify [__multiple days/times in scheduling frontmater__]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/), e.g. `open on: M W F 8am, T Th 10am`
: Assign a [__global keyboard shortcut__]({{ site.baseurl }}/docs/using-bunch/keyboard-control/) for opening Bunch menu in menu bar mode
: Assign __keyboard shortcuts for each Bunch__ using [`shortcut:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts)
: More keyboard shortcuts for internal commands
: Make default keyboard shortcuts for opening Bunches single numbers without modifiers (like ⌘)
: Use `${variables}` inside of Bunches (like you would in Snippets), populated by frontmatter keys or manually when calling a Bunch from a Bunch. [Documentation]({{ site.baseurl }}/docs/bunch-files/variables/)
: [`ignores state:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior) to allow open bunches to reopen, closed bunches to reclose
: Command-Option click to force close (menu bar mode)
: Command-Shift click to force open (menu bar mode)
: Header on Bunch menu shows what action modifier key clicks will perform (menu bar mode)
: Remove "Close Items In" menu in menu bar mode in favor of Command-Option click
: [`menu divider` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dividers) key that adds a menu separator `before` or `after` the Bunch in the menu` the Bunch in the menu
: Allow [sending global keyboard shortcuts]({{ site.baseurl }}/docs/bunch-files/keystrokes/#sending-global-key-combinations) (not tied to specific app)
: URL handler [`reveal` method]({{ site.baseurl }}/docs/integration/url-handler/#urlhandlerreveal)
: URL handler [`edit` method]({{ site.baseurl }}/docs/integration/url-handler/#urlhandleredit)
: URL handler can now match display titles as defined in frontmatter (case insensitive, emoji insensitive) when specifying Bunches
: Add Accessibility Permission screen to startup splash
: Add Accessibility Permission button to preferences with observer for current state
: Persist NSTask for caffeinate command (`awake`) so it can be terminated without `killall`
: Default Bunch Editor preference to TextEdit so there's _something_ assigned during setup
: Add Hide/Unhide All Windows option in menu bar mode
: Set default notification style to Alerts automatically
: "Working" state for status bar item (yellow), toggled for long-running scripts, when waiting for input or counting down to scheduled open/close
: Rename "Set" to "Add" in Bunch Folder preferences
: Gentler watching of Bunch folder for changes, more thorough refresh
: Light up status item (green) to notify that changes have been detected in the Bunch folder
: Notifications Preferences shortcuts in preferences
: Default to menu bar application, show Dock if preferred
: Reduce transparency on preference window to improve legibility
: Better image/text contrast for Welcome splash and Preferences
: Fix: file watchers not deallocating
: Fix: Don't make preference window float above all other windows if running in Dock mode
: Fix: allow Bunch main menu to appear when run in Dock Mode
: Fix: Remove notification and stop timer when countdown clicked
: Fix: F1-F12 not working as {keyboard combos}
: Fix: Process variables before importing snippets so that placeholders can be used for snippet fragments (`<snippet#${fragmentvar}`)
: Fix: Keyboard focus for popups buttons and text fields in interactive dialogs
: Fix: Scheduled open/close being invalidated after opening
: Fix: Allow keyboard focus for popup buttons and text fields in interactive dialogs
: Fix: Shell scripts in sequential mode fully wait for previous task to complete
: Fix: Close Items in wouldn't close if the Bunch wasn't open, now forces

---

1.4.0 (β75)
: Fix for preferences not being dismissed

---

1.4.0 (β74)
: Added welcome splash sequence
: Added a [Preference pane]({{ site.baseurl }}/docs/using-bunch/preferences/)
: Added [new formats for comments]({{ site.baseurl }}/docs/bunch-files/comments/), `//` and block comments `/* ... */`
: Allow comments on same line as Bunch items
: Fixed infinite loop if referenced snippet file is not found
: Accept more unicode characters in key combo strings (`↩`, `␣`, `⎋`, etc.)
: Slow down automated typing by a couple milliseconds/key stroke
: "Bunch Editor" preference
: Allow Command-Clicking an app in the menu to open it in an editor
: You can now [assign variables on the fly using dialogs]({{ site.baseurl }}/docs/bunch-files/#variables) (text, popup button)
: Add `%` for Hyper key as a modifier key in [key combo strings]({{ site.baseurl }}/docs/bunch-files/keystrokes/)
: Activate all windows of target app before sending keystrokes
: Bear with me... if a Bunch opens another Bunch when it closes, don't quit apps that the other Bunch opens anyway
: Run all keystroke sequences on main thread, improved reliability and no crashes
: Multiple issues affecting marking Bunches open/closed in the controller
: Do a full close of open Bunches (including re-opening !closed Bunches) when switching in Single Bunch Mode
: Handling of !!Bunch.bunch launch-on-close
: Default url handler x-success delay to 1 instead of 5
: Allow multiple files (comma separated) when calling snippet url handler
: Allow fragments to be called per file in url snippet handler using hashes (encoded as `%23`)
: Descriptive titles for URL Handler calls in log
: Watch `from file:` frontmatter files and automatically refresh the Bunch when changed
: URL handler for open, close, and toggle allows multiple target Bunches separated by comma
: Allow url handler to set arbitrary frontmatter keys using query string
: Bunches with schedules now have tooltips on hover showing next open/close time
: Fixed Raw URL handler not processing raw text
: Ignore frontmatter lines with empty key or value
: Fixed scheduled dates in logs off by 15 seconds
: Various glitches with Bunch scheduling
: Close Items In... menu not working
: Fix for delayed launches in parallel Bunches (`~5`)

---

1.4.0 (β72)
: Complete rewrite of [keystroke functionality]({{ site.baseurl }}/docs/bunch-files/keystrokes/) for macOS 10.15+

---

1.4.0 (β71)
: Fixed @Focused apps failing to quit

---

1.4.0 (β70)
: You can now type strings within key combo syntax by surrounding with double quotes, e.g. `{@n (tab)3 "typing an email\\n\\n-Brett" @$d}`
: More [interactivity]({{ site.baseurl }}/docs/bunch-files/interactivity/) with multiple-choice dialogs and snippet branching
: Restored missing "Launch Items in Parallel" preference

---

1.4.0 (β69)
: Better handling of Accessibility permissions requests
: (stay awake) command to keep Mac awake while a Bunch is open (or for a set period of time , e.g. `(stay awake 60)`) [[documentation]({{ site.baseurl }}/docs/bunch-files/commands/awake/)]
: Fixed menu ordering for real
: `toggles: false` frontmatter key to only allow a Bunch to open, never close, not affecting the state of apps it contains or the menu. [[documentation]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior)]
: `quits apps: always` frontmatter key to allow a Bunch to quit apps even if they're open in other Bunches [[documentation]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior)]
: "Quit Apps Open in Other Bunches" preference, global version of `quits apps: always` frontmatter [[documentation]({{ site.baseurl }}/docs/using-bunch/preferences/)]
: If app can't be activated, send a launch signal
: Better "close all windows" handling for [XX lines]({{ site.baseurl }}/docs/bunch-files/apps/#closingwindows)
: If natural language interval has no s, m, h, or d, assume seconds (e.g. `(sleep 120)` assumes `(sleep 120s)`)
: For real fixed [menu ordering]({{ site.baseurl }}/docs/bunch-files/frontmatter/#sortorder)

---

1.4.0 (β68)
: Syntax for [opening Finder windows in tabs]({{ site.baseurl }}/docs/bunch-files/apps/#findertabs)
: `single bunch mode: ignore` frontmatter key to exclude a Bunch from be affected by Single Bunch Mode
: Menu ordering fixed
: Force dialogs to remain above other app's windows
: Fix hang when hiding all apps

---

1.4.0 (β67)
: "New Bunch With Open Apps" command
: Option to [execute Bunch items in parallel]({{ site.baseurl }}/docs/bunch-files/sequence/) (all at once)
: "Recent Bunch Folders" in Preferences submenu
: Better log messages for shell script errors
: Move initial Bunch Folder location to ~/Documents/Bunches
: Change wording of menu item from "Quit Apps In..." to "Close Items in..."
: Changed "No" button in Optional Snippets dialog to "Cancel" so Escape key works
: Offer relaunch dialog if log detail level is changed
: Sort preferences in Bunch menu in Dock mode
: %{} variable placeholder url encodes replacement
: $BUNCH_PHASE [environment variable]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#argsandenv) for shell scripts to determine whether the Bunch is opening or closing
: Improved: shell script parsing and execution
: Fixed: Users couldn't set log level to Debug
: Offer "relaunch" dialog if log level is changed
: `?"Optional Snippet"` queries now work with on-close `!<Snippets` too
: Repeating syntax for key commands `{@n (right)10}`
: Ask the user if they want to close open Bunches when switching to a new Bunch folder

---

1.4.0 (β66)
: Allow frontmatter `from script` to wait for input, allowing [scripts with dialogs]({{ site.baseurl }}/docs/integration/advanced-scripting#password)
: Only run frontmatter `from script` when opening, not when pre-loading tasks
: Allow `startup` frontmatter to accept value of `ask`, offer yes/no dialog before loading
: Better error handling for recursive nesting (Bunchception)

---

1.4.0 (β65)
: Sort menu by display title (ignoring emoji)
: "menu order" frontmatter to force menu display order

---

1.4.0 (β62)
: Don't lowercase notify command text

---

1.4.0 (β61)
: Introduced [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter)
: Change menu display title with frontmatter
: Set [arbitrary snippet variables]({{ site.baseurl }}/docs/bunch-files/frontmatter/#arbitrarykeys) with frontmatter
: "from script" and "from file" allow [dynamic frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dynamicfrontmatter)
: Mark a Bunch as a startup bunch with frontmatter
: [Schedule bunches]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) to open and close at specified days and times using frontmatter
: [Tag search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#tagsearch) for files to open
: [Full Spotlight search]({{ site.baseurl }}/docs/bunch-files/spotlight-searches#spotlightsearch) for files to open
: [Launch files in their default app]({{ site.baseurl }}/docs/bunch-files/apps/#defaultapp) by using "Default" as app name
: (notify) command to [trigger notification center]({{ site.baseurl }}/docs/bunch-files/commands/notify/)
: (sleep) commands ([sleep, sleep display, sleep screensaver]({{ site.baseurl }}/docs/bunch-files/commands/sleep/))
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
: New `snippet` url method ([see docs]({{ site.baseurl }}/docs/integration/url-handler/#urlhandlersnippet))
: New `x-success` and `x-delay` parameters for all URL methods
: New AppleScript method `run snippet` to mirror url handler
: Allow [default values]({{ site.baseurl }}/docs/bunch-files/snippets/#defaultvalues) for variables (`${var:default}`)
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
