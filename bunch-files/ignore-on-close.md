---
layout: default
title: Ignore When Closing
parent: Bunch Files
---
# Ignoring apps/commands on close

When you close a Bunch (or "Toggle Bunches" or "Single Bunch Mode" are enabled), any apps launched by the Bunch will be quit. To avoid quitting an app when the Bunch is closed or toggled off, place a percent symbol before it in the Bunch (e.g. `%Finder`). This will launch the app as normal, but ignore it when closing the Bunch.

    %iTerm
    CodeRunner

In this example, CodeRunner will launch and quit with the Bunch, but iTerm will only launch if it's not already running, and will remain running if the Bunch is closed.

This works for commands as well:

    %(dark mode)

This will enable Dark Mode when opening the Bunch, and leave it in Dark Mode when closing.
