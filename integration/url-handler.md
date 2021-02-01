---
layout: default
title: URL Handler
parent: Integration
nav_order: 5
---
Bunch has its own URL scheme (`x-bunch:`) that you can call from other apps and scripts.

> Tip: You can use urls with apps like [BetterTouchTool](/bunch/docs/integration/bettertouchtool) and [Keyboard Maestro](/bunch/docs/keyboard-maestro) to assign Bunch actions to hotkeys, buttons and other triggers. If you have a [cool programmable keypad](https://shop.pimoroni.com/products/keybow) or a [Stream Deck](/bunch/docs/stream-deck), just imagine the possibilities...
>
> Just create an action that opens a URL and use something like `x-bunch://toggle/BunchName` to create a hotkey or button that toggles a Bunch. You can create a whole launch control panel on a Stream Deck with these, for example.
{:.tip}

> Tip: The Bunch CLI can generate URLs that run various commands for use in other applications. Run `bunch -i` to interactively build a URL.

Methods:

- [`open`](#urlhandleropen)
- [`close`](#urlhandlerclose)
- [`toggle`](#urlhandlertoggle)
- [`raw`](#urlhandlerraw)
- [`refresh`](#urlhandlerrefresh)
- [`setPref`](#urlhandlersetpref)
- [`snippet`](#urlhandlersnippet)

See the [`x-success` parameter](#urlhandlerxsuccess) to control what happens after a URL method is executed.

## `open` {#urlhandleropen}

The full version of the open method is `x-bunch://open?bunch=[BUNCH NAME]`. The url can be shortened, though, to just the Bunch name: `x-bunch://[BUNCH NAME]`.

### Parameters

`bunch`
: (_String_) The name of the bunch to open, without the `.bunch` extension

### Examples

```bash
# Full URL
open 'x-bunch://open?bunch=Comms'

# Shortcut URL
open 'x-bunch://Comms'
```

> The Bunch name in the URL handler is case insensitive, so "bunch name" works just as well as "Bunch Name." Bunch _does_ need to already be running in order to execute a bunch via the URL handler. You can always launch Bunch with `open -a Bunch` from a script, but you'll need to give it enough time to initialize.
{:.tip}

> Tip: If you have a task in a task manager that requires a certain set of apps, create a Bunch and then add a link to the task's notes: `x-bunch://open/WorkBunch`
{:.tip}

## `close` {#urlhandlerclose}

You can also close a Bunch with `x-bunch://close?bunch=[BUNCH NAME]`, or just `x-bunch://close/[BUNCH NAME]`.

### Parameters

`bunch`
: (_String_) The name of the bunch to close, without the `.bunch` extension

### Examples

```bash
# Full URL
open 'x-bunch://close?bunch=Comms'

# Shortcut URL
open 'x-bunch://close/Comms'
```

## `toggle` {#urlhandlertoggle}

You can also toggle the Bunch --- opening if it's closed, closing if it's open --- using `x-bunch://toggle?bunch=[BUNCH NAME]`. Like the other methods, this also works as `x-bunch://toggle/[BUNCH NAME]`. This works even if "Toggle Bunches" isn't enabled.

If using the "Toggle Bunches" option, Bunches opened/closed via the URL handler will automatically set the launched state of the Bunch in the Dock menu. The `open` and `close` commands will not toggle Bunches; the commands will execute regardless of current Bunch state.

### Parameters

`bunch`
: (_String_) The name of the bunch to toggle, without the `.bunch` extension

### Examples

```bash
# Full URL
open 'x-bunch://toggle?bunch=Comms'

# Shortcut URL
open 'x-bunch://toggle/Comms'
```

## `raw` {#urlhandlerraw}

You can pass Bunch commands and directives directly through the URL handler. With this you can specify a path to a Bunch file outside of your Bunches folder, or even pass a url-encoded string containing Bunch directives.

### Parameters

Only one of `file` or `txt` should be specified

`file`
: (_String_) Either an absolute path or a path relative to the configured Bunches folder. If this is provided, any `txt` parameter will be ignored

`txt`
: (_String_) URL encoded text text contents to process as if read from a file

### Examples

```bash
# Open a Bunch file with `file` param:
open 'x-bunch://raw?file=~/MiscBunch.bunch'

# Pass Bunch contents directly with `txt` param:
open 'x-bunch://raw?txt=(dnd on)'
```
## `refresh` {#urlhandlerrefresh}

Force Bunch to reload Bunch files. This should happen automatically if you make changes to the Bunches folder while Bunch is running, but use this if you want to ensure an update.

### Examples

```bash
open 'x-bunch://refresh'
```

## `setPref` {#urlhandlersetpref}

You can set and toggle certain preferences with the `setPref` method. All boolean parameters accept 0 and 1, as well as "true" or "false", or "yes" or "no".

### Parameters

`configDir`
: (_String_) Absolute path to Bunches folder

`toggleBunches`
: (_Boolean: 0 or 1_) Set __Toggle Bunches__ mode

`singleBunchMode`
: (_Boolean: 0 or 1_) Set __Single Bunch Mode__

`preserveOpenBunches`
: (_Boolean: 0 or 1_) Set __Restore Open Bunches on Launch__

`debugLevel`
: (_Integer: 0-4_) Set the logging level for the [Bunch Log](/bunch/docs/using-bunch/bunch-log/)

### Examples

```bash
# Enable Toggle Bunches mode
open 'x-bunch://setPref?toggleBunches=1'

# Change the Bunches folder
open 'x-bunch://setPref?configDir=~/Dropbox/Sync/Bunches'
```

> Tip: You can use this URL handler to easily switch between sets of Bunches using external tools. For example, you could add a button to your Touch Bar [using BetterTouchTool](/bunch/docs/integration/bettertouchtool/) to trigger a URL like `x-bunch://setPref?configDir=~/Dropbox/Sync/WorkBunches`, or create a [Keyboard Maestro](/bunch/docs/integration/keyboard-maestro/) macro that toggled between two folders.

## `snippet` {#urlhandlersnippet}

You can directly load a [snippet](/bunch/docs/bunch-files/snippets.html) and define variables with the `snippet` method. This allows you to load files containing [variables](/bunch/docs/bunch-files/snippets.html#snippetvariables) and to use the [snippet fragment feature](/bunch/docs/bunch-files/snippets.html#fragments) to load just a portion of a snippet.

This URL method can be shortened to `snippet/SNIPPET_FILE/FRAGMENT?variables=foobar`.

### Parameters

`file`
: (_String_) The path to the snippet file. Assumes this is a relative path from your Bunch folder unless an absolute path is provided. If the snippet file is in the root of your Bunch folder, you can provide just the filename

`fragment` (_Optional_)
: (_String_) To load just a section of the snippet ([as defined by `#[section title]` lines](/bunch/docs/bunch-files/snippets.html#fragments)), pass the name of the fragment here.

Additional variables (_Optional_)
: Any additional query parameters added to the url string will be passed as [key=value replacements to the snippet](/bunch/docs/bunch-files/snippets.html#snippetvariables)

### Examples

```bash
# Load a snippet file called "useful.snippets", 
# targeting the "Music" section, and passing a 
# value to the "playlist" variable, call:
open 'x-bunch://snippet?file=useful.snippets&fragment=Music&playlist=spotify:playlist:3cSpIL4Q0H3uqdBMbT6c9x'

# Path syntax, loading "useful.snippets", targeting 
# the "Speak" fragment, and passing two variables
open 'x-bunch://snippet/useful.snippets/Speak?var1=foo&var2=bar%20baz'
```

## Additional parameters

### Calling an app or URL after running a method {#urlhandlerxsuccess}

All url methods accept an `x-success` parameter which can define a bundle ID or url to open after executing the method. By default this happens after a 5-second delay, but you can modify that with an `x-delay` parameter (number of seconds as integer).

`x-success`
: (_String_) If this is a valid bundle identifier, e.g. `com.brettterpstra.marked2`, that application will be launched. It can also be any valid app name, but using the bundle ID prevents most issues with multiple versions of apps or apps having a different display name than what the system recognizes
: If this is a valid URL, that URL will be opened. This can be used with url handlers of other applications, e.g. `x-marked://open/documentation.md`

`x-delay`
: (_Integer_) If specified, the number of seconds Bunch will wait before calling the `x-success` value. If `x-success` is a bundle ID, that app will be launched immediately but not activated until after the delay

#### Examples

```bash
# Open a bunch and then open Marked 2 after a 15-second delay
open 'x-bunch://open?bunch=Comms&x-success=com.brettterpstra.marked2&x-delay=15'

# Open iThoughts using its URL handler (default 5-second delay)
open 'x-bunch://open/Comms&x-success=ithoughts://'
```
