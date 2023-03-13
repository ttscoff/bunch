---
layout: default
title: Forklift
parent: Integration
tags: [integration]
---
# Bunch and Forklift

I prefer [Forklift](https://binarynights.com/) to Finder for file management. It's far more pleasant than trying to open the right folders in Finder tabs, it gives me a 2-pane view, and it has great integration with FTP, S3, and other network protocols.

It doesn't have a great AppleScript dictionary, though, and automating the opening of tabs and panes isn't possible. However, you can create Saved Workspaces (Favorites -> Save Workspace), with all of the tabs and panes set up just the way you like them, then assign the favorite a keyboard shortcut in Preferences->Shortcuts. Then you can have Bunch send a key combo to it after it launches to get things just the way you like them.

```bunch
%Forklift   // Focus Forklift, open if needed
- {^$~p}    // Send control-shift-option-P
```
