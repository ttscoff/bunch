---
layout: default
title: Input Source
parent: Commands
grand_parent: Bunch Files
tags: [audio,command]
---
# Input Source Commands

Change your keyboard input source to other languages.

To set an input source, the source must be installed and enabled in __System Preferences->Keyboard->Input Sources__. The source can be referred to using any part of its name, or by a qualified input source identifier.

The following will set the input source to French.

```bunch
(input source french)
```

You can also use a source identifier, if you know it. This can help avoid false matches if you have multiple sources for a language.

```bunch
(input source com.apple.keylayout.British)
```

Input source commands are reversed when closing a Bunch. The current input source is recorded prior to running the command, and when the Bunch containing the command is closed, the recorded input source is restored. If you want to manually specify what input source to switch to when closing, use an on-close command:

```bunch
!(input source US)
```

