---
layout: default
title: Startup Scripts
parent: Bunch Files
tags: [apps,frontmatter]
---
# Auto-launch Bunches on startup
{:.no_toc}

* Table of Contents
{:toc}

You can launch Bunches automatically whenever the app starts. This can be useful if you have Bunch set as a Login Item and you have a set of apps you want to launch every time you log in. By using Bunch to do this rather than adding them to the Login Items as well, you can easily quit apps in groups, as well as access [Bunch commands]({{ site.baseurl }}/docs/bunch-files/commands/) and [scripts]({{ site.baseurl }}/docs/bunch-files/scripts/).

## With .startup Scripts

There are two ways to launch a Bunch on startup. The first way is with a dedicated "startup script."

To launch Bunches on startup, create a file in your Bunch directory with the extension ".startup". Any filename will work, and all files ending in ".startup" will be processed. 

The file should contain a list of Bunches to launch, one Bunch per line. The ".bunch" extension is not required. Note that these startup files can _only_ contain names of Bunches to launch, not regular Bunch lines of any kind.

If you have Single Bunch mode enabled, only the last item processed will be launched. Otherwise all lines of all ".startup" files will launch, not that you'd ever need more than one...

## With Frontmatter {#frontmatter}

You can also add a `startup: true` key to [the frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter) of any Bunch to have it launch when the app loads. All Bunches with `startup: true` will be opened after any `.startup` files have been processed.

```bunch
---
title: My Startup Bunch
startup: true
---
MailMate
Messages
```

### Interactively

If `startup:` is set to `ask`, a prompt will be displayed on launch. Cancelling that prompt will skip opening the Bunch.

### Selectively for Synced Macs

If you sync your Bunches to multiple Macs, you may want to specify which Mac(s) run the Bunch as a startup script. To do this, open Preferences and press the "Copy UUID" button. Paste the result as the value of the `startup:` key and the startup will only be triggered on the Mac that matches this value. Multiple UUIDs can be combined with commas. 

You can also use `startup unless:` instead of `startup:`. This has the inverse effects for excluding specific Macs by UUID.

### Batch Launching

You can use `folder.frontmatter` to apply `startup: true` to [all of the Bunches contained in a subfolder]({{ site.baseurl }}/docs/bunch-files/frontmatter/#folderfrontmatter). This makes adding and removing Bunches from startup as easy as moving them in and out of a folder. Just create a subfolder and add a file called `folder.frontmatter` to it. Include the `startup: true` key in that file and it will be applied to all of the Bunches it contains.

## Conflicts

> Be careful when auto-launching Bunches that quit other Bunches, as this can lead to unexpected behavior. Bunches are launched asynchronously, so you can't be sure what order the events will happen in. Avoid having `!Name.bunch` lines in any Bunches launched by a startup script.
{:.warning}

