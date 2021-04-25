---
layout: default
title: Running Shell Scripts
parent: Running Scripts
grand_parent: Bunch Files
tags: [display, shell, scripts]
---
# Running Shell Scripts and Commands
{:.no_toc}

* Table of Contents
{:toc}

Lines starting with a dollar sign (`$`) are run as shell commands. Anything after the `$` will be executed by `/bin/sh`. This can be a shell script file or a direct command.

```bunch
$ say "I'm a shell command!"
```

Every command a Bunch runs gets its own "shell" and will show up in the menu under "Running Scripts." Selecting a script in the menu will show you a window with the STDOUT and STDERR of the command, its current status, and buttons for pausing or killing the process. This menu will show scripts for all open Bunches. When a Bunch is closed, its processes are terminated and removed from the list.

If a task monitor isn't visible for a task, output (both STDOUT and STDERR) from the script will be written to the Bunch Log at Debug level.

> **Important:** in the case of scripts, ensure that your script has a hashbang (a.k.a "shebang", e.g. `#!/usr/bin/env ruby`, `#!/bin/bash`, or `#!/usr/bin/osascript -l JavaScript` at the top of the file). If your script isn't set to executable permissions and you call it without specifying the processor, the executable will be determined from the hashbang line.
{:.warning}

## Scripts

If the first element of a `$` line is a full path to a file, or a path relative to your Bunch folder[^relative], and the file exists, it will be executed directly. This assumes either a binary or an executable file with a proper hashbang in the script. Arguments can be passed on the same line.

[^relative] Remember that relative paths in Bunches within subfolders are relative to the base Bunch Folder, not the containing subfolder.

Any spaces in filenames or within arguments should be escaped just like they would on the command line, using either double quotes or escaping individual spaces with backslashes.

```bunch
$ my\ script.sh "argument 1" arg2
```

> If the script has a "shebang" line, it will be executed using the specified processor, e.g. `#!/usr/bin/ruby` will cause the script to be run as `/usr/bin/ruby SCRIPT ARGS`. If it lacks a shebang, it will be executed using `/bin/sh SCRIPT ARGS`.

## Raw commands

If the content of the `$` line is not a recognizable file, it will be executed with `/bin/sh -c`. It's possible to chain commands with `&&` and `||`. 

It's not recommended that you background commands run by a Bunch (using `&`).

<!-- ## Ignoring Errors

By default Bunch will check for non-zero exits and output to STDERR. If both exist, a notification of script error will be shown. It's assumed that in most cases, you'd want to know that kind of thing. But if you want to ignore errors, just add `2> /dev/null` to any shell commands or potential error lines within scripts. As long as STDERR is empty, the notification won't be triggered. You can still see the error code in the log.

    $ my\ script.sh "argument 1" arg2 2> /dev/null

Within scripts you can also exit with a zero error code regardless of errors that happen within the script, thereby suppressing any response from Bunch.
 -->

## Arguments and environment variables {#argsandenv}

You can specify direct arguments after the command or shell script path. As with [Automator Workflow]({{ site.baseurl }}/docs/bunch-files/scripts/automator-workflows) items, you can also use `- ...` lines below the script line to set environment variables. 

When Bunch launches it checks your default shell (`$SHELL`) and performs a login in the background to get your usual environment variables. Your path and any custom environment should be picked up before the first time you run a script.

Additionally, the following environment variables are available:

| Variable               | Value                                              |
| ---------:             | -----------                                        |
| `$BUNCH`               | name of current bunch                              |
| `$BUNCH_DIR`           | the location of your Bunches from preferences      |
| `$HOME`                | path to user home folder                           |
| `$BUNCH_DND`           | Do Not Disturb state (1: on, 0: off)               |
| `$BUNCH_DOCK`          | Dock visibility (1: visible, 0: autohide)          |
| `$BUNCH_DESKTOP_ICONS` | Desktop icons (1: visible, 0: hidden)              |
| `$BUNCH_PHASE`         | "OPEN" or "CLOSE"                                  |

> You can fork a script using the `$BUNCH` variable. If you have a script with common tasks but you need it to differ between Bunches in some way, do something along the lines of (in Bash):
>
> `if [[ $BUNCH == Podcast ]]; then...`
>
> Or Ruby:
>
> `if ENV['BUNCH'] == "Podcast"`
>
> Et cetera. You can also fork on BUNCH_PHASE to perform different tasks when opening and closing a Bunch using the same script.
{:.tip}


If you need to provide additional environment variables to your script, include them as "files":

```bunch
$ /Users/ttscoff/scripts/myscript.rb
- FOO=bar
- BAZ=fubar
```

These will be the equivalent of an `export FOO=bar` command prior to running your script. If you set `HOME`, it will override what Bunch sets. If you set `PATH`, it will overwrite the path that Bunch picked up automatically.

The contents of the Bunch's [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/) are also made available as environment variables. For example, if your frontmatter includes `Last Name: Meyer`, it would be available as `$lastname` in a shell script. All built-in frontmatter keys and any arbitrary keys defined are accessible.

> Remember that you can always __manually source your startup or configuration files__ from your default shell within any shell scripts. For example, if you want to use RVM in a Bunch script, use something like this at the top of the script:
>
>    ```
>    #!/bin/bash
>    source "$HOME/.rvm/scripts/rvm"
>   ```
{:.tip}

> __Zsh users__ will want to note that `.zshrc` won't be read by the non-interactive shell that Bunch runs. Environment variables you want picked up should be stored in `.zshenv`.
{:.warning}

Bunch doesn't do anything with the output of a command other than report it [in the log]({{ site.baseurl }}/docs/using-bunch/bunch-log/) or the task monitor (except in the case of [`from script` frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter#dynamicfrontmatter)). If you want to react to shell command output, use Automator with a Run Shell Script action. If you want feedback while running, you can always use AppleScript in your shell script:

    osascript -e "display notification \"$INFO\""


## Monitoring Scripts

Scripts launched by a Bunch show up under "🔴 Shell Scripts" in the 
Bunch menu. Clicking any script in the list will open a task monitor 
for that script. The monitor shows STDOUT at the top, STDERR at the 
bottom, and the status bar shows whether the task is running, paused, 
completed, or terminated along with any non-zero exit codes.

> Closing the window does not terminate the task. Windows can be 
reopened at any time from the Shell Scripts menu.
{:.tip}

The display window understands ANSI colors and emoji in the script or 
command output.

There's a Pause button that will suspend the primary task for the 
monitor. If the primary task is a script that has launched 
subprocesses (as most scripts do), those subprocesses will not be 
paused by this button. When a script is paused the button will read 
"Resume" and will resume the paused task when clicked.

The Kill button will send a SIGSTOP command to the process. This should kill any child processes as well, assuming they haven't been run in the background by the script. Once a script is terminated or completed, the button changes to read "Restart" and clicking it will re-run the script or command.

> Pause and Kill buttons do not appear on windows set to "wallpaper" level. These windows cannot be interacted with, so there's no point in having buttons. The STDERR output is also set to 20% of the window's height, as it can't be manually revealed at wallpaper level.
{:.warning}

### Customizing The Task Monitor

You can cause a task monitor to display for a task automatically by including `(display)` at the end of the command:

```bunch
$ cd ~/Sites/bunch && jekyll serve (display)
```

The display command in a shell command can take the same arguments as the regular [display command]({{ site.baseurl }}/docs/bunch-files/commands/display/#window), just without the file path that the regular command would require. For example, to run a command with a visor-like window on your second display, you can use:

```bunch
$ ~/scripts/myscript.sh (display d:1 100%x300 left,top #333 #b0d17d a:95% l:d)
```

If a background color is specified without a foreground color, a contrasting color will automatically be assigned. If your background color is more than 50% black, the window will be Dark Aqua (dark mode appearance), lighter backgrounds will get regular Aqua (light mode appearance).

All size, positioning, and color arguments are optional, and any combination of them can be used. See the [`display` window documentation]({{ site.baseurl }}/docs/bunch-files/commands/display/#window) for details.

The following command sets up a local Jekyll server for developing this documentation, with a task monitor in the upper right quarter of my secondary display:

```bunch
$ ~/Sites/dev/bunch/servejekyll.sh (display d:1 50%x50% right,top #222 #38c5eb a:95% l:d)
```

{% img aligncenter /images/jekyllmonitor.jpg 800 500 "Jekyll server with display" %}

## Order of Execution

If you have multiple scripts that need to run in order, set the [sequence of execution]({{ site.baseurl }}/docs/bunch-files/sequence/) to "sequential." With this set, you can use `|` prefixes to launch other items in parallel, if desired, but scripts will wait for the previous script to complete before executing.

```bunch
---
sequence: sequential
---
$ script1.sh
$ script2.sh
| Firefox
| Tweetbot
```


## Running in a Terminal

As an alternative to using the task monitor, you can [send keystrokes]({{ site.baseurl }}/docs/bunch-files/keystrokes/) to your terminal application to run commands in an interactive shell. The following example works with both Terminal and iTerm.

```bunch
iTerm
- {@t "cd ~/Sites/dev/bunch" return "jekyll serve" return}
```

This sends a ⌘T to open a new tab, then types out commands, pressing return after each.
