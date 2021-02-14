---
layout: default
title: Keystrokes
parent: Bunch Files
---
# Sending keystrokes and combos
{:.no_toc}
    
* Table of Contents
{:toc}

Bunch can send keyboard commands and strings directly to applications, triggering keyboard shortcuts or entering entire strings.

## A Note for macOS 10.14 Mojave and Older Users

If you're running macOS 10.15 (Catalina) or newer, Bunch makes use of CGEvents to send keystrokes and key combinations very quickly to apps, even if they're in the background. This is the ideal way to perform these functions; it's fast and reliable. But...

If you're on 10.14 (Mojave) or older, Bunch doesn't have a reliable way of making sure the app is ready to receive keystrokes while it's running, so it uses Apple Events, which queue up and wait until the app is ready for them. This is slower and can have significant pauses.

## Sending Key Combinations {#keycombo}

If a file parameter (a dashed line after app name) is surrounded by curly brackets (`{}`), it is read as a sequence of keyboard shortcuts which are sent to the app. These allow special symbols for modifier keys:

| symbol   | key     |
| :------: | :---    |
| $        | Shift   |
| ~        | Option  |
| @        | Command |
| ^        | Control |


Example: The Git app Tower doesn't respond to the AppleScript "close every window" command, so using `- XX` doesn't work. Instead, you can send the "Close All Windows" shortcut, Command-Option-W, to the app like this:

    Tower
    - {@~w}
    - ~/Code/Bunch

To send multiple shortcuts, just separate them with a space, i.e. `{@a @c @$~v}` to select all, copy, and paste without formatting in the specified app.

You can include system keys (arrows, delete key, function keys, etc.) by using their name, such as `@~up` (Option-Command-Up Arrow) or `@$F12` (Shift-Command-F12). These can also be written as hyphenated strings using the longer formats for modifier keys, e.g. `cmd-opt-up` or even `command-option-up`. This format can still be combined with multiple keystrokes separated by spaces, e.g. `{opt-left cmd-up}` to hit Option-Left Arrow followed by Command-Up Arrow. Arrow keys can also be referenced by using their unicode symbols like `↑` or `↓`.

### Repeating Keys

You can repeat key combos multiple times by surrounding them in parenthesis immediately followed by a number. To hit `⌘}` to switch tabs 5 times, you would use `{(@$])5}`. Multiple key combinations can be listed within the parenthesis, so `{@t (@d @$d)4}` becomes `{@t @d @$d @d @$d @d @$d @d @$d}`. If you want to see a dumb trick, try that one with iTerm.

> Because double quotes are used for [typing strings within curly brackets](#combined), if you need to send a key combo containing a double quote, specify it as `$'` (Shift-single quote).
{:.warning}

###### System Key Names {#systemkeys}

The following names are recognized:

| left/&larr;       |
| right/&rarr;      |
| down/&darr;       |
| up/&uarr;         |
| esc, escape       |
| pgdown            |
| pgup              |
| home              |
| end               |
| f1, f2, ... , f20 |
| del, delete       |
| tab               |
| return            |
| enter             |
| space             |
| shift             |
| opt, option       |
| ctrl, control     |
| cmd, command      |

## Typing Strings {#typingstrings}

You can also type strings in a specific app using square brackets (`[]`). To open TextEdit, create a new document, and type out "Testing something," you would use:

```
TextEdit
- {@n}
- [Testing something]
```

(You can also combine these two lines now, [see the next section](#combined).)

You can use "escape" codes (letters preceded by a double backslash, e.g. `\\n`) in a typed string to press some "special" keys:

| escape |      key      |      mnemonic      |
|--------|---------------|--------------------|
| `\\n`  | Return        | newline            |
| `\\t`  | Tab           | tab                |
| `\\s`  | Space (force) | space              |
| `\\b`  | Left Arrow    | back               |
| `\\f`  | Right Arrow   | forward            |
| `\\u`  | Up Arrow      | up                 |
| `\\d`  | Down Arrow    | down               |
| `\\a`  | Home          | ask emacs          |
| `\\e`  | End           | end                |
| `\\h`  | Delete        | unix...            |
| `\\x`  | Escape        | e was already used |


Example: `- [\\n\\n\\tThis has two newlines and an indent before it\\n]`

> Tip: If you want to send a lot of special characters while typing, it's often better to use the bracket syntax and quote the typed strings, e.g. `{(tab)3 "my text" return @s}`.
{:.tip}

> Tip: If you're a TextExpander user and need your Bunch to type a long string, you can make use of TextExpander's ability to type out text with almost zero lag by sending a snippet trigger to a text field. Just send enough `{key combos}` to focus the field you need, then trigger your TextExpander snippet with its abbreviation.
{:.tip}

## Combining Key Combos and Typed Strings {#combined}

You can also include typed strings within the curly brackets notation for key combos by surrounding the text you want to type with double quotes. These are treated like [square bracket lines](#typingstrings).

> __Minimum OS Requirement:__ typing text strings within curly brackets does not work well on 10.14 (Mojave) or earlier. If you're on an older version of macOS, stick with sending key combos in curly brackets, and typed strings in square brackets on separate lines.
{:.warning}

The example in the above section can be condensed down to:

```
TextEdit
- {@n "Testing something"}
```

To send an email in MailMate, you might use something like:

```
MailMate
- {@n "me@dummy.com" tab "An email subject" tab "This is an email\\n\\nSincerely,\\nBrett" @$d}
```

## Inserting a Pause

You can pause between strings by inserting a file line between key commands containing `(pause 5)` (for a 5 second pause). The delay must be a positive integer representing a number of seconds, with no letters or decimals.

```
TextEdit
- {@n "Typing in the first file" @n}
- (pause 3)
- [typing in the second file]
```

