---
layout: default
title: Changelog
nav_order: 130
page_id: changelog
---
# Bunch Release Notes

{% include news.html %}

{% docdiff %}


{% available 127 %}
---

1.4.6 (β127)
: {% icon fix %} Apps launched by bundle identifier couldn't open files

---

1.4.6 (β126)
: {% icon fix %} Long directory names breaking preference window layout (#148)
: {% icon fix %} Calling "toggle" via URL handler not respecting single bunch mode (#149)
: {% icon fix %} Crash when completing script with error on Bunch close (#152)
{% endavailable %}


---

1.4.5

: {% icon new %} Fancy new icon design by Felippe van Eekhout
: {% icon new %} Add "Untagged" submenu to tags menu
: {% icon new %} Refresh all browsers AppleScript command
: {% icon new %} Add "Untagged" submenu to tags menu
: {% icon new %} [Heredoc support for shell commands]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#heredoc)
: {% icon new %} [Snippet syntax support for script lines]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#snippet) (`$ <file#fragment`)
: {% icon new %} [Heredoc support for variable assignments]({{ site.baseurl }}/docs/bunch-files/variables/#heredoc)
: {% icon new %} [Snippet syntax support for variable assignment]({{ site.baseurl }}/docs/bunch-files/variables/#snippet) (`var = <file#fragment`)
: {% icon new %} [Submenu with bunches listed by tag]({{ site.baseurl }}/docs/using-bunch/organizing-bunches/#tags)
: {% icon new %} [AppleScript "open/close/toggle/list bunches tagged"]({{ site.baseurl }}/docs/integration/applescript/#tags)
: {% icon new %} [URL handler for open/close/toggle commands accepts "tag=X" as optional replacement for "bunch=X"]({{ site.baseurl }}/docs/integration/url-handler/#tags)
: {% icon imp %} Move tag menus into section of main menu instead of Tags submenu
: {% icon imp %} Allow (display) and \~delay syntax for heredoc scripts
: {% icon imp %} Move tag menus into section of main menu instead of Tags submenu
: {% icon imp %} Variable placeholders no longer require removing spaces from variable names
: {% icon imp %} Better truncation of long script paths/names in running scripts menu
: {% icon fix %} Don't register `var_name = ${old_var}` as a shell script assignment
: {% icon fix %} Remove "tag:" key from folder frontmatter
: {% icon fix %} Action buttons on script error dialogs not opening Bunch Log
: {% icon fix %} Remove single and double quotes from ends of frontmatter values

---

1.4.4
: {% icon new %} Create menus from YAML, JSON, text, or executable script files ([Documentation]({{ site.baseurl }}/docs/bunch-files/interactivity/external-files/))
: {% icon imp %} Better replacement of variable placeholders that are populated mid-stream
: {% icon imp %} Rewrite of Do Not Disturb handling on Big Sur and later
: {% icon imp %} Improved variable (re)assignment inside of conditional logic blocks
: {% icon bug %} Fix case sensitivity when replacing variable placeholders

---

1.4.3
: {% icon bug red %} Reversible commands not reversing when closing a bunch
: {% icon bug red %} Do Not Disturb not disabling
: {% icon bug red %} If Bunches are open when changing the "Toggle Bunches" preference to OFF, register them as closed so they can be opened again
: {% icon bug red %} If a Bunch is open when it's changed to `toggles: false`, reset its open state so it can be opened again
: {% icon bug red %} If a multiple choice dialog sets a variable in an opens-only Bunch, reset the variable after opening so the dialog appears again next time

---

1.4.1
: {% icon imp %} Allow variable placeholders in "run before/after" frontmatter scripts
: {% icon imp %} Allow Coherence X apps to function properly if referred to by bundle identifier (e.g. com.BZG.CoherenceMyApp)
: {% icon imp %} Remove superfluous log statements
: {% icon bug red %} Empty comment lines stopping processing

---

1.4.0 (β110)
: {% icon imp %} Attempt to quit an app even if it's not immediately located among running apps
: {% icon bug red %} Don't convert app name to value of localizedName property, fixes issues with iTerm. Trying too hard is detrimental, apparently.
: {% icon bug red %} Don't automatically quit Finder if included in a Bunch

---

1.4.0 (β109)

: {% icon new %} Allow `!!!Triple Negative` to quit an app when closing a Bunch without launching on open
: {% icon new %} `space:all` parameter for `(display)` command to cause a display window to join all spaces
: {% icon imp %} Special handling for "FileMaker Pro 18 Advanced"
: {% icon imp %} Switch to using mdfind as backup app locator
: {% icon imp %} Convert some Info-level log messages to Debug-level for cleaner log output

---

1.4.0 (β108)

: {% icon new %} Frontmatter keys for running scripts before/after opening a Bunch, and before/after closing
: {% icon new %} Variables can hold values with newlines
: {% icon new %} Perform pre-defined transformations on variable values (url encode, shell escape, raw newlines, newlines for typed strings)
: {% icon imp %} Percent encode newlines
: {% icon imp %} Do some translating on built-in frontmatter keys to allow for some variations in syntax
: {% icon imp %} URL encoding of variables now encodes question marks and other symbols not allowed in URL paths
: {% icon imp %} Limit length of info logging messages to 50 characters
: {% icon imp %} Process variable assignments in document order
: {% icon imp %} Process variable assignment dialogs inline with other variables, allowing dynamically-assigned variables to be used in dialogs
: {% icon bug red %} Remove Bunch-specific frontmatter keys from variables passed to Waiting Snippets
: {% icon bug red %} Prevent backslash escapes from disappearing from values during variable assignment
: {% icon bug red %} Don't change case when logging commands
: {% icon bug red %} Make variables available prior to processing shell script variable assignments

---

1.4.0 (β107)
: __Breaking change:__ fragment ID syntax no longer accepts a single dash before the square brackets, must have at least 2 or use a different symbol
: Everything after closing square bracket in fragment id lines is ignored
: Whitespace is allowed anywhere in a fragment id line, as long as the first character is one of the accepted divider symbols (#->=)
: Fragment id divider syntax now accepts `>` and `=` as divider lines
: Better searching for apps NSWorkspace doesn't recognize as apps by name
: If Bunch Item type is Unknown, consider it an app name that wasn’t found and make an attempt to launch it anyway
: `if VarName` condition with no operator will return true if `VarName` is defined and contains ANY content other than `false` or `no`.
: {% icon bug red %} Make `if VarName` conditions case insensitive
: {% icon bug red %} Process snippets within conditions

---

1.4.0 (β105)
: Walk back change to force-hiding apps before @focus lines

---

1.4.0 (β104)
: Add AppName syntax to indicate an app should activate/foreground on launch. By default apps now won’t activate, unless they’re receiving keystrokes
: (hide/show menu bar) command
: Allow `#clear` as window background color
: Use better async app launch method on 10.15+
: Slightly more reliable hiding and focusing of apps, including forcing any apps before an @focus line to launch hidden (previously just relied on activateHidingOthers)
: Better formatting of long scripts in Running Scripts menu
: Allow setting actual window background color for (display) windows
: {% icon bug red %} A Bunch with no frontmatter or non-comment items in the Bunch folder was causing the entire menu to be empty
: {% icon bug red %} Remove Bunch default keys from frontmatter when inherited by child Bunches (launched by another Bunch)
: {% icon bug red %} (input source) command now performs all actions on main thread (crasher)

---

1.4.0 (β103)
: Allow `#clear` as a background color for Quick Look display windows
: Allow migration of Bunch Beta prefs back to stable channel
: Add `(hide menu bar)` command

---

1.4.0 (β102)
: {% icon bug red %} Variables set in parent Bunch are now available to Waiting Snippets
: {% icon bug red %} Allow HTML display command to handle non-HTTP url schemes
: Fixes for Example Bunch

---

1.4.0 (β101)
: Special handling for Visual Studio Code when attempting to quit the app
: `(input source XXX)` command to switch keyboard input source
: {% icon bug red %} Change "Clear Checkmarks" shortcut to Control-Option-Command-R
: {% icon bug red %} Don't trigger `screen` commands on wake from sleep if parent Bunch isn't open
: Create checkbox dialogs to handle optional launching of multiple apps/snippets in one dialog
: Present dialogs in the order they’re listed in the Bunch

---

1.4.0 (β99)
: {% icon bug red %} Running an AppleScript file with a `*` line wasn't actually running anything

---

1.4.0 (β98)
: If/Else [logic parsing]({{ site.baseurl }}/docs/bunch-files/logic/)
: Allow direct `key = value` variable assignment in snippets.
: Direct variable assignments are parsed before snippets are loaded
: If/then blocks can set/change variables before next block is processed
: All Snippets (including Waiting Snippets) inherit their parent's frontmatter so variables carry forward
: Allow [global variable assignments]({{ site.baseurl }}/docs/bunch-files/variables/#global) that persist across launches and are available in all Bunches
: {% icon bug red %} Don't parse = in URLs as a variable assignment
: {% icon bug red %} Notification issue when assigning a variable with an AppleScript and the script fails
: {% icon bug red %} `from script` variable assignments becoming empty
: {% icon bug red %} Allow spaces and underscores in `var = $ script` assignments
: {% icon bug red %} Variable placeholders don't have to be lowercased to match
: {% icon bug red %} If processing a script as AppleScript fails, attempt to execute as shell script (JXA scripts executed with `* script` items return error)
: {% icon bug red %} Allow arguments to be passed when assigning variables with script results
: {% icon bug red %} Don't strip underscores from variable keys in `key_name = $"Query"` assignments
: {% icon bug red %} Bug with running AppleScript commands in serial execution

---

1.4.0 (β93)
: Reduce error messages in log (move to debug level)
: Handle 2 and 3-character app names (sorry VLC)

---

1.4.0 (β92)
: {% icon bug red %} Handle edge case where running applications includes an app that doesn't return an app name
: {% icon bug red %} Error checking for string manipulation functions

---

1.4.0 (β91)
: Url handler method for opening Preference pane in the GUI (`x-bunch://prefs`)
: Add user agent setting to HTML display windows to allow forcing Desktop or Mobile views regardless of window size (`ua:desktop`)
: Fully activate an app when @focusing it
: Update all internal links to point to bunchapp.co
: {% icon bug red %} Replace deprecated preference storage methods
: {% icon bug red %} Spelling error in preferences (Thanks Jay)
: {% icon bug red %} Directly close preference view rather than relying on a notification

---

1.4.0 (β88)
: Only run interactive dialogs to assign a variable if the variable isn't already defined (allow frontmatter to override dialogs)
: Remove "Working" highlight on menu item after 10 seconds as a fallback
: Crash caused by `(notify)` command

---

1.4.0 (β87)
: {% icon bug red %} Double trimming brackets on on-quit commands
: {% icon bug red %} Edge case where canceling a multiple choice dialog left Bunch with an empty string

---

1.4.0 (β86)
: Stop stripping underscores from variable names. Why did I think that was a good idea? I forget.
: Assigning variables from dialogs when no frontmatter has previously been defined
: Null logging when frontmatter wasn't changed
: Don't let a Bunch quit itself in Single Bunch Mode when forced open from the menu

---

1.4.0 (β85)
: {% icon bug red %} Subfolder name appearing in menu item titles
: {% icon bug red %} URL handler calling open or close wasn't ignoring current state

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
: (display) command accepts `chrome:none` for windows with no title bar or buttons
: {% icon bug red %} Force apps to foreground before sending key combos
: {% icon bug red %} Pause Bunch item processing while sending key commands for better consistency
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
: {% icon bug red %} Regression in schedule handling
: {% icon bug red %} Fixes for changing Bunch Folder preferences and storing recents

---

1.4.0 (β80)
: If a background color is set for a `display` text file but no foreground, pick a contrasting color
: If a background color is specified for text or HTML display windows, change the window to dark mode appearance if the color is less than 50% brightness
: Enable edit menu commands (copy/paste/etc.) in display commands windows
: Don't cut top off scrolling quick look previews
: Allow text preview/file watching of any file with a text mime-type, not just .txt and .log
: {% icon bug red %} Ensure all window updates happen on the main thread
: {% icon bug red %} Quick Look windows via `display` command set to wallpaper level were empty

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
: {% icon bug red %} Attempt to fix Preference layout on 10.13
: {% icon bug red %} Open-only Bunches not launching

---

1.4.0 (β78)
: Quick fix to clean up some debug logging

---

1.4.0 (β77)
: Major overhaul of shell command runner
: [__Task monitors__]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#monitoring-scripts) for shell scripts launched by a Bunch
: [__(display) command__]({{ site.baseurl }}/docs/bunch-files/commands/display/) for positionable floating windows containing local HTML, web sites, text or log files, or other file types as Quick Look previews
: Specify [__multiple days/times in scheduling frontmatter__]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches/), e.g. `open on: M W F 8am, T Th 10am`
: Assign a [__global keyboard shortcut__]({{ site.baseurl }}/docs/using-bunch/keyboard-control/) for opening Bunch menu in menu bar mode
: Assign __keyboard shortcuts for each Bunch__ using [`shortcut:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts)
: More keyboard shortcuts for internal commands
: Make default keyboard shortcuts for opening Bunches single numbers without modifiers (like ⌘)
: Use `${variables}` inside of Bunches (like you would in Snippets), populated by frontmatter keys or manually when calling a Bunch from a Bunch. [Documentation]({{ site.baseurl }}/docs/bunch-files/variables/)
: [`ignores state:` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#behavior) to allow open bunches to reopen, closed bunches to re-close
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
: {% icon bug red %} file watchers not deallocating
: {% icon bug red %} Don't make preference window float above all other windows if running in Dock mode
: {% icon bug red %} allow Bunch main menu to appear when run in Dock Mode
: {% icon bug red %} Remove notification and stop timer when countdown clicked
: {% icon bug red %} F1-F12 not working as {keyboard combos}

: {% icon bug red %} Process variables before importing snippets so that placeholders can be used for snippet fragments (`<snippet#${fragmentvar}`)
: {% icon bug red %} Keyboard focus for popups buttons and text fields in interactive dialogs
: {% icon bug red %} Scheduled open/close being invalidated after opening
: {% icon bug red %} Allow keyboard focus for popup buttons and text fields in interactive dialogs
: {% icon bug red %} Shell scripts in sequential mode fully wait for previous task to complete
: {% icon bug red %} Close Items in wouldn't close if the Bunch wasn't open, now forces

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
: Accept more Unicode characters in key combo strings (`↩`, `␣`, `⎋`, etc.)
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
: Move initial Bunch Folder location to \~/Documents/Bunches
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
: If a Bunch is launched by another Bunch, affect its check mark
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
: Allow Option-click on checked Bunch to clear check mark
: AppleScript command "process text" to process raw Bunch commands

---

1.3.0
: Fix for delayed apps not quitting on close

---

1.2.9
: Better at maintaining "open" check marks
: Reduce delay when storing and changing wallpaper
: Add option to delay a launch or command with \~X at the end of line
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
: Allow URLs to be [opened in a specific browser](#specificbrowser).

---

1.2.2
: Change escape codes for up and down from "\\\\p" and "\\\\n" to "\\\\u" and "\\\\d"
: Add \\\\h delete, \\\\a home, \\\\e end escape codes
: Allow leading and trailing space for `[ typed string ]` commands
: Allow system key names in key commands, e.g. {@up}
: Allow Unicode characters for arrow keys, e.g. {@↑}
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
: Menu command to clear check marks in toggle/single bunch mode (force launched Bunches to launch again)
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
: Toggle Bunches mode, check mark opened Bunches, click check marked Bunch to close
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
: Allow URL schemes (in addition to HTTP)
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
