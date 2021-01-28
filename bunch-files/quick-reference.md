---
layout: default
title: Syntax Reference
parent: Bunch Files
nav_order: 2
---
# Quick Reference

|Bunch Line|Action|
|:----|:----|
| __Apps__ |
|`App Name`|_[Launch app](/bunch/docs/bunch-files/apps#launchingapps)_|
|`%AppName`|_Launch when opening the Bunch, but [ignore when closing](/bunch/docs/bunch-files/ignore-on-close.html)_|
|`AppName ~5`|_[Launch app after 5 second delay](/bunch/docs/bunch-files/delay)_|
|`- XX`|_[close all windows](/bunch/docs/bunch-files/apps.html#closingwindows) of preceding app_|
|`- File`|_[open a file](/bunch/docs/bunch-files/apps.html#openingfiles) in preceding app (can be repeated)_|
|`- 'spotlight search'` | _Run a spotlight search and open the results in preceding app_ |
| `- #tag1 #tag2` | _Search for macOS tags_ |
|`- {@~w}`|_send a [key command](/bunch/docs/bunch-files/keystrokes#keycombo) to the preceding app_|
|`- [string]`|_[type a string](/bunch/docs/bunch-files/keystrokes#typingstrings) in the preceding app_|
|`!AppName`|_[Quit app](/bunch/docs/bunch-files/basics#quitting)_|
|`!!AppName`|_Launch app when closing bunch ([double negative](/bunch/docs/bunch-files/run-on-close#doublenegative))_|
|`@AppName`|_[Focus app](/bunch/docs/bunch-files/apps.html#focus) (run at end of bunch to hide all other apps)_|
|`AppName_`|_[Hide an app](/bunch/docs/bunch-files/apps.html#hidingapps)_|
|----+----|
| __Snippets__ |
|`< my.snippet`|_[An external file to be included in the bunch](/bunch/docs/bunch-files/snippets)_|
|`- KEY=value`|_A variable to define for use in the snippet as `${KEY}`_|
|`< my.snippet#id`|_[Reference a section of a snippet file](/bunch/docs/bunch-files/snippets#fragments)_|
|`< my.snippet#id ?"Run this Snippet?"`|_[Allow interactive confirmation of a snippet](/bunch/docs/bunch-files/snippets#optionalsnippets)_|
|----+----|
|__URLS__|
|`http://url`|_[Open URL in browser](/bunch/docs/bunch-files/opening-web-pages)_|
|`urlhandler://`|_Open a system [url handler](/bunch/docs/bunch-files/opening-web-pages)_|
|----+----|
|__Bunch Commands__|
|`(command)`|_Run a [Bunch command](/bunch/docs/bunch-files/commands)_|
| `(dark mode [on|off])` | dark mode on/off |
| `(do not disturb [on|off])` | do not disturb on/off | 
| `([hide|show] dock)` | hide/show dock | 
| `(dock [left|right|bottom])` | dock left/right/bottom | 
| `([hide|show] desktop)` | hide/show desktop | 
| `(wallpaper [path(s)])` | change wallpaper | 
| `(audio [input|output] device_name)` | audio input/output | 
| `(audio [input|output] volume [0-100])` | audio volume | 
| `(audio [input|output] [mute|unmute])`| mute/unmute  audio |
|----+----|
|__AppleScripts__|
|`* AppleScript command`|_[Execute Applescript](/bunch/docs/bunch-files/applescript)_|
|----+----|
|__Automator Workflows__|
|`& Automator Workflow`|_Run an [Automator Workflow](/bunch/docs/bunch-files/automator-workflows)_|
|`- key=value`|_variable to pass to preceding workflow (can be repeated)_|
|----+----|
|__Shell Scripts/Commands__|
|`$ script_or_cmd [args]`|_[Shell script](/bunch/docs/bunch-files/shell-scripts) to execute_|
|`- KEY=value`|_Environment variable to export for preceding shell script (can be repeated)_|

## Frontmatter

You can control some aspects of your Bunch using Frontmatter, including the title and icons it uses in the menu. See the [Frontmatter docs](/bunch/docs/bunch-files/frontmatter) for details.

## URL Handler

[See documentation for details.](/bunch/docs/integration/url-handler.html)

| URL | Method |
| :--- | :--- |
| `x-bunch://open?bunch=[BUNCH NAME]`  | Open a Bunch        |
| `x-bunch://[BUNCH NAME]`             | Open shorthand  |
| `x-bunch://close?bunch=[BUNCH NAME]` | Close a Bunch       |
| `x-bunch://close/[BUNCH NAME]`       | Close shorthand |
| `x-bunch://toggle?bunch=[BUNCH NAME]` | Toggle a Bunch       |
| `x-bunch://toggle/[BUNCH NAME]`       | Toggle shorthand |
| `x-bunch://raw?txt=[BUNCH TEXT]` | Run raw text as a Bunch       |
| `x-bunch://snippet?file=[SNIPPET PATH]&fragment=[FRAGMENT]&foo=bar`       | Run a snippet with fragment and variables |
