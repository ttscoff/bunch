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
- `canary:` (Google Chrome Canary)
- `edge:` (Microsoft Edge)
- `firefox:`
- `firefoxdev:` (Firefox Developer Edition)
- `opera:`
- `safari:`
- `tor:` (TorBrowser)
- `vivaldi:`

In most cases, you can also send a URL as a file to a browser and it will open it properly, as in:

```bunch
Safari
- https://bunchapp.co
```

{% available 150 %}
### Opening in a Specific Chrome Profile

For the `chrome:` and `canary:` prefixes, you can also include a profile name in square brackets to have a url open in a specific profile. This will open a new window with the profile, and multiple links targeting the same profile will open tabs in that window.

```bunch
chrome[work]:https://brettterpstra.com
chrome[work]:https://duckduckgo.com
chrome[personal]:https://hulu.com
```

Profile names are case insensitive and allow partial matches ("work" will match the profile "Work Profile"). Bunch will go with the first matching name it finds.

Profiles cannot be used when passing URLs as file lines.
{% endavailable %}

## Sending GET/POST Requests

Some URLs, such as webhook triggers, are meant to be pinged but not opened in your browser. To accomplish this with Bunch, you can use the `curl` command in a shell script item. See [Home Automation]({{ site.baseurl }}/docs/integration/other-automation/) for examples of sending GET requests using `curl`.
