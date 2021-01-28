---
layout: default
title: Stream Deck
parent: Integration
---
You can add buttons to your Elgato Stream Deck for opening, closing, and toggling Bunches. I detailed this [on my blog](https://brettterpstra.com/2020/09/16/bunch-and-stream-deck/).

The easiest method is just to use an "Open Website" action for a button, then call Bunch's [URL handler](/bunch/docs/integration/url-handler) as the URL. This can be as simple as `x-bunch://toggle/Bunch%20Name`.

You can also integrate further using [Keyboard Maestro](https://www.keyboardmaestro.com/) and the [KM Link](https://github.com/Corcules/KMlink) plugin for Stream Deck.
