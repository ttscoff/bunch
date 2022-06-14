---
layout: default
title: AppleScript Dictionary
parent: Integration
nav_order: 10
top_menu: true
tags: [scripting,applescript]
---
# The Bunch AppleScript Dictionary
{:.no_toc}

Bunch provides an AppleScript dictionary that you can use to open, close, and toggle Bunches, process raw text, or access snippets.

* Table of Contents
{:toc}

## List all Bunches

The following commands return AppleScript lists:

```applescript
-- list all Bunches in current Bunch Folder
tell application "Bunch" to list bunches

-- list currently open Bunches
tell application "Bunch" to list open bunches
```

> You can test if a particular Bunch is open by searching for its name in `list open bunches` (e.g. `if (list open bunches) contains`). You can also get a list of _closed_ bunches by getting the full list (`list bunches`) and removing items in `list open bunches`. It's not the easiest approach, I know, but I haven't had a need for these options yet, so I haven't added methods for them.
{:.tip}

## Open, close, and toggle Bunches


```applescript
tell application "Bunch" to open bunch "Comms"

tell application "Bunch"
    close bunch "Default"
    toggle bunch "Comms"
end tell
```

{% available 119 %}

## Acting on tagged Bunches {#tags}
{:.method}

You can also act on [tagged]({{ site.baseurl }}/docs/bunch-files/tags/) Bunches

```applescript
-- list bunches containing tag string
tell application "Bunch" to list bunches tagged "tag1+tag2"

-- perform actions on all Bunches matching tag (or tag combo)
tell application "Bunch"
    open tag "Tag1"
    close tag "Tag2+Tag3"
    toggle tag "Tag2,Tag3"
end tell
```

{% endavailable %}

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
    run snippet "useful.snippets" fragment "Spotify" with variables "url=spotify:​playlist:4AEt6vXGJYmyOEE8zzgvjQ&autoplay=false"
end tell
```

## Preferences {#prefs}

You can retrieve several of Bunch's preferences using AppleScript, which avoids the need to use `defaults` in shell scripts.

```applescript
tell application "Bunch"
   get preference "Bunch Folder"
end tell
```

All values are returned as text. Boolean values (which is everything other than "Bunch Folder" and "Debug Level") will return text containing either "0" (false) or "1" (true). Debug Level returns text containing a number between 0 (errors only) and 4 (debug messages).

When returning a preference, Bunch just looks for keywords. As long as the text given to `get preference` includes one of the following words, it will return the associated preference:

|         Keyword         |     Preference    |
|-------------------------|-------------------|
| "folder" or "directory" | Bunch Folder      |
| "toggle"                | Toggle Bunches    |
| "single"                | Single Bunch Mode |
| "debug"                 | Debug Level (0-4) |
| "preserve"              | Preserve Bunches  |

{% available 120 %}

## Refresh Browsers {#refresh}

If your Bunches make use of the [display command]({{ site.baseurl }}/docs/bunch-files/commands/display/) to create single site browsers, you can reload their contents via AppleScript. This takes effect on all browsers opened by a Bunch, or you can affect _all_ open browsers. You can't currently target a specific browser window.

To refresh every open browser:

```applescript
tell application "Bunch"
    refresh browsers
end tell
```

To refresh only browsers opened by a specific bunch:

```applescript
tell application "Bunch"
    refresh browsers for bunch "Bunch Name"
end
```

The bunch name is case insensitive and the best match will be targeted.

{% endavailable %}
