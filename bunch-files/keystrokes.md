---
layout: default
title: Sending Keystrokes
parent: Bunch Files
---
# Sending keystrokes and combos

Bunch can send keyboard commands and strings directly to applications, triggering keyboard shortcuts or entering entire strings.

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

As of version 1.2.2 you can now include system keys (arrows, delete key, function keys, etc.) by using their name, such as `@~up` (Option-Command-Up Arrow) or `@$F12` (Shift-Command-F12). These can also be written as hyphenated strings using the longer formats for modifier keys, e.g. `cmd-opt-up` or even `command-option-up`. This format can still be combined with multiple keystrokes separated by spaces, e.g. `{opt-left cmd-up}` to hit Option-Left Arrow followed by Command-Up Arrow. Arrow keys can also be referenced by using their unicode symbols like `↑` or `↓`.

###### System Key Names {#systemkeys}

The following names are recognized:

- left/←
- right/→
- down/↓
- up/↑
- esc, escape
- pgdown
- pgup
- home
- end
- f1, f2, ... , f20
- del, delete
- tab
- return
- enter
- space
- shift
- opt, option
- ctrl, control
- cmd, command
- capslock

## Typing Strings {#typingstrings}

You can also type strings in a specific app using square brackets (`[]`). To open TextEdit, create a new document, and type out "Testing something," you would use:

    TextEdit
    - {@n}
    - [Testing something]

You can use "escape" codes (letters preceded by a double backslash, e.g. `\\n`) in a typed string to press some "special" keys:

| escape | key | mnemonic |
| ------ | --- | -------- |
| `\\n` | Return| newline |
| `\\t` | Tab | tab |
| `\\s` | Space (force) | space |
| `\\b` | Left Arrow | back |
| `\\f` | Right Arrow| forward |
| `\\u` | Up Arrow | previous |
| `\\d` | Down Arrow | next |
| `\\a` | Home | ask emacs |
| `\\e` | End | end |
| `\\h` | Delete | unix... |

Example: `- [\\n\\n\\tThis has two newlines and an indent before it\\n]`
