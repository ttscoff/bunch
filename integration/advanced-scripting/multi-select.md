---
layout: default
title: Multi-Select Dialog
parent: Advanced Scripting
grand_parent: Integration
tags: [interactive,dialog]
---
# Dialogs Allowing Multiple Selections

Bunch offers several methods for creating [interactive Bunches]({{ site.baseurl }}/docs/interactivity/), but you can also use a little scripting if you need more flexibility. In this case, we'll add a dialog that allows the user to select multiple options and then act on them.

You can use AppleScript to display a multiple choice dialog allowing multiple selections. This can be used to launch multiple bunches with user interaction.

```applescript
set _res to choose from list {"Comms", "Podcast Record", "Podcast Edit", "Music"} with prompt "What next?" OK button name "Launch" with multiple selections allowed and empty selection allowed

repeat with _bunch in _res
    do shell script "open 'x-bunch-beta://open/" & _bunch & "'"
end repeat
```

Call a script like that within one Bunch, and it can lead to launching other Bunches based on user response.

This strategy can be used with simple yes/no dialogs as well, taking alternate paths based on the response. Any script that can accept user responses via a GUI can use the Bunch [URL handler]({{ site.baseurl }}/docs/integration/url-handler) to continue processing Bunches.
