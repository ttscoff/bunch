---
layout: default
title: Keyboard Maestro
parent: Integration
tags: [integration]
---
# Integrating with Keyboard Maestro

[Keyboard Maestro](https://www.keyboardmaestro.com/) is a powerful Mac automation tool. You can integrate it with Bunch in two directions.

You can call any Bunch from Keyboard Maestro using [AppleScript]({{ site.baseurl }}/docs/integration/applescript) in a Run AppleScript action, or the [Bunch URL handler]({{ site.baseurl }}/docs/integration/url-handler) in an Open URL action. This allows full control of Bunch, including the ability to run raw text as snippets after Keyboard Maestro has performed any alterations on it.

Keyboard Maestro macros and variables can also be [controlled by AppleScript, Automator, or `keyboardmaestro://` urls](https://www.keyboardmaestro.com/documentation/6/scripting.html). These can easily be integrated into a Bunch using Bunch's ability to run [AppleScripts]({{ site.baseurl }}/docs/bunch-files/scripts/applescript), [Automator Workflows]({{ site.baseurl }}/docs/bunch-files/scripts/automator-workflows), or [open urls]({{ site.baseurl }}/docs/bunch-files/opening-web-pages).
