---
layout: default
title: External Files
nav_order: 30
parent: Interactivity
grand_parent: Bunch Files
tags: [interactivity,interactive,dialog]
---
# Populating Dialogs with External Files
{:.no_toc}

* Table of Contents
{:toc}

Similar to snippet syntax, you can read a list of multiple choice dialog options from an external file or script using `?< FILEPATH`. Bunch recognizes several different file types (YAML, JSON, text), as well as executable scripts.

Reading from files works for [multiple choice dialogs]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/) only, not for [text input]({{ site.baseurl }}/docs/bunch-files/interactivity/populating-variables/#textinput) requests or [checkbox arrays]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/#checkbox).

You can specify the title of the dialog by including the desired text in quotes after the filename.

```bunch
?< scripts/Menu Source.json "Pick your Poison"
```

## YAML

If the file has a `.yaml` or `.yml` extension, it's contents will be read as YAML. The structure should either be an array of strings, or an array of key/value pairs. A dictionary of key/value pairs will work, but order can't be preserved.

Example YAML input, array of key/value pairs:

```yaml
---
- Option 1: "This is the value of option 1"
- Option 2: "This is the value of option 2"
```

## JSON

If the file has a `.json` extension, it will be read as JSON. The structure should either be an array of strings or an array of key/value pairs.

Example JSON input, array of key/value pairs:

```json
[
    {"Option 1":"Value 1"},
    {"Option 2":"Value 2"}
]
```

## Plain Text

If a file has the extension `.txt`, its contents are read as a list, one item per line. If a line is formatted as a dictionary line, e.g. `Title => Value`, it will be interpreted as such. A line that doesn't contain `=>` will be interpreted as a regular string, used for both title and value of the menu option.

Example text input, dictionary format:

```
Option 1 => Value 1
Option 2 => Value 2
```

## Executable Script

If the file specified has neither YAML, JSON, or `.txt` extensions, it's checked to see if it's executable. If it is, its output is read and determined to be YAML, JSON, or plain text.

> To make your script executable, run `chmod a+x /path/to/script` in Terminal.
{:.tip}

A script should have a shebang line (e.g. `#! /bin/zsh`) and return output in JSON, YAML, or plain text format. The format will be automatically determined, first by attempting to parse it as JSON, then as YAML, and finally assuming a plain text list of options.

> AppleScript `.scpt` files are not currently supported. If you want to use an AppleScript to populate the menu, save it as a plain text `.applescript` file, insert `#!/usr/bin/osascript` as the first line of the file, and make it executable. Then just use `?< MyScript.applescript` to run it.
{:.tip}

## Checkbox Dialogs from External Files

You can't use `?<` syntax to populate a [checkbox dialog]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/#checkbox), but you can use a snippet to directly load options for a menu. As long as the text file is written in the GitHub style checkbox format, you can just include it as a snippet and the options will be presented.

A text file called `apps.txt` written to by a script (or whatever):

```
-[x] TaskPaper
-[ ] OmniFocus
```

Then in the Bunch, just add:

```bunch
<apps.txt
```

When the Bunch is opened, the app options are presented. Apps opened by the Bunch are also closed when the Bunch closes (if the Bunch toggles). You could take this a step further and make the whole dialog optional, too:

```bunch
<apps.txt ?"Load additional apps?"
```

Now you'll get a prompt, and if you cancel it the checkbox dialog will be skipped. Just in case you wanted to get crazy with it.
