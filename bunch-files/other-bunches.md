---
layout: default
title: Opening Other Bunches
parent: Bunch Files
---
## Launching Other Bunches

You can launch other Bunches just by adding the full name of the Bunch, including the ".bunch" extension, on a line, just like you would an app. Bunches launched in this manner behave as if you clicked them in the menu: it gets an "open" checkbox in the menu, and can be quit separately from the Bunch that launched it.

	# Open the Comms Bunch as if we had clicked it in the menu.
	Comms.bunch

You can use this in [optional snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#optionalsnippets) to make entire Bunches optional. Create a snippet that calls a Bunch, then reference it with optional syntax.

_Example:_

	<mysnippet.snippet ?"Launch the Bunch in this snippet?"

When closing the parent Bunch, any Bunches launched will also be closed. Use `%Name.bunch` to ignore the Bunch when closing.

### Quitting Bunches and Launch on Quit

Bunch lines behave just like app lines, so using `!Name.bunch` will quit that Bunch, and using `!!Name.bunch` will launch that Bunch when the containing Bunch closes.

### Nesting

You can nest these calls, having one Bunch open another which opens another, but you can't open or close a Bunch that appears earlier in the chain. This is to avoid infinite loops.

## Launching Bunches as snippets

You can also use any Bunch file as a [snippet]({{ site.baseurl }}/docs/bunch-files/snippets/). This will incorporate the contents of the Bunch (or any [fragment]({{ site.baseurl }}/docs/bunch-files/snippets/#fragments) within it) directly into the calling Bunch, starting and quitting items when the calling Bunch opens and closes. In this case the Bunch in the menu does not get a checkmark, it's contents are now part of the Bunch you called it from.

It does have the benefit of directly using things like [optional snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#optionalsnippets) and delays.

_Example:_

	# Launch the Work fragment of Comms.bunch 
	# after a 30-second delay
	<Comms.bunch#Work ~30

	# Ask if we should load the Social fragment
	<Comms.bunch#Social ?"Is Social Media a good idea right now?"
