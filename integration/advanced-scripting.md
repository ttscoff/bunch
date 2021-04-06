---
layout: default
title: Advanced Scripting
parent: Integration
tags: [scripting,scripts]
---
# Advanced Scripting Topics
{:.no_toc}

* Table of Contents
{:toc}

## Debugging Scripts Run By Bunch

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

## Getting the Bunch Folder in a Script {#bunchfolder}

You can access various preferences from the command line using `defaults`. The following will return the current location of your Bunch files:

    defaults read com.brettterpstra.bunch configDir

Getting a list of available bunches is as easy as doing an `ls *.bunch` on that folder.

You can also check the "Toggle Bunches" and "Single Bunch Mode" settings:

```bash
defaults read com.brettterpstra.bunch toggleBunches
defaults read com.brettterpstra.bunch singleBunchMode
```

You can also use the [Bunch CLI]({{ site.baseurl }}/docs/integration/cli/) to query specific keys.

```bash
$ bunch --show-config-key dir
/Users/username/bunches

$ bunch --show-config-key toggle
true
```

## Selecting A Spotify Playlist

Here's an example using `from script` frontmatter to let you pick from your favorite Spotify playlists or perform a Spotify search.

The script is in JavaScript (for Automation) and saved in a `scripts` folder inside my Bunch folder. I can reference it with the relative path `scripts/ChoosePlaylist.applescript`. 

The script would take some modification with your own playlists and titles, but would be easy to change:

```js
#!/usr/bin/osascript -l JavaScript

var app = Application.currentApplication()
app.includeStandardAdditions = true
     
var playlists = {
	"Mellow": "spotify:playlist:37i9dQZF1E35F7NsH3aWbs",
	"Pop": "spotify:playlist:37i9dQZF1E39mpAvbgovri",
	"Punk": "spotify:playlist:37i9dQZF1E3930Ag6USpnA",
	"Indie": "spotify:playlist:37i9dQZF1E39UzhnpcOJqd",
	"Metal": "spotify:playlist:37i9dQZF1E35o96rAfTenf",
	"Rock": "spotify:playlist:37i9dQZF1E38gxK1HWfQU0",
	"Search": ""
}


var list = app.chooseFromList(Object.keys(playlists), {
	withPrompt: "What to play?",
    defaultItems: ["Search"]})[0];

if (list === undefined) {
	'spotify url: spotify:'
} else if (playlists[list] === "") {
  var search = app.displayDialog("What to search for?", {
    defaultAnswer: "",
    buttons: ["Cancel", "Search"],
    defaultButton: "Search"
  });
  `spotify url: spotify:search:${encodeURIComponent(search.textReturned)}`
} else {
  `spotify url: ${playlists[list]}`
}
```

The above script offers a list with the keys from the `playlists` object. If you cancel, it outputs Spotify's base url handler, 'spotify:'. If you select "Search," it pops up a second dialog asking for a search string, then formats that into a URL encoded Spotify URL for searching. If you pick a playlist, it returns the value for that key, which is already a full Spotify URI.

Now create a Bunch that just contains:

```bash
---
title: 🎵Listen
from script: scripts/ChoosePlaylist.applescript
---
Silicio
<<#Search Spotify
___
---[Search Spotify]---
Spotify
- ${spotifyurl}
```

When the Bunch is opened, it runs the above script and stores the `spotifyurl` variable. The embedded snippet launches Spotify and passes the URL to it. Having Silicio and Spotify in the Bunch means that when I close it, both apps quit, making music listening easy to manage. You could also add automation for setting audio devices and volumes, running Moom to position windows, etc.

```
---
title: 🎵Listen
from script: scripts/ChoosePlaylist.applescript
---
(audio output Komplete Audio)
Silicio
<<#Search Spotify
___
-[Search Spotify]
Spotify
- ${spotifyurl}
# Alternatively to the file parameter, 
# you could use this to start playing immediately:
# * tell app "Spotify" to play track "${spotifyurl}"
```

{% gif images/Listen.gif %}

## Adding a User Input Dialog {#password}

You can use the `from script` [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter#dynamicfrontmatter) to implement a password dialog that can be passed on to your scripts. This could, for example, allow you to automate unlocking a keychain and getting a secure password for a scripted curl call. It also serves as an example of just getting interactive input for a script and could be applied to select dialogs, file select dialogs, and more.

1. Create a script that uses AppleScript to show a dialog. This can be done in an actual AppleScript, or in a shell script that calls `osascript`. Here's a ruby example:
	
	```ruby
	#!/usr/bin/env ruby
	require 'yaml'
	
	password = %x{osascript <<'APPLESCRIPT'
	  return text returned of (display dialog "Enter password" default answer "" buttons {"Cancel", "OK"} default button 2 with hidden answer)
	APPLESCRIPT}.strip
	
	puts YAML.dump({'password' => password})
	```
	
	This displays a secure input dialog (secure in that the input is hidden) and returns the response formatted as YAML.
2. Save the script in your Bunch folder as `mypasswordscript.rb`. Make the script executable (`chmod a+x mypasswordscript.rb`) and you can call it from a Bunch's frontmatter:

	```	
	---
	from script: mypasswordscript.rb
	---
	```

	When the Bunch is opened, the result of the above script will be read in and appended to the Bunch's frontmatter.

3. Now you can use the `${password}` variable as either an argument or an environment variable in a snippet. Here's a Bunch with an embedded snippet and appropriate frontmatter:

	```
	---
	from script: mypasswordscript.rb
	---
	
	<<#Password Protected
	- user=ttscoff
	
	___

	---[Password Protected]
	$ mycoolscript.sh ${user}:${password}
	```

	This calls an embedded snippet containing two variables. The variables will be populated by the frontmatter we generated in the Ruby script.

    The snippet calls another shell script with a command line argument containing `user:password`.

    When this Bunch is opened, the Ruby script runs and the password dialog is shown. The result gets added to the frontmatter, which then populates the variables in the snippet.

This is, of course, a fairly silly example, as you could simply add the password request into a script and have it execute something using the password in one line, as opposed to the roundabout method of passing data to the frontmatter through one script and then calling a second script in a snippet. Hopefully it illustrates some possibilities, though.

## Forking Bunches With User Interaction {#forkingbunches}

Bunch offers several methods for creating [interactive Bunches]({{ site.baseurl }}/docs/interactivity/), but you can also use a little scripting if you need more flexibility.

You can use AppleScript to display a multiple choice dialog, then act accordingly. This can be used to launch multiple bunches with user interaction.

```applescript
set _res to choose from list {"Comms", "Podcast Record", "Podcast Edit", "Music"} with prompt "What next?" OK button name "Launch" with multiple selections allowed and empty selection allowed

repeat with _bunch in _res
    do shell script "open 'x-bunch-beta://open/" & _bunch & "'"
end repeat
```

Call a script like that within one Bunch, and it can lead to launching other Bunches based on user response.

This strategy can be used with simple yes/no dialogs as well, taking alternate paths based on the response. Any script that can accept user responses via a GUI can use the Bunch [URL handler]({{ site.baseurl }}/docs/integration/url-handler) to continue processing Bunches.

## Running Privileged Tasks (sudo) {#sudo}

You can make use of Bunch's scripting features and the macOS Keychain to enable secure use of `sudo` in your scripts.

The first step is to create a Keychain entry for the password you want to use. In this case, this will be your system password.

Open __Keychain Access__ in /Applications/Utilities. Unlock your `login` keychain if needed, then click the "Create new" button in the toolbar. Give the item a unique name, any account name you want, and then enter the password and click "Add."

{% img aligncenter /bunch/images/accessibility.png 917 787 %}

> Note that you can right click on the login toolchain in the left sidebar and use __Change Settings...__ to tell it how long to remain unlocked. If your machine is private and you want it to remain unlocked for as long as you're logged in, diable "Lock after..." and enable "Lock when sleeping."
{:.tip}

Now this password entry can be accessed using the command line tool `security`, which we can use in a script. If the keychain is unlocked, the password will be retrieved without interaction. If it's locked, you'll be asked to enter your keychain password before access is granted.

The first and simplest option is just to put all of the sudo commands you need in one script and call the `security` tool at the top. You can then echo the retrieved password to `sudo -S`, which tells `sudo` to read the password from the command line.

We'll call `security` and give it the name you assigned to the keychain item (`-l`), and the account name (`-a`). `-w` tells it to return only the password.

```bash
#!/bin/bash

PASS=$(security find-generic-password -l "bunch password" -a bunch -w|tr -d '\n')

echo "$PASS" | sudo -S [your privileged command]
```

> The first time `security` is used from a script, you'll get a prompt to allow access. Be sure to click "Always Allow" to avoid getting the same prompt every time.
{:.tip}

If you want to make the password available to multiple scripts with one call, or want to gather multiple passwords at once for different scripts, you can use frontmatter to store them.

### Passwords and Frontmatter

Create a script to retrieve the password and return it formatted as a frontmatter key we can use in our Bunch.

```bash
#!/bin/bash

PASS=$(security find-generic-password -l "bunch password" -a bunch -w|tr -d '\n')

echo "password: $PASS"
```

(Repeat the above as many times as needed to get multiple passwords, storing them as unique variables.)

Save that as "password.sh" in your Bunch folder and make it executable with `chmod a+x password.sh`. In the Bunch, we'll set the script to load the result as frontmatter using `from script`:

```bash
---
title: My sudo Bunch
from script: password.sh
---
```

Now, when the Bunch is opened, it will get the password(s) from the script, asking us to unlock the keychain if needed, then assign it to the variable `password`, which we can then use in a Script Item. We're redirecting STDERR output just to keep the password prompt from showing up in our script output.

The following Bunch disables automatic Time Machine backup when it opens, and re-enables it when it closes. We're also running `tmutil stopbackup` to gracefully terminate any currently-running backups, which doesn't require privileged access.

```bash
---
title: My Time Machine Bunch
from script: password.sh
---
# pass our password to sudo on STDIN
$ echo "${password}" | sudo -S tmutil disable 2>/dev/null
# stopbackup doesn't require root privileges
$ tmutil stopbackup

# Reverse on close with !$
!$ echo "${password}" | sudo -S tmutil enable 2>/dev/null
```

#### Better Password Masking

Following the above procedure does have the downside of showing your password in the command title when it's listed under Running Scripts (and in the Task Monitor). An alternative is to wrap the command in a second shell script. 

As mentioned at the top, if there's only one script being run, it's probably easiest to just include the `security` call in the script itself. But if you want to use frontmatter, all frontmatter keys/values are passed to the environment of every script the Bunch runs. You can access the `password` variable using `$password` (in Bash, Zsh, etc.) or whatever method the script's shell uses to access environment variables.

__timemachine.sh:__

```bash
#!/bin/bash

if [[ $1 == "disable" ]]; then
    echo "$password" | sudo -S tmutil disable 2>/dev/null
    tmutil stopbackup
else
    echo "$password" | sudo -S tmutil enable 2>/dev/null
fi

# Print the status Time Machine so it's available in the Task Monitor
tmutil status
```

Then in the Bunch:

```bash
$ timemachine.sh disable
!$ timemachine.sh enable
```

Now the "Running Scripts" title will just read `timemachine.sh ...` in the menu and the Task Monitor.
