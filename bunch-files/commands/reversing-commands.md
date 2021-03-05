---
layout: default
title: Reversing Commands
parent: Commands
grand_parent: Bunch Files
---
# Reversing Commands

All commands are automatically reversed when closing a Bunch (hidden Desktop icons are shown, hidden dock is revealed, wallpapers switch back, etc.), with the exception of the Dock positioning, notification, and audio commands. 

To _avoid_ reversing a command when closing the Bunch, precede the line with a `%` symbol, e.g. `%(hide dock)` (similar to [ignoring applications when quitting]({{ site.baseurl }}/docs/bunch-files/apps#ignoring-appscommands-on-close)). 

To run the command _only_ when closing a bunch, use an exclamation point (`!`) before the command, e.g. `!(show desktop)`.


