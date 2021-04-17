---
layout: default
title: Log
parent: Commands
grand_parent: Bunch Files
tags: [log,command]
---
The log command simply logs a string to the [Bunch Log]({{ site.baseurl }}/using-bunch/bunch-log/). The contents of the command will show up in the log as a Warning level item (with a yellow indicator). 

This is mostly useful for debugging Bunches and can be used to see what a variable is being set to in the Bunch. Because variables can take their value from scripts, frontmatter, dialogs, and outside settings like URL handler parameters, it can be useful to see what setting it ends up with depending on how it's called.

If your Log Level is set to Errors Only, log commands won't register in the log. See the [Bunch Log documentation]({{ site.baseurl }}/using-bunch/bunch-log/) for details on setting the Log Level.

## Examples

```bunch
(log myvariable is set to ${myvariable})
```

You can also use it when debugging by setting the execution order to sequential and placing log statements at various points in the Bunch to see when they're reached.

```bunch
---
title: Debug Bunch
sequence: sequential
---
Messages
(log Messages launched)

Discord
(log Discord launched)
```

