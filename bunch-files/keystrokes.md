---
layout: default
title: Keystrokes
parent: Bunch Files
tags: [keystrokes, apps]
---
# Sending keystrokes and combos
{:.no_toc}
    
* Table of Contents
{:toc}

Bunch can send keyboard commands and strings directly to applications, triggering keyboard shortcuts or entering entire strings.

> ### macOS 10.14 (Mojave) and Older
>
> If you're running macOS 10.15 (Catalina) or newer, Bunch makes use of CGEvents to send keystrokes and key combinations very quickly to apps, even if they're in the background. This is the ideal way to perform these functions; it's fast and reliable. But...
>
> If you're on 10.14 (Mojave) or older, Bunch doesn't have a reliable way of making sure the app is ready to receive keystrokes while it's running, so it uses Apple Events, which queue up and wait until the app is ready for them. This is slower and can have significant pauses.
{:.warning}

## Sending Key Combinations {#keycombo}

If a file parameter (a dashed line after app name) is surrounded by curly brackets (`{}`), it is read as a sequence of keyboard shortcuts which are sent to the app. These allow special symbols for modifier keys:

| symbol   | key         |
| :------: | :---        |
| __$__    | Shift       |
| __~__    | Option      |
| __@__    | Command     |
| __^__    | Control     |
| __%__    | Hyper Key\* |


\* The Hyper key is a custom key that sends Control, Shift, Option, and Command all at once. It's the equivalent of `^$~@`.

> If you want to actually send any of these special keys as part of a key combination, just use the Shift Number equivalent. E.g. to send an actual dollar sign, use `$4`, or to send a command-%, use `@$5`.
{:.tip}

__Example:__ The Git app Tower doesn't respond to the AppleScript "close every window" command, so using `- XX` doesn't work. Instead, you can send the "Close All Windows" shortcut, Command-Option-W, to the app like this:

    Tower
    - {@~w}
    - ~/Code/Bunch

To send multiple shortcuts, just separate them with a space, i.e. `{@a @c @$~v}` to select all, copy, and paste without formatting in the specified app.

You can include system keys (arrows, delete key, function keys, etc.) by using their name, such as `@~up` (Option-Command-Up Arrow) or `@$F12` (Shift-Command-F12). These can also be written as hyphenated strings using the longer formats for modifier keys, e.g. `cmd-opt-up` or even `command-option-up`. This format can still be combined with multiple keystrokes separated by spaces, e.g. `{opt-left cmd-up}` to hit Option-Left Arrow followed by Command-Up Arrow. 

Keys can also be referenced by using their unicode symbols like `↑`, `↓` `⌅`, and `␣`.

    Gradius
    - {↑ ↑ ↓ ↓← → ← → b a ↩}

### Repeating Keys

You can repeat key combos multiple times by surrounding them in parenthesis immediately followed by a number. To hit `⌘}` to switch tabs 5 times, you would use `{(@$])5}`. Multiple key combinations can be listed within the parenthesis, so `{@t (@d @$d)4}` becomes `{@t @d @$d @d @$d @d @$d @d @$d}`. If you want to see a dumb trick, try that one with iTerm.

> Because double quotes are used for [typing strings within curly brackets](#combined), if you need to send a key combo containing a double quote, specify it as `$'` (Shift-single quote).
{:.warning}

### System Key Names {#systemkeys}

The following names are recognized:

| Input                                 | Result                      |
| -----------------:                    | :-------------------------- |
| <kbd>left</kbd>/<kbd>&larr;</kbd>     | Left Arrow (←)              |
| <kbd>right</kbd>/<kbd>&rarr;</kbd>    | Right Arrow (,→)            |
| <kbd>down</kbd>/<kbd>&darr;</kbd>     | Down Arrow (↓)              |
| <kbd>up</kbd>/<kbd>&uarr;</kbd>       | Up Arrow (↑)                |
| <kbd>esc</kbd>, <kbd>escape</kbd>     | Escape Key (⎋)              |
| <kbd>pgdown</kbd>                     | Page Down (⇟)               |
| <kbd>pgup</kbd>                       | Page Up (⇞)                 |
| <kbd>home</kbd>                       | Home (↖)                    |
| <kbd>end</kbd>                        | End (↘)                     |
| <kbd>f1, f2, ... , f20</kbd>          | Function Keys (fn-1)        |
| <kbd>bksp</kbd>, <kbd>backspace</kbd> | Backspace (⌫)               |
| <kbd>del</kbd>, <kbd>delete</kbd>     | Forward Delete (Del) (Fn-⌫) |
| <kbd>tab</kbd>                        | Tab (⇥)                     |
| <kbd>return</kbd>                     | Return (↩)                  |
| <kbd>enter</kbd>                      | Enter (⌅) (Fn-↩)            |
| <kbd>space</kbd>                      | Space Bar (␣)               |
| <kbd>shift</kbd>                      | Shift Modifier (⇧)          |
| <kbd>opt</kbd>, <kbd>option</kbd>     | Option Modifier (⌥)         |
| <kbd>ctrl</kbd>, <kbd>control</kbd>   | Control Modifier (⌃) (CTRL) |
| <kbd>cmd</kbd>, <kbd>command</kbd>    | Command Modifier (⌘) (CMD)  |

### Sending Global Key Combinations

The standard way to use key combos is to send them to a specific application, as shown above. It is possible, though, to send a global key command that will trigger any actions, services, or apps with global listeners. To do so, just put the key command on its own line with no preceding dash:

    {@$F1}

That sends Command-Shift-F1 as a general keystroke. You can trigger global key combos when closing a Bunch by using the "double negative" syntax:

    !!{@$F1}

### Adding Pauses to Key Combos {#combopause}

You can include a pause in a key command sequence using `!` immediately followed by a number, e.g. `!2` for a 2-second pause. So to hit {% kbd ⌘N %} to create a new window, then wait a few seconds for the window to load before continuing, you would use:

```bunch
TextEdit
- {@n !3 "This is a new window"}
```

The delay must be a positive integer representing a number of seconds, with no decimals.

## Typing Strings {#typingstrings}

You can also type strings in a specific app using square brackets (`[]`). To open TextEdit, create a new document, and type out "Testing something," you would use:

```bunch
TextEdit
- {@n}
- [Testing something]
```

(You can also combine these two lines now, [see the next section](#combined).)

You can use "escape" codes (letters preceded by a double backslash, e.g. `\\\\n`) in a typed string to press some "special" keys:

| Code      | Key             | Mnemonic             |
| --------: | --------------- | -------------------- |
| `\\\\\\n` | Return          | newline              |
| `\\\\\\t` | Tab             | tab                  |
| `\\\\\\s` | Space (force)   | space                |
| `\\\\\\b` | Left Arrow      | back                 |
| `\\\\\\f` | Right Arrow     | forward              |
| `\\\\\\u` | Up Arrow        | up                   |
| `\\\\\\d` | Down Arrow      | down                 |
| `\\\\\\a` | Home            | ask emacs            |
| `\\\\\\e` | End             | end                  |
| `\\\\\\h` | Backspace       | ask unix...          |
| `\\\\\\x` | Escape          | e was already used   |
| `\\\\\\!X`| Pause for X seconds                   ||

Example: `- [\\\\n\\\\n\\\\tThis has two newlines and a tab indent before it\\\\n]`

> Tip: If you want to send a lot of special characters while typing, it's often better to use the bracket syntax and quote the typed strings, e.g. `{(tab)3 "my text" return @s}`.
{:.tip}

### Adding Pauses to Typed Strings {#typedpause}

You can pause typing for any number of seconds using `\\\\!` followed by a number within a typed string (this works in interpolated strings as well):

```bunch
- [This is a dramatic \\\\!5pause]
```

The delay must be a positive integer representing a number of seconds, with no decimals.

### Using Variables in Typed Strings

If you want to insert the contents of a variable in a typed string, you should use the `/typed` transform to ensure that newlines are converted to `\\\\n` when typing it out.

```bunch
TextEdit
- [Type this out: ${var_name/typed}]
```

## Combining Key Combos and Typed Strings {#combined}

You can also include typed strings within the curly brackets notation for key combos by surrounding the text you want to type with double quotes. These are treated like [square bracket lines](#typingstrings).

> __Minimum OS Requirement:__ typing text strings within curly brackets does not work well on 10.14 (Mojave) or earlier. If you're on an older version of macOS, stick with sending key combos in curly brackets, and typed strings in square brackets on separate lines.
{:.warning}

The example in the above section can be condensed down to:

```bunch
TextEdit
- {@n "Testing something"}
```

To send an email in MailMate, you might use something like:

```bunch
MailMate
- {@n "me@dummy.com" tab "An email subject" tab "This is an email\\n\\nSincerely,\\nBrett" @$d`}
```

## Inserting a Pause {#pause}

In addition to the `!` syntaxes above, you can pause between strings by inserting a file line between key commands containing `(pause 5)` (for a 5 second pause). The delay must be a positive integer representing a number of seconds, with no letters or decimals.

```bunch
TextEdit
- {@n "Typing in the first file" @n}
- (pause 3)
- [typing in the second file]
```
