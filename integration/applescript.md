---
layout: default
title: AppleScript Dictionary
parent: Integration
nav_order: 10
tags: [scripting,applescript]
---
# The Bunch AppleScript Dictionary

Bunch provides an AppleScript dictionary that you can use to open, close, and toggle Bunches, process raw text, or access snippets.

## Open, close, and toggle Bunches

```applescript
tell application "Bunch" to open bunch "Comms"

tell application "Bunch"
    close bunch "Default"
    toggle bunch "Comms"
end tell
```

## Process raw Bunch text

You can also process raw Bunch text:

```applescript
tell application "Bunch"
    process text "(dnd on)"
end tell
```

> Tip: Use `\n` in the string to add newlines, useful for adding dashed parameters/variables when calling scripts or snippets.
{:.tip}

> Tip: raw text processing is also useful in scripts where you want to read in the contents of a Bunch, modify them in some way, then execute the result. It won't mark that Bunch as "open" when it executes, but it's one way to add dynamic processing.
{:.tip}

## Snippets, fragments, and variables

You can access snippets directly with options to target fragments and pass variables.

```
run snippet text ¬
     fragment text ¬
     with variables text
```

Parameters

| Parameter | Required | Type | Description |
| :--- | :--- | :--- | :--- |
direct parameter | required |    text |    snippet path, absolute or relative to configured Bunch folder |
| fragment |    optional  |  text    | fragment specifier |
| with variables | optional | text | query string formatted list of key/values |

The `with variables` parameter accepts a string of text formatted like a URL query string, with `key=value` pairs separated by ampersands (&). If your value needs to include an actual ampersand, url encode it as `%26` in the query string.

```applescript
tell application "Bunch"
    run snippet "useful.snippets" fragment "Spotify" with variables "url=spotify:playlist:4AEt6vXGJYmyOEE8zzgvjQ&autoplay=false"
end tell
```
