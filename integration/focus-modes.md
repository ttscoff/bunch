---
layout: default
title: Focus Modes
parent: Integration
tags: [integration]
---
# macOS Focus Modes

One Bunch feature request I've received a few times is support for macOS Monterey's Focus Modes. Bunch does a good job with enabling and disabling Do Not Disturb on previous operating systems, but the process is a hack that involves nested settings in PLIST data and toggling system daemons. I don't love that I have to do that, but Apple provides no API for such settings. And I haven't found a way (yet) to extend that hack to work with Focus Modes. So here's the solution I'm using.

You can turn Focus Modes on and off using Shortcuts. Create two shortcuts for each focus mode you want to control from Bunch, one for turning on, and one for turning off. Then, in a Bunch, you can use `$ /usr/bin/shortcuts run "SHORTCUT_ON_NAME"` (replacing `SHORTCUT_ON_NAME` with the name of the shortcut that turns the focus mode on), and `!$ /usr/bin/shortcuts run "SHORTCUT_OFF_NAME"`. The combination of these two will turn the focus mode on when the Bunch opens, and off when it closes. You can, of course, reverse these as needed.

```bunch
---
title: Work
---

$ /usr/bin/shortcuts run "Work Mode On"
!$ /usr/bin/shortcuts run "Work Mode Off"
```
