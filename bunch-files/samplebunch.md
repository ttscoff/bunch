---
layout: default
title: Sample Bunches
parent: Bunch Files
nav_order: 3
---
# Some examples to get you started
{:.no_toc}

* Table of Contents
{:toc}

## Example.bunch

This example demonstrates the basic syntax for a Bunch file.

```
# Comments start with a hash symbol, blank lines are ignored

# Use @@ to hide all visible apps. Usually used at the top of the file
# before launching the rest of the bunch
@@

# Apps to launch start at the beginning of a line, no
# need to quote or escape.
Messages

# Apps launched by a Bunch can be quit when the Bunch is closed
# Add a percent symbol to ignore it when quitting (keep it running)
%Terminal

# Include a line starting with a dash to open specific
# files in the app
# If the first file listed is "XX", all open windows
# for the app will be closed first
Finder
- XX
- ~/Desktop
- ~/Documents

# Commands are surrounded by parenthesis. Only commands Bunch
# recognizes will be executed
# ([hide|show] dock) -> Turn Dock autohiding on or off
# ([hide|show] desktop) -> Show or hide desktop icons
# (dnd [on|off]) -> Turn Do Not Disturb on or off
(show dock)

# Use a URL instead of an app to open it in your
# default browser
https://brettterpstra.com/projects

# You can also use URL schemes from other apps
x-marked://open?file=Work Stuff.md

# Start a line with an exclamation point to quit that app if it's running
!Mail

# Start a line with an asterisk (*) to execute as applescript
* say "Bunch launched"

## Or run a shell script with a dollar sign ($)
## and set environment variables with "file" markers
# $ /usr/local/scripts/myscript.sh arg1 arg2
# - KEY=value

## Or an Automator Workflow with an ampersand (&)
## File markers will set variables for the workflow
# & ~/Documents/My Workflow.workflow
# - key=val

# Start a line with @ to "focus" that app (hide others)
# Focus commands should be the last item in the Bunch
@Marked 2

# See the documentation for more info: https://brettterpstra.com/bunch/docs
```

## Podcasting

Here's my `Podcast Record.bunch`.

```
---
title: 🎤Podcast: Record
---
###### Start podcasting ###################################
## Quit comms Bunch, closing apps it contains. Apps present in this Bunch
## (Messages, Discord) won't be quit by the other Bunch.
!Comms.bunch
Messages
Discord

## Do not disturb mode
(dnd on)

###### Set up audio devices ###############################
## Save audio device settings with a shell script
## https://gist.github.com/c5d61971d5251b8795af2415cc1bbb85
$ ~/scripts/volumetoggle.rb save

## Input/output devices can be referred to using partial names
(audio output macbook)
(audio output mute)
(audio input komplete audio 6)

####### Open the necessary apps ###########################
## Hide all open apps
@@
## Make sure nvUltra is open to my Podcasting notebook for show notes
%nvUltra Beta
- XX
x-nvultra://open/~/Dropbox/Notes/Podcasting

### Open Quip for documents I share with my co-host
Quip

## Open my recording software, then make sure  that only the Session window is
## showing by  sending keystrokes to open the Recordings window then close it
Audio Hijack
- {@0 @w}

## And, well, Skype, because I'm old
Skype

## Quit the bandwidth heavy apps
$ killall Dropbox
$ /Library/Backblaze.bzpkg/bztransmit -pausebackup

## Check for ad spots
firefox:https://podman.backbeatmedia.com/shows

## Use Moom to position windows after everything has launched
## References the embedded snippet at the end using `<<`
    <<#Position Podcast ~4



# When I'm finished
!$ ~/scripts/volumetoggle.rb restore
!$ /Library/Backblaze.bzpkg/bztransmit -completesync
## Double negatives (!!) to launch apps and other Bunches when closing
!!Dropbox
!!Comms.bunch
___
--[Position Podcast]-----------------------------------------------------------
* tell application "Moom" to arrange windows according to snapshot "Podcasting"

```

## Communication Apps

I have this Bunch load on launch. It makes it easy to quit all of these apps at once, and load them back up at my convenience.

```
---
title: 📞Comms
startup: true
---
## Fragment identifiers allow me to load this Bunch as a snippet and execute
## just parts of it as needed. They're ignored when loading as a Bunch.
#[Social]
Tweetbot
## (Facebook runs in a Unite Single Site Browser)
Facebook

#[Work]
|%MailMate
|Slack
|Messages

#[Podcast]
Discord

# Use an embedded Waiting Snippet to position windows after everything has 
# launched (with additional 2s delay)
    <<#Position Comms ~2
___
--[Position Comms]--
* tell application "Moom" to arrange windows according to snapshot "Comms"
```

## Coding

Here's the Bunch I use when I'm ready to work on Bunch.

```
---
Title: 🍇Code: Bunch
---
# Stop any current Timing task and start new task
& workflows/Timing
- task = Bunch
- project = Development

# When quitting bunch, stop current task
!& workflows/Timing

# Use `%` before an app to keep it open when closing the Bunch
%Xcode
- /Users/ttscoff/Desktop/Code/Bunch/Bunch.xcodeproj
# Focus Xcode, hiding everything else
@Xcode

# Then load Tower and Sublime Text, or unhide them if they're running
%Sublime Text
- /Users/ttscoff/sites/dev/bunch/BunchDocs.sublime-project
- /Users/ttscoff/Dropbox/Sync/Bunches/Bunches.sublime-project

Tower
- ~/Desktop/Code/Bunch


# Ask if I want coding music, and if so, open Spotify to my coding playlist
<useful.snippets#Coding Spotify ?"Play Coding Music?"
```

The snippet fragment this Bunch calls calls an Automator Workflow with a variable for the playlist:

```
# in the file `useful.snippets`
---------------------------------------------[Coding Spotify]-
Spotify
& workflows/Play Spotify URL
- URL=spotify:playlist:3cSpIL4Q0H3uqdBMbT6c9x
- Autoplay=${autoplay:true}
```

