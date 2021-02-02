---
layout: default
title: Startup Scripts
parent: Bunch Files
---
# Auto-launch Bunches on startup

You can launch Bunches automatically whenever the app starts. This can be useful if you have Bunch set as a Login Item and you have a set of apps you want to launch every time you log in. By using Bunch to do this rather than adding them to the Login Items as well, you can easily quit groups of apps all at once, and perform additional actions.

## With .startup Scripts

There are two ways to launch a Bunch on startup. The first way is with a dedicated "startup script."

To launch Bunches on startup, create a file in your Bunch directory with the extension ".startup". Any filename will work, and all files ending in ".startup" will be processed. 

The file should contain a list of Bunches to launch, one Bunch per line. The ".bunch" extension is not required. Note that these startup files can _only_ contain names of Bunches to launch, not regular Bunch lines of any kind.

If you have Single Bunch mode enabled, only the last item processed will be launched. Otherwise all lines of all ".startup" files will launch, not that you'd ever need more than one...

## With Frontmatter

You can also add a `startup: true` key to [the frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter) of any Bunch to have it launch when the app loads. All Bunches with `startup: true` will be opened after any `.startup` files have been processed.

## Conflicts

Be careful when auto-launching Bunches that quit other Bunches, as this can lead to unexpected behavior. Bunches are launched asynchronously, so you can't be sure what order the events will happen in. Avoid having `!Name.bunch` lines in any Bunches launched by a startup script.


