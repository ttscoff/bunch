---
layout: default
title: Notify
parent: Commands
grand_parent: Bunch Files
tags: [notification, interaction, command]
---
# Notify Commands

This simply takes a string of text and creates a Notification Center alert or banner (depending on your settings). Banners are assigned an identifier with the calling Bunch's name, so subsequent alerts overwrite the first, avoiding a pileup of notifications.

> I highly recommend setting your alert style for Bunch to "Alerts" in System Preferences->Notifications. This makes the information from Bunches more useful, and allows some actions (like scheduled Bunches) to provide a cancel method that would otherwise be quickly hidden.
{:.tip}

## Example

```
(notify Some text to display)
```
