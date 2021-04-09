---
layout: default
title: More Tools
parent: Integration
tags: [integration]
---
### HazeOver

Similar to [Bunch's `(screen)` command]({{ site.baseurl }}/docs/bunch-files/commands/screen/), HazeOver is a handy little app that "hazes over" everything but the current foreground application. It's great for reducing distractions, and can be a handy tool for some of your contexts. Integrating it into a Bunch is as simple as:

	* tell app "HazeOver" to set enabled to true
	* tell app "HazeOver" to set color to "111111"
	* tell app "HazeOver" to set intensity to 90

