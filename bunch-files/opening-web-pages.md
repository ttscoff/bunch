---
layout: default
title: Opening Websites/URL schemes
parent: Bunch Files
tags: [display,browser]
---
# Opening URLs

If you want to open web pages as part of a Bunch, you can just put a URL at the beginning of a line (like you would an app) and that URL will be opened in your default browser. If the URL is a URL scheme for an installed app, it will be executed as if called from a link or via the `open` command.

    https://hulu.com
    https://brettterpstra.com
    x-marked://open?file=filename.md


## Opening URLs in a Specific Browser {#specificbrowser}

If you want to open a url in a specific browser, you can use prefixes before the url. Examples:

    safari:​https://brettterpstra.com
    firefox:​https://mozilla.org

The recognized browser prefixes are:

- `brave:`
- `chrome:` (Google Chrome)
- `edge:` (Microsoft Edge)
- `firefox:`
- `opera:`
- `safari:`
- `tor:` (TorBrowser)
- `vivaldi:`

In most cases, you can also send a URL as a file to a browser and it will open it properly, as in:

    Safari
    - https://brettterpstra.com/bunch


