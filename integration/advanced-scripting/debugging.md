---
layout: default
title: Debugging Scripts
parent: Advanced Scripting
grand_parent: Integration
tags: [log,scripts,debug]
---
# Debugging Scripts Run By Bunch

STDOUT and STDERR from scripts run by Bunch are reported in the [Bunch Log]({{ site.baseurl }}/docs/using-bunch/bunch-log), if your Log Level is set to Debug (__Help -> Set Log Level__). 

If your script is returning an exit code other than 0 and there's content in STDERR, the script will produce an error in the log. All pertinent error messages will be shown.

You can use the log output to see variables and debugging statements by simply printing/echoing them to STDOUT/STDERR from your script. As long as your script returns a 0 exit code, printing to STDERR won't interrupt Bunch's execution of the script.

Several [environment variables]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts#argsandenv) are sent to any script run by Bunch. You can see this in the log by having your script execute `/usr/bin/env`. The output will go to STDOUT and be visible in the log.

```
2021-02-04 07:30:28: ⚪[shell scripts] /usr/bin/env STDOUT:
SHELL=/usr/local/bin/fish
COMMAND_MODE=unix2003
HOME=/Users/ttscoff
TMPDIR=/var/folders/q7/sps8n5_534q22bx1ts4xjjl00000gn/T/
BUNCH_DIR=file:///Users/ttscoff/Dropbox/Sync/Bunches/Testing/
NSUnbufferedIO=YES
PATH=/Developer/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
BUNCH_DESKTOP_ICONS=0
USER=ttscoff
BUNCH=shell scripts
LOGNAME=ttscoff
BUNCH_DOCK=1
title=Shell Scripts
BUNCH_DND=0
```
