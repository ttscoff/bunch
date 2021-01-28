---
layout: default
title: Sample Bunch
parent: Bunch Files
nav_order: 3
---
# A Sample .bunch File

This example demonstrates the basic syntax for a Bunch file.

```
# Comments start with a hash symbol, blank lines are ignored

# Use @@ to hide all visible apps. Usually used at the top of the file
# before launching the rest of the bunch
@@

# Apps to launch start at the beginning of a line, no
# need to quote or escape.
Messages

# Apps launched by a Bunch can be quit when the Bunch is closed
# Add a percent symbol to ignore it when quitting (keep it running)
%Terminal

# Include a line starting with a dash to open specific
# files in the app
# If the first file listed is "XX", all open windows
# for the app will be closed first
Finder
- XX
- ~/Desktop
- ~/Documents

# Commands are surrounded by parenthesis. Only commands Bunch
# recognizes will be executed
# ([hide|show] dock) -> Turn Dock autohiding on or off
# ([hide|show] desktop) -> Show or hide desktop icons
# (dnd [on|off]) -> Turn Do Not Disturb on or off
(show dock)

# Use a URL instead of an app to open it in your
# default browser
https://brettterpstra.com/projects

# You can also use URL schemes from other apps
x-marked://open?file=Work Stuff.md

# Start a line with an exclamation point to quit that app if it's running
!Mail

# Start a line with an asterisk (*) to execute as applescript
* say "Bunch launched"

## Or run a shell script with a dollar sign ($)
## and set environment variables with "file" markers
# $ /usr/local/scripts/myscript.sh arg1 arg2
# - KEY=value

## Or an Automator Workflow with an ampersand (&)
## File markers will set variables for the workflow
# & ~/Documents/My Workflow.workflow
# - key=val

# Start a line with @ to "focus" that app (hide others)
# Focus commands should be the last item in the Bunch
@Marked 2

# See the documentation for more info: https://brettterpstra.com/bunch/docs
```
