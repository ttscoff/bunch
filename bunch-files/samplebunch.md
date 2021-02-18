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

These are mostly Bunches that I (Brett, the developer) actually use. Several of them incoporate [Embedded Snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets) in these examples so I don't have to also include all of my snippet files to let you see what's going on. Anything in an Embedded Snippet can also be moved to an external file.

These examples make use of [comments]({{ site.baseurl }}/docs/bunch-files/comments/) to explain what's happening.

## Example.bunch

This example demonstrates the basic syntax for a Bunch file.

```
# Comments start with `#` or `//` and a space
# blank lines are ignored

/* 
Comments can also use a block syntax 
for multi-line comments 
*/

/* 
Use @@ to hide all visible apps. Usually used at the top of the 
file before launching the rest of the bunch */
@@

/* Apps to launch start at the beginning of a line, no
need to quote or escape. */
Messages

# Apps launched by a Bunch can be quit when the Bunch is closed
%Terminal // Add a percent symbol to ignore it when quitting (keep it running)

/* Include a line starting with a dash to open specific
   files in the app.
   If the first file listed is "XX", all open windows
   for the app will be closed first */
Finder
- XX
- ~/Desktop
- ~/Documents

/* 
Commands are surrounded by parenthesis. Only commands Bunch
recognizes will be executed
([hide|show] dock) -> Turn Dock autohiding on or off
([hide|show] desktop) -> Show or hide desktop icons
(dnd [on|off]) -> Turn Do Not Disturb on or off
*/
(show dock)

# Use a URL instead of an app to open it in your default browser
https://brettterpstra.com/projects

# You can also use URL schemes from other apps
x-marked://open?file=Work Stuff.md

# Start a line with an exclamation point to quit that app if it's running
!Mail

# Start a line with an asterisk (*) to execute as applescript
* say "Bunch launched"

/* Or run a shell script with a dollar sign ($)
   and set environment variables with "file" markers */
# $ /usr/local/scripts/myscript.sh arg1 arg2
# - KEY=value

/* Or an Automator Workflow with an ampersand (&)
   File markers will set variables for the workflow */
# & ~/Documents/My Workflow.workflow
# - key=val

/* Start a line with @ to "focus" that app (hide others)
   Focus commands should be the last item in the Bunch */
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
/* 
Fragment identifiers allow me to load this Bunch as a snippet and execute
just parts of it as needed. They're ignored when loading as a Bunch.
*/
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

/* 
Use an embedded Waiting Snippet to position windows after everything has 
launched (with additional 2s delay)
*/
    <<#Position Comms ~2
___
--[Position Comms]--
* tell application "Moom" to arrange windows according to snapshot "Comms"
```

## Coding

Here's the Bunch I use when I'm ready to code. It offers a choice of my main projects using [Query Dictionary syntax]({{ site.baseurl }}/docs/bunch-files/interactivity/#dictionary). It launches all of the common apps between the projects and tells Bunch not to quit them when the Bunch closes with a `%`. It uses [Embedded Snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets) to load the appropriate projects, and [Moom]({{ site.baseurl }}/docs/integration/moom/) in a [Waiting Snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet) to position the windows according to a snapshot after everything loads.

I have folder sets set up in [Forklift]({{ site.baseurl }}/docs/integration/forklift/), with keystrokes assigned that this Bunch sends.

```
---
title: 🖥Code
sequence: parallel
---
/* Launch all of the necessary apps and tell Bunch to ignore 
   them when closing. */
%iTerm
%Sublime Text
%Xcode
%Tower
%Forklift

/* Ask me which project I want to work on. If I cancel, no 
   project files will be loaded. */
?{
    Marked => <<#Marked
    nvUltra => <<#nvUltra
    Bunch => <<#Bunch
} "Whatcha workin' on?"

// Ask if I want to play my Coding Music playlist in Spotify.
<<#Coding Spotify ?"Play Coding Music?"

// Run a Moom snapshot after everything has loaded
    <<#Moom
___

------------------------------------------------------------[Marked]-
& workflows/Timing
- task = Marked
- project = Development
!& workflows/Timing

Xcode
- ~/Desktop/Code/marked/Marked.xcodeproj
@Xcode

Forklift
- {^$~m}

Tower
- ~/Desktop/Code/marked

$ subl -p ~/Desktop/Code/marked/markedsimple.sublime-project
$ subl -p ~/Desktop/Code/marked/HelpDocs/HelpDocs.sublime-project

Xcode

-----------------------------------------------------------[nvUltra]-
& workflows/Timing
- task = nvUltra
- project = Development
!& workflows/Timing

MeisterTask
Slack

%Xcode
- ~/Desktop/Code/notnvalt/notnvAlt.xcodeproj
@Xcode

Forklift
- {^$~n}

Tower
- ~/Desktop/Code/notnvalt

$ /usr/local/bin/subl -p $HOME/Desktop/Code/notnvalt\ themes.sublime-project
$ /usr/local/bin/subl -p $HOME/Desktop/Code/notnvalt\ docs.sublime-project

Xcode

-------------------------------------------------------------[Bunch]-
& workflows/Timing
- task = Bunch
- project = Development
!& workflows/Timing

%Xcode
- /Users/ttscoff/Desktop/Code/Bunch/Bunch.xcodeproj
@Xcode

Forklift
- {~^$b}

Tower
- ~/Desktop/Code/Bunch

$ /usr/local/bin/subl -p ~/sites/dev/bunch/BunchDocs.sublime-project
$ /usr/local/bin/subl -p ~/Dropbox/Sync/Bunches/Bunches.sublime-project

Xcode

--------------------------------------------------------------[Moom]-

* tell application "Moom" to arrange windows according to snapshot "Code"

----------------------------------------------------[Coding Spotify]-
Spotify
& workflows/Play Spotify URL
- URL=spotify:playlist:3cSpIL4Q0H3uqdBMbT6c9x
- Autoplay=${autoplay:true}
```

