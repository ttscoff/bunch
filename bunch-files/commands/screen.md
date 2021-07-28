---
layout: default
title: Desktop Screen
parent: Commands
grand_parent: Bunch Files
tags: [screen,command]
---
# Desktop Screen Command

The `(screen)` command creates a layer of solid color that can be used to hide applications and Desktop icons. Clicking on the layer will hide everything (except for floating windows), then activating apps using the Dock or {% kbd ⌘ %}-Tab will bring them in front of the layer.

The screen command accepts two optional arguments, background color and alpha transparency.

Screens are created for all attached displays. If the number of displays changes, the command will regenerate screens to match the new number.

__Background Color__
: The color for the layer is specified using 6-digit RGB hex codes. Black is `#000000`, white is `#ffffff`, and middle gray is around `#9a9a9a`. When all 6 digits are the same, you can shorten to 3, e.g. `#333333` can be `#333`.
: The default is a dark gray (`#666`).
: Example: `(screen #528c9e)`

__Alpha Transparency__
: Transparency is specified as a percentage, 0-100. Anything lower than 20 defeats the purpose, but if you want a little transparency, try 80-90%.
: Example `(screen 90%)`

The two parameters can be combined in any order: `(screen #666 90%)`

## Examples:

```bunch
(screen #9a9a9a)
(screen #404040 90%)
```
