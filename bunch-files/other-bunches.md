---
layout: default
title: Opening Other Bunches
parent: Bunch Files
tags: [snippets]
---
# Bunches Inside Bunches
{:.no_toc}

Bunch can perform actions on other Bunches from within a Bunch, opening or closing them, as well as passing variables to change their behavior.

* Table of Contents
{:toc}


## Opening Other Bunches {#opening}

You can launch other Bunches just by adding the full name of the Bunch, including the ".bunch" extension, on a line, just like you would an app. Bunches launched in this manner behave as if you clicked them in the menu: it gets an "open" checkbox in the menu, and can be quit separately from the Bunch that launched it.

```bunch
# Open the Comms Bunch as if we had clicked it in the menu.
Comms.bunch
```

You can use this in [optional snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#optionalsnippets) to make entire Bunches optional. Create a snippet that calls a Bunch, then reference it with optional syntax.

_Example:_

```bunch
<mysnippet.snippet ?"Launch the Bunch in this snippet?"
```

When closing the parent Bunch, any Bunches launched will also be closed. Use `%Name.bunch` to ignore the Bunch when closing.

When using subfolders, it's a good idea to prefix the Bunch name with the subfolder (e.g. `Subfolder/Bunch Name.bunch`). The Bunch name alone _will_ match a subfolder Bunch, but because Bunches with the same name can exist in different subfolders, using the Bunch name only will find the first match alphanumerically, which may not be the one you're looking for.

## Setting Frontmatter Variables {#variables}

When calling a Bunch from another Bunch, you can override and add to frontmatter keys, which can then be used in variables. To do so, add dashed lines underneath the Bunch call with `key=value` pairs:

```bunch
MyOther.bunch
- myvar = my value
```

Now when `MyOther.bunch` launches, it will have the variable `myvar` populated with `my value` and it can be used as `${myvar}` in `MyOther.bunch`. This means that a Bunch can do different things when launched from other Bunches, with each parent Bunch setting its own variables.

Frontmatter variables can be used in app lines, file lines, or within arguments for scripts and workflows.

Variables set when the Bunch is opened will persist when the Bunch is closed. So if your variable value caused the Bunch to open an app, for example, that app will be closed when the Bunch is closed.

## Closing Other Bunches and Launch on Close

Bunch lines behave just like app lines, so using `!Name.bunch` will quit that Bunch, and using `!!Name.bunch` will launch that Bunch when the containing Bunch closes.

If a Bunch quits another Bunch when it launches (`!Name.bunch`), the Bunch that was closed will be re-opened when the containing Bunch closes.

If a Bunch is closed that contains apps launched by the parent Bunch, those apps won't be quit when closing the Bunch. Same goes in the other direction: if opening a Bunch would launch apps that the containing Bunch would quit, those apps are ignored and left running. 

## Nesting

You can nest these calls, having one Bunch open another which opens another, but you can't open or close a Bunch that appears earlier in the chain. This is to avoid infinite loops.

> Beware of having a Bunch close or launch other Bunches that also close or launch Bunches. Bunch has safeguards against loops, but if you get crazy enough, it's turtles all the way down.
{:.warning}


## Launching Bunches as Snippets

You can also use any Bunch file as a [snippet]({{ site.baseurl }}/docs/bunch-files/snippets/). This will incorporate the contents of the Bunch (or any [fragment]({{ site.baseurl }}/docs/bunch-files/snippets/#fragments) within it) directly into the calling Bunch, starting and quitting items when the calling Bunch opens and closes. In this case the Bunch in the menu does not get a checkmark, it's contents are now part of the Bunch you called it from.

It does have the benefit of directly using things like [optional snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#optionalsnippets) and delays.

_Example:_

```bunch
# Launch the Work fragment of Comms.bunch 
# after a 30-second delay
<Comms.bunch#Work ~30

# Ask if we should load the Social fragment
<Comms.bunch#Social ?"Is Social Media a good idea right now?"
```
