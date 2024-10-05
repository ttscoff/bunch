---
layout: default
title: Quit Everything
parent: Commands
grand_parent: Bunch Files
tags: [kill,quit]
---
{% available 132 %}
# Quit Everything Command

Sometimes you just want a clean slate. The Quit Everything command kills all running applications, with any exceptions that you specify.

The command `(quit everything)` will quit every app that shows up in the Task Switcher/Dock except for Finder. It will not quit apps that are running in your menu bar or in the background.

To quit everything _except_ certain apps, use `(quit everything except...)` and include a comma-separated list of app names or bundle identifiers.

```bunch
(quit everything except MailMate, Firefox, Xcode)
```

This command responds to some variations. You can `quit`, `kill`, or `burn` `everything` or `all`, `but` or `except`.

```bunch
(kill all but iTerm)
(burn everything except nvUltra, MailMate)
(quit all)
```

{% endavailable %}
