---
layout: default
title: Shortcut
parent: Commands
grand_parent: Bunch Files
tags: [shortcuts, command]
---
{% available 150 %}

# Shortcut Command

Trigger a macOS Shortcut by name. The name is case insensitive and fuzzy matched, the only requirement is that it start with the correct letter and all remaining characters are within two positions of each other in the actual shortcut name. Partial names are OK, the shortest matching Shortcut will be selected.

> A Shortcut with matching name must exist in the Shortcuts app in order to be triggered by a Bunch. That's obvious, right?
{:.alert}

## Examples

```bunch
// works with `sc`, `short`, and `shortcut` as the command
(sc Work Mode)
!(sc work mode off) // or (shortcut work mode off)
```

{% endavailable %}
