---
layout: default
title: Keyboard Control
parent: Using Bunch
nav_order: 40
tags: [keyboard,shortcuts]
---
# Keyboard Control in Bunch

In Preferences, assign a hotkey to use to open Bunch. Once this is assigned, you can use it no matter what application you're in. Pick a combination that won't conflict with other applications' default shortcuts. I recommend including Control in the combination, which avoids many conflicts (90% of shortcuts only use Command, Shift, and Option). Or, if you know what a [Hyper key](https://brettterpstra.com/2017/06/15/a-hyper-key-with-karabiner-elements-full-instructions/) is, Hyper combos make good launchers.

> In order to have keyboard control over popup dialogs in Bunch, you need to enable access to all controls in System Preferences. Open System Preferences->Keyboard and select the Shortcuts tab. At the bottom, enable the checkbox for "All Controls" (macOS < 11) or "Use keyboard navigation to move focus between controls" (Big Sur).
{:.tip}

Once these are set up, hit your hotkey and you'll see that the Bunches listed in the menu have keyboard shortcuts assigned. By default these are numbers. Just type the number of a Bunch to open (or toggle) it.

You can customize the shortcut for each Bunch with the [`shortcut` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts).

After using the keyboard shortcut to open the Bunch menu, you can also navigate with the arrow keys. Or, if you're a keyboard pro, you can use Control-p and Control-n to move up and down (this works in any macOS menu).

Additionally, the following keyboard shortcuts are available when the menu is open:

|    Shortcut    |          Action          |
|----------------|--------------------------|
| {% kbd ⌃⌥⌘R %} | Clear Checkmarks         |
| {% kbd ⌘,  %}  | Open Preferences         |
| {% kbd ⇧⌘N %}  | New Bunch With Open Apps |
| {% kbd ⇧⌘R %}  | Refresh Bunches          |
| {% kbd ⇧⌘L %}  | Open Log                 |
| {% kbd ⌘H  %}  | Hide All Windows         |
| {% kbd ⇧⌘H %}  | Unhide All Windows       |
| {% kbd ⌘Q  %}  | Quit Bunch               |
