---
layout: default
title: Wallpaper
parent: Commands
grand_parent: Bunch Files
---
# Wallpaper Commands

Set the Desktop Image for one or more displays. Provide a full path to the image, e.g. `(wallpaper ~/Pictures/my desktop.jpg)`. If a single path is given, all available displays will be set to that image. If multiple paths separated by a pipe (`|`) are provided, images will be applied to the available displays in order (first image path to first display, second path to second display, etc.). If you declare more paths than you have displays, additional paths will be ignored. 

The desktop image(s) that are in place when Bunch first launches will be restored when quitting any Bunch. 

> __Tip:__ If you manually change the Desktop wallpaper while Bunch is running, use __Save Current Wallpaper as Default__ from the main menu to update the fallback image(s).
{:.tip}

## Examples

```bunch
(wallpaper ~/Pictures/Desktop 1.jpg|~/Pictures/Desktop 2.jpg)
```

> __Tip:__ Alternatively, you can simulate a wallpaper change while a Bunch is running using the `(display)` command with a background image. See the tip [in the `(display)` documentation]({{ site.baseurl }}/docs/bunch-files/commands/display/#simulatewallpaper) for an example.
{:.tip}
