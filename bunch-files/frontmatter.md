---
layout: default
title: Frontmatter
parent: Bunch Files
---
# Controlling Bunch With Frontmatter

You can use frontmatter at the top of your Bunch to do things like change the menu display title or schedule launches on a repeating basis.

Frontmatter goes at the very top of a Bunch, and is fenced off by three dashes (minus symbol) at the top and bottom. Within the fence is a series of keys and values separated by colons.

Example frontmatter:

```
---
title: 📞Comms
open at: 8am
startup: true
---
```

Bunch treats keys the way MultiMarkdown does: it allows spaces and is case insensitive, but they're compressed and lowercased when read in, so `Open at` becomes `openat`. Feel free to make your keys as readable or as efficient as you like. Unrecognized keys are ignored.

Here are the available keys:

| `title:`      | Override the display title. Emojis OK.     |
| `open at:`    | Set a time to open this bunch daily        |
| `close at:`   | Set a time to close this bunch daily       |
| `open on:`    | Set a weekday and time to repeat weekly    |
| `open every:` | Repeat open at intervals                   |
| `startup:`    | true or false to open this Bunch on launch |

{% img float-right pl-4 pt-4 /bunch/images/emojititles.jpg 490 212 %}

The "title" key changes the display title of the Bunch, as seen in the menu. When calling the Bunch from any other Bunch, you'll still use the filename.

You can totally use emoji in the frontmatter title and get a sweet looking menu.

See [Scheduling Bunches](/bunch/docs/bunch-files/scheduling-bunches) for details on the open and close keys.

The "startup" key is simply set to true/false (or yes/no) and has the same effect as adding a bunch name to a [`*.startup` script](/bunch/docs/bunch-files/startup-scripts).
