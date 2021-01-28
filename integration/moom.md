---
layout: default
title: Moom
parent: Integration
---
[bt]: https://brettterpstra.com/2020/09/14/using-moom-with-bunch-for-window-management/

You can integrate with the fantastic window manager, [Moom](https://manytricks.com/moom/), for detailed control over how windows are organized after a Bunch launches.

I originally wrote about this [on my blog][bt]. Since writing that, Bunch has added the delayed launching feature, which is ideal for having Moom wait until all apps in the Bunch have loaded before attempting to modify their window positions.

First, launch the Bunch and time how long it takes all of the apps to fully load. Then arrange the windows as desired, and use Moom's __Save Window Layout Snapshot...__ feature to store a snapshot with a unique title. If needed, see my [original post][bt] for more details.

Once you have the named snapshot, you can add a line to your Bunch calling it with AppleScript:

```
%nvUltra
Audio Hijack
Skype

* tell application "Moom" to arrange windows according to snapshot "Podcasting" ~10
```

Note the `~10` at the end of the line, telling Bunch to wait 10 seconds before running the command. Change that to however long it takes this particular Bunch to load.

