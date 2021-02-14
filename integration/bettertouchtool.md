---
layout: default
title: BetterTouchTool
parent: Integration
---
# Integrating with BetterTouchTool

[btturl]: https://docs.folivora.ai/docs/1103_custom_url_scheme.html
[bttas]: https://docs.folivora.ai/docs/1102_apple_script.html
[btt]: https://folivora.ai/

[BetterTouchTool][btt] is an amazing automation utility for building actions for your trackpad, keyboard, touch bar, and more. It's available [via Setapp](https://go.setapp.com/stp44) and as a [standalone purchase](https://folivora.ai/buy). It also happens to have a fully-fledged url scheme that can be used to trigger actions, save and set variables, and even things like updating text in your touch bar or displaying webviews and HUDs.

## Triggering BetterTouchTool from Bunch

Possibilities include adding mouse movement and click actions to your Bunches, positioning and sizing windows, controlling music players, connecting/disconnecting Bluetooth devices, modifying system settings that Bunch doesn't handle, and more, all without having to write scripts (although scripting is also an option).

See the [BetterTouchTool URL handler documentation][btturl] to see what's possible. When you're ready to trigger an action from your Bunch, it's as easy as dropping a URL into your Bunch file.

You can click any action and choose "Copy Link to Activate Trigger" to get a URL ready to paste directly into your Bunch. It will look like:

    btt://execute_assigned_actions_for_trigger/?uuid=4D05E320-E682-411A-81A5-BD9B82DD8B4D

To trigger a named trigger:

    btt://trigger_named/?trigger_name=TriggerName

You can also control BetterTouchTool with its [extensive AppleScript library][bttas], if you prefer. Just be sure to enable external scripting in Preferences->General.

## Triggering Bunch from BetterTouchTool {#btttriggeringbunch}

You can also use BetterTouchTool to add system tools that trigger Bunches outside of the Bunch menu. Whether it's assigning a Bunch trigger to a gesture, or adding Touch Bar icons for Bunches to your MacBook Pro, BetterTouchTool makes it easy.

Just add the type of trigger you want, then assign an Open URL action to it with a [Bunch URL]({{ site.baseurl }}/docs/integration/url-handler).
