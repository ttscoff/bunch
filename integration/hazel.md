---
layout: default
title: Hazel
parent: Integration
tags: [integration]
---
# Bunch and Hazel

[Hazel](https://www.noodlesoft.com/) is an amazing tool that watches for file changes on your Mac and acts on them. That's simplifying it, but it's the gist.

You can integrate Bunch with Hazel using shell scripts and the Bunch URL handler. By integrating variables into a Bunch, you can have Hazel pass the path to a specific file when opening the Bunch.

Let's say you're watching a Dropbox folder for new audio files. When a new file arrives, you want to open it in your audio editor, along with your Audio Editing Bunch that sets up everything else you need. The Bunch would include a line pointing your audio editor to a variable:

```bunch
Fission
- ${audiofile}
```

The rule in Hazel would use a `Run shell script` action on files matching whatever criteria you need. In the shell script, you would set it to `/bin/bash` and include the following:

{% img aligncenter /bunch/images/hazelrule.jpg 795 467 %}

```
FILE=$(echo "$1" | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg')

open "x-bunch://open/?bunch=Audio%20Editing&audiofile=$FILE"
```

The first line is just to URL encode the file path to make it work in a URL. Then it calls Bunch's URL handler with the `open` method (which will work even if the Bunch is already open). The Audio Editing Bunch will load, and when it launches Fission, it will open the new file immediately.
