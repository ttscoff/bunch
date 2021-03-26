---
layout: default
title: Hammerspoon
parent: Integration
tags: [integration]
---
# Integrating with Hammerspoon

[Hammerspoon](https://www.hammerspoon.org/) is a powerful automation utility that includes menu interaction and window management capabilities.

You can bind Hamerspoon actions to its URL handler:

```
hs.urlevent.bind("someAlert", function(eventName, params)
    hs.alert.show("Received someAlert")
end)
```

This creates a url handler `hammerspoon://someAlert`. You can simply put that URL on a line in a Bunch to launch that action.
