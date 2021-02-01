---
layout: default
title: Stream Deck
parent: Integration
---
You can add buttons to your Elgato Stream Deck for opening, closing, and toggling Bunches. I detailed this [on my blog](https://brettterpstra.com/2020/09/16/bunch-and-stream-deck/).

{% img 896 729 /bunch/images/streamdeck.jpg %}

The easiest method is just to use an "Open Website" action for a button, then call Bunch's [URL handler](/bunch/docs/integration/url-handler) as the URL. This can be as simple as `x-bunch://toggle/Bunch%20Name`.

You can also integrate further using [Keyboard Maestro](https://www.keyboardmaestro.com/). Create Keyboard Maestro macros to execute one or more Bunch URLs or AppleScripts, and then assign them to buttons on the Stream Deck. There are two plugins available to make this easy. 

First, the [KM Link](https://github.com/Corcules/KMlink) plugin for Stream Deck allows you to select from existing macros and assign them to the button. It's probably the easiest to use.

Second, the official Keyboard Maestro plugin from Elgato is available in the plugins library. With this one, a virtual button code is assigned to each button based on its coordinates on the panel. You can then add a device button trigger to a macro in KM and hit that button to assign it. I reccommend manually assigning a number for row and column so that if you move the button later, it doesn't change which macro it triggers.
