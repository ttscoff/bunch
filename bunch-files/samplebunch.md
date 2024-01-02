---
layout: default
title: Sample Bunches
parent: Bunch Files
nav_order: 3
top_menu: true
tags: [interactivity,frontmatter,snippets,variables,example,apps,basics]
---
# Some examples to get you started
{:.no_toc}

* Table of Contents
{:toc}

These are mostly Bunches that I (Brett, the developer) use. Several of them incorporate [Embedded Snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets) in these examples so I don't have to also include my snippet files just to let you see what's going on. Anything in an Embedded Snippet can be moved to an external file as desired.

These examples make use of [comments]({{ site.baseurl }}/docs/bunch-files/comments/) to explain what's happening.

## Example.bunch

This example demonstrates the basic syntax for a Bunch file.

```bunch
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
-> ~/Pictures // Opens Pictures in a tab of the Documents window

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

# See the documentation for more info: https://bunchapp.co/docs
```

## Screencasting {#screencast}

Get set up to start recording a screencast.

```bunch
---
title: 🎥Screencast
shortcut: S
---
// General Settings
(hide desktop) // hide desktop icons
(hide dock)    // hide the Dock
(dnd on)       // turn on Do Not Disturb

// Launch Screenflow
// Assume we'll need it open for editing after we're done
// recording, so ignore it when closing (%).
%ScreenFlow

// Ask about specific project, handle setup
?{
  Marked => <<#Marked
  Bunch => <<#Bunch
} "Whatcha workin' on?"

// Focus Screenflow, hiding other apps
@ScreenFlow
___
// Load specific settings for different projects

#[Marked]
(wallpaper ~/Pictures/Desktops/markeddesktop.jpg)
Marked 2

#[Bunch]
(wallpaper ~/Pictures/Desktops/bunchdesktop.jpg)
```

## Podcasting {#podcast}

Here's my `Podcast Record.bunch`.

```bunch
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
firefox:​https://podman.backbeatmedia.com/shows

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

```bunch
---
title: 📞Comms
startup: true
---
/*
Fragment identifiers allow me to load this Bunch as a snippet and execute
just parts of it as needed. They are ignored when loading as a Bunch.
*/
#[Social]
Tweetbot
## (Facebook runs in a Unite Single Site Browser)
Facebook

/*
Lines beginning with a pipe (|) are executed in parallel, even when the default or Bunch-specific execution sequence is "sequential"
*/
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

## Coding (Multiple Choice) {#multiplechoice}

Here's the Bunch I use when I'm ready to code. It offers a choice of my main projects using [Query Dictionary syntax]({{ site.baseurl }}/docs/bunch-files/interactivity/#dictionary). It launches all of the common apps between the projects and tells Bunch not to quit them when the Bunch closes with a `%`. It uses [Embedded Snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets) to load the appropriate projects, and [Moom]({{ site.baseurl }}/docs/integration/moom/) in a [Waiting Snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet) to position the windows according to a snapshot after everything loads.

I have folder sets set up in [Forklift]({{ site.baseurl }}/docs/integration/forklift/), with keystrokes assigned that this Bunch sends.

```bunch
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
- URL=spotify:​playlist:3cSpIL4Q0H3uqdBMbT6c9x
- Autoplay=${autoplay:true}
```

## Simple Web Development {#simpleweb}

These docs run on [Jekyll](https://jekyllrb.com/). When working on them, I run `jekyll serve` to create a local server that updates automatically as the Markdown files change. I edit the docs in [nvUltra](https://nvultra.com/) and Sublime Text.

This Bunch opens the server in a [task monitor]({{ site.baseurl }}/docs/bunch-files/scripts/shell-scripts/#monitor) (using colors from the beautiful [Nord](https://www.nordtheme.com/) palette), loads up my editors, and [opens a web view]({{ site.baseurl }}/docs/bunch-files/commands/display/#html-files-and-websites) of the rendered documents which updates as changes happen (using Jekyll's LiveReload). The web view opens after a long delay, giving Jekyll enough time to render and launch the server first.

```bunch
---
title: ✍🏻Documentation
shortcut: d
---
%Sublime Text
@Sublime Text // Focus Sublime

nvUltra Beta
- ~/Sites/dev/bunch/docs/

// Launch the Jekyll server with a task monitor (see script below)
$ ~/Sites/dev/bunch/servejekyll.sh (display d:1 50%x100% right,top #2e3440 #86c0d1 a:95%)

// Display a web view window of the documentation site
// after 20-second delay
// 1200pt wide, full height, primary display, normal window level
(display http://127.0.0.1:4000/ 1200x100% right,center) ~20
```

Here's the `servejekyll.sh` script that the Bunch runs. Note that it loads up my ruby environment using RVM so that `bundle` works properly.

```bash
#!/bin/bash
source "$HOME/.rvm/scripts/rvm" &>/dev/null
cd ~/Sites/dev/bunch
rvm use ruby-2.6.5
bundle exec jekyll serve --trace -l
```

## CodeKit (Script Variable) {#scriptvariable}

The following Bunch combines a multiple choice dialog with a frontmatter key (`previewurl`) that gets set by running an AppleScript. The multiple choice dialog runs first, which calls snippets that set the current project in CodeKit, then uses an AppleScript call to get the browser preview url. The URL is retrieved prior to running the display command, so it can be inserted into the command as the target URL.

```bunch
---
title: CodeKit
---
?{
  nvUltra Website  => <<#nvultraweb
  nvUltra Onboard  => <<#nvultrasplash
  Marked 2 Website => <<#marked
}

previewurl =* tell application "CodeKit" to get preview server url

(display ${previewurl} d:1 800x100% left,top)
___
#[nvultraweb]
* tell application "CodeKit" to select project containing path "~/Sites/dev/nvultra/"

#[nvultrasplash]
* tell application "CodeKit" to select project containing path "~/Desktop/Code/notnvalt/onboard/"

#[marked]
* tell application "CodeKit" to select project containing path "~/Sites/dev/marked2app/"
```

## Dynamic Images

When I was transitioning to a new M1 Mac mini I was using several different machines, switching my display between them and sometimes using VNC to log into them. Because my goal was to make one system behave look and behave like the other, it could get confusing as to which one I was logged into at the time.

I built the following Bunch which takes the host name of the current machine and uses ImageMagick to create a green-on-transparent PNG of the machine's name, then uses the `display` command to put it in the lower left corner of the desktop in a wallpaper-level chromeless window with transparent (`#clear`) background. The Bunch syncs between machines via Dropbox, opens at startup, and shows the name of whatever machine it opens on.

(Requires [ImageMagick](https://imagemagick.org/index.php), `brew install imagemagick`)

```bunch
---
title: Identity
startup: true
menu order: 120
single bunch mode: ignore
toggles: false
---

$ hostname | sed 's/.local$//'|tr "[a-z]" "[A-Z]" | xargs -I '{}' convert -size 500x500 xc:transparent -fill '#a2bf8a' -font AvantGarde-Demi -pointsize 64 -draw "text 0,150 '{}'" -trim ~/thismachine.png

(display ~/thismachine.png d:0 150x63 0,0 #clear a:50% c:n l:w)
```

