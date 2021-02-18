---
layout: default
title: Execution Sequence
parent: Bunch Files
---
# Sequential vs Parallel

Out of the box, Bunch launches items in a Bunch file in sequential order. You can change this using __Preferences->Bunch Behavior->Launch Items In Parallel__. When this is off, Bunch executes items in the Bunch file in the order they're listed, sending one item to the queue at a time. The actual order may be out of sequence depending on the execution of the queue by the system, but if you have items (apps, scripts, etc.) that rely on other things happening first, this is ideal.

When this is turned on, all items in the Bunch file are added to the queue to be executed asynchronously, meaning they more or less all happen at the same time, and one item taking a long time won't stop other items from running. This makes for very fast Bunch opens. If the order of execution in your Bunches as a whole isn't important, turn this feature on. You can affect it on a per-file or per-item basis as needed.

## Changing Sequence for a Single Bunch

You can change the sequence of execution for a single Bunch, regardless of the Preference setting, by using the frontmatter key `sequence`. This can be set to either "sequential" or "parallel." You only need the first letter of either value to trigger it, so `sequence: P` is all it takes to enable parallel execution for the Bunch.

	---
	title: All At Once
	sequence: parallel
	---

(Just to make things confusing, you can also use `parallel: true|false` or `sequential: true|false`. Whatever makes the most sense to your brain.)

## Changing Sequence for a Single Item

If the "Launch Items in Parallel" preference is turned off, or the Bunch has frontmatter that disables it, you can still affect individual items by putting a pipe (`|`) in front of the line. This works on everything except snippets, but can be used on items within snippets.

Items marked with a pipe are taken out of the sequence and executed immediately in the background. Execution will not wait until their line in an otherwise sequential Bunch file.

If the script is an on-close script, put the pipe before the exclamation point.

	|$ scripts/parallel1.sh
	|$ scripts/parallel2.sh

	# On close
	|!$ scripts/close1.sh
	|!$ scripts/close2.sh
