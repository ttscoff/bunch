---
layout: default
title: Opening Websites/URL schemes
parent: Bunch Files
tags: [display,browser,webpage,website]
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
    - https://bunchapp.co

## Sending GET/POST Requests

Some URLs, such as webhook triggers, are meant to be pinged but not opened in your browser. To accomplish this with Bunch, you can use the `curl` command in a shell script item. See [Home Automation]({{ site.baseurl }}/docs/integration/other-automation/) for examples of sending GET requests using `curl`.
