---
layout: default
title: Awake
parent: Commands
grand_parent: Bunch Files
---
# Awake Commands

`(awake)` will keep your Screensaver from activating and your display from sleeping. If you specify an interval in the format `XhXmXs` (e.g. `2h` or `1h30m`) then Bunch will stop keeping your machine awake after that period of time. Any running `awake` command will be terminated when the Bunch is closed or the application is quit.

If the application should happen terminate unexpectedly, the `awake` command may continue running in the background. In this case, just launch Bunch again and run `Close Items In...` for the Bunch containing the `awake` command.

See also: [Sleep Commands]({{ site.baseurl }}/docs/bunch-files/commands/sleep/)

## Examples

```
(awake 2h)
```
