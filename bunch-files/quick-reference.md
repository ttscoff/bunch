---
layout: default
title: Syntax Reference
parent: Bunch Files
nav_order: 2
top_menu: true
tags: [example]
---
# Quick Reference
{:.no_toc}
    
* Table of Contents
{:toc}

## Bunch Syntax

|Bunch Line|Action|
|:----|:----|
| __Apps__ ||
|`App Name`|_[Launch app]({{ site.baseurl }}/docs/bunch-files/apps/#launchingapps)_|
|`%App Name`|_Launch when opening the Bunch, but [ignore when closing]({{ site.baseurl }}/docs/bunch-files/apps/#ignoring-appscommands-on-close)_|
|`App Name ~5`|_[Launch app after 5 second delay]({{ site.baseurl }}/docs/bunch-files/delay/)_|
|`- XX`|_[close all windows]({{ site.baseurl }}/docs/bunch-files/apps/#closingwindows) of preceding app_|
|`- File`|_[open a file]({{ site.baseurl }}/docs/bunch-files/apps/#openingfiles) in preceding app (can be repeated)_|
|`- 'spotlight search'` | _Run a spotlight search and open the results in preceding app_ |
| `- #tag1 #tag2` | _Search for macOS tags_ |
|`- {@~w}`|_send a [key command]({{ site.baseurl }}/docs/bunch-files/keystrokes/#keycombo) to the preceding app_|
|`- [string]`|_[type a string]({{ site.baseurl }}/docs/bunch-files/keystrokes/#typingstrings) in the preceding app_|
|`!AppName`|_[Quit app]({{ site.baseurl }}/docs/bunch-files/apps/#quitting)_|
|`!!AppName`|_Launch app when closing bunch ([double negative]({{ site.baseurl }}/docs/bunch-files/run-on-close/#doublenegative))_|
|`@AppName`|_[Focus app]({{ site.baseurl }}/docs/bunch-files/apps/#focus) (run at end of bunch to hide all other apps)_|
|`AppName_`|_[Hide an app]({{ site.baseurl }}/docs/bunch-files/apps/#hidingapps)_|
| __Snippets__ ||
|`< my.snippet`|_[An external file to be included in the bunch]({{ site.baseurl }}/docs/bunch-files/snippets/)_|
|`- KEY=value`|_A variable to define for use in the snippet as `${KEY}`_|
|`< my.snippet#id`|_[Reference a section of a snippet file]({{ site.baseurl }}/docs/bunch-files/snippets/#fragments)_|
|`< my.snippet#id ?"Run this Snippet?"`|_[Allow interactive confirmation of a snippet]({{ site.baseurl }}/docs/bunch-files/interactivity/)_|
|__URLS__||
|`http://url`|_[Open URL in browser]({{ site.baseurl }}/docs/bunch-files/opening-web-pages)_|
|`urlhandler://`|_Open a system [url handler]({{ site.baseurl }}/docs/bunch-files/opening-web-pages/)_|
|__Bunch Commands__||
|`(command)`|_Run a [Bunch command]({{ site.baseurl }}/docs/bunch-files/commands/)_|
| `(dark mode [on|off])` | dark mode on/off |
| `(do not disturb [on|off])` | do not disturb on/off | 
| `([hide|show] dock)` | hide/show dock | 
| `(dock [left|right|bottom])` | dock left/right/bottom | 
| `([hide|show] desktop)` | hide/show desktop | 
| `(wallpaper [path(s)])` | change wallpaper | 
| `(audio [input|output] device_name)` | audio input/output | 
| `(audio [input|output] volume [0-100])` | audio volume | 
| `(audio [input|output] [mute|unmute])`| mute/unmute  audio |
|__AppleScripts__||
|`* AppleScript command`|_[Execute Applescript]({{ site.baseurl }}/docs/bunch-files/scripts/applescript/)_|
|__Automator Workflows__||
|`& Automator Workflow`|_Run an [Automator Workflow]({{ site.baseurl }}/docs/bunch-files/scripts/automator-workflows/)_|
|`- key=value`|_variable to pass to preceding workflow (can be repeated)_|
|__Shell Scripts/Commands__||
|`$ script_or_cmd [args]`|_[Shell script]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/) to execute_|
|`- KEY=value`|_Environment variable to export for preceding shell script (can be repeated)_|

## Frontmatter

You can control some aspects of your Bunch using Frontmatter, including the title and icons it uses in the menu. See the [Frontmatter docs]({{ site.baseurl }}/docs/bunch-files/frontmatter/) for details.

{% include snippets/quick-frontmatter.md %}

## URL Handler

[See documentation for details.]({{ site.baseurl }}/docs/integration/url-handler/)

{% include snippets/quick-urlhandler.md %}

