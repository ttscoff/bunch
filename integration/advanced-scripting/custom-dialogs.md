---
layout: default
title: Custom Dialogs
parent: Advanced Scripting
grand_parent: Integration
tags: [interactive,dialog]
---
# Multiple Choice Dialogs

Bunch's [multiple choice interactivity feature]({{ site.baseurl }}/docs/bunch-files/interactivity/#multiplechoice) can make this example a simpler process, but it serves as a demonstration of using external scripting to provide a multiple choice menu. It can be used to extend beyond the basic menuing that Bunch provides.

## Selecting A Spotify Playlist

Here's an example using `from script` frontmatter to let you pick from your favorite Spotify playlists or perform a Spotify search.

The script is in JavaScript (for Automation) and saved in a `scripts` folder inside my Bunch folder. I can reference it with the relative path `scripts/ChoosePlaylist.applescript`.

The script would take some modification with your own playlists and titles, but would be easy to change:

```js
#!/usr/bin/osascript -l JavaScript

var app = Application.currentApplication()
app.includeStandardAdditions = true

var playlists = {
    "Mellow": "spotify:​playlist:37i9dQZF1E35F7NsH3aWbs",
    "Pop": "spotify:​playlist:37i9dQZF1E39mpAvbgovri",
    "Punk": "spotify:​playlist:37i9dQZF1E3930Ag6USpnA",
    "Indie": "spotify:​playlist:37i9dQZF1E39UzhnpcOJqd",
    "Metal": "spotify:​playlist:37i9dQZF1E35o96rAfTenf",
    "Rock": "spotify:​playlist:37i9dQZF1E38gxK1HWfQU0",
    "Search": ""
}


var list = app.chooseFromList(Object.keys(playlists), {
    withPrompt: "What to play?",
    defaultItems: ["Search"]})[0];

if (list === undefined) {
    'spotify url: spotify:'
} else if (playlists[list] === "") {
  var search = app.displayDialog("What to search for?", {
    defaultAnswer: "",
    buttons: ["Cancel", "Search"],
    defaultButton: "Search"
  });
  `spotify url: spotify:​search:${encodeURIComponent(search.textReturned)}`
} else {
  `spotify url: ${playlists[list]}`
}
```

The above script offers a list with the keys from the `playlists` object. If you cancel, it outputs Spotify's base url handler, 'spotify:'. If you select "Search," it pops up a second dialog asking for a search string, then formats that into a URL encoded Spotify URL for searching. If you pick a playlist, it returns the value for that key, which is already a full Spotify URI.

Now create a Bunch that just contains:

```bunch
---
title: 🎵Listen
from script: scripts/ChoosePlaylist.applescript
---
Silicio
<<#Search Spotify
___
---[Search Spotify]---
Spotify
- ${spotifyurl}
```

When the Bunch is opened, it runs the above script and stores the `spotifyurl` variable. The embedded snippet launches Spotify and passes the URL to it. Having Silicio and Spotify in the Bunch means that when I close it, both apps quit, making music listening easy to manage. You could also add automation for setting audio devices and volumes, running Moom to position windows, etc.

```bunch
---
title: 🎵Listen
from script: scripts/ChoosePlaylist.applescript
---
(audio output Komplete Audio)
Silicio
<<#Search Spotify
___
-[Search Spotify]
Spotify
- ${spotifyurl}
# Alternatively to the file parameter,
# you could use this to start playing immediately:
# * tell app "Spotify" to play track "${spotifyurl}"
```

{% hovergif images/listendemo.mp4 "Animation demonstrating the Listen Bunch" "Listen.bunch" %}
