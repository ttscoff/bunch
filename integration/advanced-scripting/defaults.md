---
layout: default
title: Getting Preferences
parent: Advanced Scripting
grand_parent: Integration
tags: [scripts]
---
# Getting Bunch Preferences in a Script
{:.no_toc}

There are several ways to access Bunch's preferences from scripts. The most useful preference to get to is the location of your current Bunch Folder, but you may have cause to check other settings.

* Table of Contents
{:toc}

## Using the defaults Command

You can access various preferences from the command line using `defaults`. The following will return the current location of your Bunch files:

    defaults read com.brettterpstra.bunch configDir

Getting a list of available bunches is as easy as doing an `ls *.bunch` on that folder.

You can also check the "Toggle Bunches" and "Single Bunch Mode" settings:

```bash
defaults read com.brettterpstra.bunch toggleBunches
defaults read com.brettterpstra.bunch singleBunchMode
```

## Using the Command Line Tool

You can also use the [Bunch CLI]({{ site.baseurl }}/docs/integration/cli/) to query specific keys.

```bash
$ bunch --show-config-key dir
/Users/username/bunches

$ bunch --show-config-key toggle
true
```

## Using AppleScript

Lastly, you can retrieve some settings via AppleScript:

```applescript
tell application "Bunch" to get preference "Bunch Folder"
```

See the [AppleScript documentation for more details]({{ site.baseurl }}/docs/integration/applescript/#prefs).
