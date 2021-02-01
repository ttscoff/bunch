---
layout: default
title: Running Shell Scripts
parent: Bunch Files
---
# Running shell scripts and commands

Lines starting with a dollar sign (\$) are run as shell commands. Anything after the `$` will be executed by `/bin/sh`. This can be a shell script file or a direct command. No output is sent or received by this action, other than the arguments you provide on the "command line." If the script returns an error, a notification with a shortcut to the log will be shown when you run the Bunch. Both STDERR and STDOUT are reported to [the log](/bunch/docs/using-bunch/bunch-log) for debugging purposes.

**Important:** in the case of scripts, ensure that your script has a hashbang (a.k.a "shebang", e.g. `#!/usr/bin/env ruby`, `#!/bin/bash`, or `#!/usr/bin/osascript -l JavaScript` at the top of the file). If your script isn't set to executable permissions and you call it without specifying the processor, the executable will be determined from the hashbang line.

## Scripts

If the first element of a `$` line is a full path to a file, or a path relative to your Bunch folder, and the file exists, it will be executed directly. This assumes either a binary or an executable file with a proper hashbang in the script. Arguments can be passed on the same line.

Any spaces in filenames or within arguments should be escaped just like they would on the command line, using either double quotes or escaping individual spaces with backslashes.

    $ my\ script.sh "argument 1" arg2

## Raw commands

If the content of the `$` line is not a recognizable file, it will be executed with `/bin/sh -c`.

## Arguments and environment variables

You can specify direct arguments after the command or shell script path. Like the Automator actions above, you can also use `- ...` lines below the script line to set environment variables. Because the `/bin/sh` is running outside your user, even the `$HOME` variable isn't set by default (but Bunch figures it out and includes it for you). The following environment variables are available:

- `$BUNCH` => name of current bunch
- `$BUNCH_DIR` => the location of your Bunches from preferences
- `$HOME` => path to user home folder
- `$PATH` => a basic path is set that includes `/usr/local/bin`
- `$BUNCH_DND` => current state of Do Not Disturb (1 if on, 0 if off)
- `$BUNCH_DOCK` => current visibility of Dock (1 if visible, 0 if autohide)
- `$BUNCH_DESKTOP_ICONS` => current visibility of Desktop icons (1 if visible, 0 if hidden)

If you need to provide additional environment variables to your script, set it up like:

    $ /Users/ttscoff/scripts/myscript.rb
    - HOME=/Users/ttscoff
    - FOO=bar

These will be the equivalent of an `export FOO=bar` command prior to running your script. If you set `HOME`, it will override what Bunch sets. If you set `PATH`, it will be inserted before (higher priority than) Bunch's default path in the environment.

The contents of the Bunch's [frontmatter](/bunch/docs/bunch-files/frontmatter/) are also made available as environment variables. For example, if your frontmatter includes `Last Name: Meyer`, it would be available as `$lastname` in a shell script. All built-in frontmatter keys and any arbitrary keys defined are accessible.

As I mentioned, Bunch doesn't do anything with the output of a command, other than report it [in the log](/bunch/docs/using-bunch/bunch-log/). If you want to react to shell command output, use Automator with a Run Shell Script action. If you want feedback while running, you can always use AppleScript in your shell script:

    osascript -e "display notification \"$INFO\""

> You can fork a script using the `$BUNCH` variable. If you have a script with common tasks but you need it to differ between Bunches in some way, do something along the lines of (in Bash):
>
> `if [[ $BUNCH == Default ]]; then...`
>
> Or Ruby:
>
> `if ENV['BUNCH'] == "Default"`
>
> Et cetera.
{:.tip}
