---
layout: default
title: Scheduling Bunches
parent: Bunch Files
tags: [frontmatter,scheduling]
---
# Scheduling Bunches
{:.no_toc}
    
* Table of Contents
{:toc}

## Available Keys

You can use Bunch like an alarm clock or timer by making use of some [frontmatter keys]({{ site.baseurl }}/docs/bunch-files/frontmatter) in your Bunch files.

| `open at:`     | Set times to open this bunch daily    |
| `close at:`    | Set times to close this bunch daily   |
| `open on:`     | Set weekdays and time to open weekly  |
| `close on:`    | Set weekdays and time to close weekly |
| `open every:`  | Repeat open at intervals               |
| `close after:` | Set an interval after which to close   |

Bunch will always read in these keys and set the alarms and timers when it launches, so it doesn't matter if you quit the app in between scheduled launches.

Bunches with active schedules will have a timer icon after their title in the menu.

> Tip: By default, Bunches that are already open will ignore a scheduled open, and Bunches that aren't open will ignore a scheduled close. You can override this and have them open or close anyway by using the `ignores state: true` frontmatter setting.
{:.tip}

## Schedules, Screensavers, and Sleep

Bunches scheduled to open or close automatically will work while the screensaver is running or the display is asleep, but will not wake the display or stop the screensaver.

If your Mac is asleep at the scheduled time, it will run when the machine wakes. Bunch will not wake your machine automatically.

## Open at intervals

The `open every` key runs the Bunch at timed intervals. The value should be shorthand for hours and minutes to create an interval: `1h30m` would run it every hour and a half. You can also just use `1h` or `30m`. 

You can also use "d" to specify days. If you want to launch every other day, use "2d". This, however, does not allow you to specify a time. So, for most intents and purposes you'll want to use `open at`.

It will even let you do seconds (`s`), if you needed to.

```
---
open every: 1h30m
---
```

This can be useful for always-open Bunches, though it can be disruptive if launching apps and opening files takes window focus from what you're working on. This is most useful for small Bunches that use things like [Spotlight searches]({{ site.baseurl }}/docs/bunch-files/spotlight-searches) to open files, allowing them to be continually updated.

## Close After an Interval

The `close after` key defines an interval to wait after opening the Bunch before automatically closing it. It uses the same formatting as `open at`, e.g. a time string like `1h30m` or `1d`. This will just start a background timer that will automatically close the Bunch after it's been open for that period of time.

Closing the bunch manually will cancel the timer. If Bunch is quit, the timer will be lost and reset when the Bunch is opened again (even if it's restored at launch).

> Tip: Keep in mind that you can use `%` before app names to ignore them when closing. That means your Bunch can do things like turn on Do Not Disturb or toggle Dark Mode and then restore settings after a set period of time. Combine with  an `open` option to toggle things on and off at set intervals. Apps that are already open will be unaffected by Bunch opens.
{:.tip}

## Daily Schedules

The "at" commands trigger daily.

### Opening Daily

The `open at` key creates a daily "alarm" that will go off at the same time every day, as long as Bunch is running.

```
---
open at: 5pm
---
```

Time can be specified with a meridian (am/pm) or as 24 hour time. Whatever time it initially goes off, it will then start repeating at 24 hour intervals. If Bunch isn't running when the time comes, it will not launch automatically again until the next day.

Multiple times can be listed, separated by commas. To have a Bunch launch at 8am, Noon, and 5pm, use:

```
---
open at: 8am, 12pm, 5pm
---
```

### Closing Daily

You can also use `close at` to close a Bunch at a set time each day. `open at` and `close at` can be used simultaneously. `Close at` uses the same syntax as `open at`.

## Weekly Schedules

The "on" commands trigger weekly, multiple days are allowed.

### Opening Weekly

You can specify a day of the week and a time to create weekly Bunches, great for end-of-the week reviews, or celebrating the weekend by shutting down Slack.

```
---
open on: friday 5pm
---
!Slack
```

Multiple days can be listed with a time, separated by commas. Only one time can be used per group of days, but you can repeat the list. To open at different times on Tuesday and Thursday than on Monday, Wednesday, and Friday, use:

```
---
open on: MWF 8am, TTh 9am
---
```

Days can be just initial letters or spelled out or abbreviated day names. Single letters can be compressed, longer day names should be separated by spaces. In single-letter form, Thursday must have an "h" and Sunday must have a "u", e.g. 'Th' and 'Su'. "T" alone triggers Tuesday, and "S" alone triggers Saturday.

To open at two different times on the same day, repeat the day block with a second time:

```
---
open on: MWF 8am, MWF 12pm
---
```

### Closing Weekly

You can also use `close on` to close a Bunch weekly at a set day and time. `open on` and `close on` can be used simultaneously.

`Close on` uses the same syntax as `open on`.

> Tip: You can always see what the next scheduled event for a Bunch is by hovering over it in the menu. A tooltip will show up displaying the time of the next scheduled open or close event.

## Natural Language Dates

All of the scheduling keys (other than `open every`) allow natural language dates and times. You can just write `1pm` or `tue noon` and it should figure out what you're trying to do. You can view the Console to see the confirmation that scheduling is happening. I don't currently offer a front-end way to see what all is scheduled, but I'd like to eventually.

## Cancelling an Automatic Launch or Close

{% gif images/bunchcancel.gif "Cancelling a scheduled launch" %}

When launching and closing Bunches on a schedule, Bunch will attempt to show a notification 15 seconds before the action happens. Clicking the notification will cause it to the action to happen immediately, and there's a cancel button to skip that scheduled launch until the interval comes around again. This notification system is only tested on Big Sur. I highly recommend setting Bunch's notification style to "Alert" in System Preferences, they work much better for what Bunch uses them for.

