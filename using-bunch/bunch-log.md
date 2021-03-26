---
layout: default
title: Bunch Logging
parent: Using Bunch
tags: [log,scripts]
---
# Bunch Log

Because Bunch is reading plain text files and running everything in the background, it's easy for things to not work the way you expected and leave you with little idea what went wrong. That's where the Bunch Log comes in.

Bunch records every action it takes --- and any errors it runs into --- in a log file that you can access using Console.app. There's a handy shortcut under __Help->Open Log__ that will take you right to it. Notification Center error alerts can also open the log, just click the Show Log button on the notification.

## Log Levels

You can set the verbosity of the log using __Help->Set Log Level__. Choose to see only errors, errors and warnings, or all messages. Debug level settings are typically not needed and are fairly verbose, but feel free to peek at Bunch's underbelly.

## Log Entry Structure

The log lines start with an indicator of log level. If it's just an info message, it has a grey circle. If it's an alert or warning, it has a yellow circle. Red circles are for errors.

Next is the date and time of the message.

In square brackets is the name of the Bunch that logged the message. If it's a Bunch called by another Bunch, its lineage will be shown, e.g. `[Podcast->Comms->Music]`.

Lastly, the log message itself.

Here's a sample log:

```
⚪2021-01-23 14:32:16: Launched ==========================================
⚪2021-01-23 14:32:16: [Default] Setting display title to "👍Important Stuff"
⚪2021-01-23 14:32:16: [Music] Setting display title to "🎵Easy Listening"
⚪2021-01-23 14:32:16: [Misc] Setting display title to "😴Relax"
⚪2021-01-23 14:32:16: [Marked Screencast] Setting display title to "🎥Marked Screencast"
⚪2021-01-23 14:32:16: [Bunch] Setting display title to "🍇Bunch"
⚪2021-01-23 14:32:16: [Marked] Setting display title to "📖Marked"
⚪2021-01-23 14:32:16: [Podcast] Setting display title to "🎤Podcast"
⚪2021-01-23 14:32:16: [Comms] Setting display title to "📞Comms"
🟡2021-01-23 14:32:16: [Comms] Scheduled to open daily starting 2021-01-23 22:21:45 +0000
⚪2021-01-23 14:32:16: [nvUltra] Setting display title to "🚀nvUltra"
⚪2021-01-23 14:32:16: [Code] Setting display title to "🖥Coding"
⚪2021-01-23 14:32:16: [Comms] Open >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
⚪2021-01-23 14:32:16: [Comms] Adding 12s delay to (* tell application "Moom" to arrange windows according to snapshot "Comms")
⚪2021-01-23 14:32:16: [Comms] Opening app Tweetbot 
⚪2021-01-23 14:32:16: [Comms] Opening app MailMate 
⚪2021-01-23 14:32:16: [Comms] Opening app Slack 
⚪2021-01-23 14:32:16: [Comms] Opening app Messages 
⚪2021-01-23 14:32:16: [Comms] Opening app Discord 
⚪2021-01-23 14:32:28: [Comms] Running AppleScript (tell application "Moom" to arrange windows according to snapshot "Comms")
```

You should be able to compare the results of opening a Bunch to your Bunch file and see what worked, what didn't, and what might have had unexpected results.
