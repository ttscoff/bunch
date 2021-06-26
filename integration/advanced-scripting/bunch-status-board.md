---
layout: default
title: Touch Bar Status Board
parent: Advanced Scripting
grand_parent: Integration
tags: [scripts]
---
# Creating a Bunch Status Board in Your Touch Bar
{:.no_toc}

{% img aligncenter /images/touchbarbunches.png 1141 86 "Buttons in Touch Bar" %}


This page details how to create a Bunch Status Board using BetterTouchTool and a Touch Bar (or Touch Bar Simulator). With a little scripting, you can make a series of touch bar buttons for toggling Bunches open and closed, and have the background color of the buttons show each Bunch's state.

> It _should_ be feasible to do something similar to this using KeyBoard Maestro and a Stream Deck, but I haven't gotten a proof of concept to work yet.

* Table of Contents
{:toc}

## Status JSON

Instead of having the buttons continuously poll for their Bunch's state, we're going to have Bunch write out a JSON file with the state of all Bunches every time a Bunch is open or closed.

We'll do this with an AppleScript. This script writes a JSON file called `bunch_status.json` to your root Bunch Folder:

```applescript
#!/usr/bin/osascript
set outBunches to {}
set statusFile to missing value

tell application "Bunch"
    set statusFile to (get preference "folder") & "/bunch_status.json"
    set bunches to list bunches
    set openBunches to list open bunches
    
    repeat with bunch in bunches
        set thisBunch to "\"" & my lowercase(bunch as string) & "\":"
        if openBunches contains bunch then
            set thisBunch to thisBunch & "true"
        else
            set thisBunch to thisBunch & "false"
        end if
        
        set end of outBunches to thisBunch
    end repeat
end tell

on lowercase (this_text)
    set new_text to do shell script "echo " & quoted form of ( this_text ) & " | tr A-Z a-z"
    return new_text
end lowercase

set {astid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ","}
set output to ("{" & outBunches as string) & "}"
set AppleScript's text item delimiters to astid
do shell script "echo " & quoted form of output & " > " & quoted form of statusFile
```

Save this file as `bunch_status.applescript` in your Bunch Folder, in a subfolder called "scripts." Make it executable by running `chmod a+x path/to/scripts/bunch_status.applescript` in Terminal.

We want this script to run every time a Bunch is opened or closed, so we'll use [folder frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#folderfrontmatter) to apply [`run after` and `run after close`]({{ site.baseurl }}/docs/bunch-files/frontmatter/#beforeafterscripts) keys to all of the Bunches in our root folder.

> You'll need to repeat this within any subfolders, and if a Bunch has its own `run after` or `run after close` frontmatter, you'll need to append this script to those lists, as they will overwrite what's in the folder's frontmatter.

In `folder.frontmatter` in the root of our Bunch Folder:

```bunch
---
run after: scripts/bunch_status.applescript
run after close: scripts/bunch_status.applescript
---
```

Now every time a Bunch in the root folder opens or closes, our JSON file will be updated.

## Getting a Bunch's State

Now we need a script that accepts a Bunch's filename and tells us if it's open or closed. This script is going to directly return some JSON that will set the appropriate background color for the button when it's called from BetterTouchTool.

> Be sure to edit the `status_file =` line to hardcode the path to the `bunch_status.json` file in your Bunch Folder. Once that file is created, you can select it in Finder, right click on it, then hold down option and select "Copy bunch_status.json as Pathname." Paste the result into the `status_file` line below.

```ruby
#!/usr/bin/env ruby

require 'json'
open_color = '165,218,120,255'
closed_color = '95,106,129,255'

status_file = '/Path/to/Bunches/bunch_status.json'

status = JSON.parse(IO.read(status_file))
bunch = ARGV[0].strip.downcase

color = if status.key?(bunch)
          status[bunch] ? open_color : closed_color
        else
          closed_color
        end

print "{\"background_color\":\"#{color}\"}"
```

Feel free to adjust the RGB colors as you see fit. Save this file as `bunch_state.rb` in the scripts folder we created above (or anywhere, as long as you know the path to it, we'll need it in the next step). Make it executable with `chmod a+x /path/to/bunch_state.rb`

## Touch Bar Buttons

In BetterTouchTool, go to the Touch Bar section in the dropdown at the top. Add a new item by clicking the plus button, and make it a "Shell Script / Task Widget." Name it based on the Bunch its going to represent, optionally assigning an icon. You'll need the text for this setup to work, though, so don't set it to icon only.

Under the Widget Specific config, set up the script:

- Excute every 5 seconds
- Always run when widget becomes visible
- Launch path: `/bin/bash`
- Parameters: `-c`
- Script: `/path/to/bunch_state.rb [Bunch Name]` (Change `[Bunch Name]` to the file name of the Bunch we're targeting, minus the `.bunch` extension)

Add a Shell Script action to the widget and run `open 'x-bunch://toggle/[Bunch Name]`. If the Bunch Name contains spaces, be sure to replace them with `%20`, e.g. `x-bunch://toggle/Podcast%20Edit`.

{% img aligncenter /images/bttbunchwidget.png 1456 877 "Script Widget in BetterTouchTool" %}

## In Action

The JSON status file will be created the next time you open or close a Bunch, and will stay up-to-date from that point on. Your Touch Bar widget will poll the status and update the background color of the widget within 5 seconds of opening or closing a Bunch.

## Optimizations

First, you may want to move the JSON file out of the Bunch folder by manually editing that part of the `folder.frontmatter` script. Every time the file saves within the Bunch folder, Bunch will see that as a change and trigger a refresh on all Bunches (you'll see the icon flash green in the menu bar). Moving the file outside of the Bunch folder will prevent this from happening.

Second, there's an alternative route you can take that would prevent the 5-second polling on the BetterTouchTool script widgets. Each Bunch would update its own Touch Bar button when it opens or closes. This would involve going into each button's script widget in BetterTouchTool, right clicking to copy its UUID, then adding a script line to the Bunch that called the BetterTouchTool url handler:

    $ open "btt://refresh_widget/?uuid=C40D3AE2-2F4E-49B1-A00C-F7E4C3632F07"

In this case you would either still need the JSON file to be written out with the Bunch states on every open/close, or you would need the BetterTouchTool script to run the JSON-generating script itself when triggered. The latter would probably be the most efficient.
