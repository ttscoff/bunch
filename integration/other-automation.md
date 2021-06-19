---
layout: default
title: Home Automation
parent: Integration
tags: [integration,webhook]
---
### Home Automation with Indigo

If you use Indigo, there's a whole [REST API](https://wiki.indigodomo.com/doku.php?id=indigo_s_restful_urls) available that you can incorporate using URLs. You can also use [AppleScripts](https://wiki.indigodomo.com/doku.php?id=indigo_s_restful_urls#applescript_the_restful_api) that you can call using `*` lines in your Bunch.

Example REST call to turn my office lights on to 100%:

    $ curl 'http:​//192.168.1.9:8177/devices/office%20lights.json?brightness=100&_method=put'

Using `curl` and a shell command prevents Bunch from trying to open the URL in the browser, performing the HTTP GET request in the background. You can also use `curl` to perform POST requests, add headers and body content, and anything else you need to do.

### IFTTT

Like the Indigo automation, you can set up IFTTT applets to respond to Webhooks and call them with `curl`. You'll need your Maker key, which you can get when you're signed in: visit [this link](https://ifttt.com/maker_webhooks), and click "Documentation." Create a new applet with a Webhook for the "If", give it an event name, and add your "Then" actions. Your URL will look like:

    $ curl -X POST https:​//maker.ifttt.com/trigger/EVENTNAME/with/key/YOURMAKERKEY

### Others?

If you have a home automation system that's scriptable, I'd love to include details here. Please pop into the [Discussions]({{ site.forum }}) and let me know. I swear there has to be a way to script HomeKit devices outside of the Home app and Shortcuts, but I haven't found it...
