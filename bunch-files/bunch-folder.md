---
layout: default
title: The Bunch Folder
parent: Bunch Files
nav_order: 1
---
# Bunch Folder Setup

By default, Bunch reads plain text files from a folder at `~/bunches` (that's a folder called "bunches" in the base of your Home folder). You can change the location of that folder using "Preferences->Change Bunches Folder" from the Dock icon or menu bar item (possibly to a Dropbox or iCloud folder where you can sync with other machines).

> Tip (kinda): when you change the Bunches folder location, it doesn't move or delete any of the Bunches at the previous location. That means that (in a fairly inelegant way) you can use different folders for different sets of Bunches. You can also quickly switch sets using the [setPrefs URL handler]({{ site.baseurl }}/docs/integration/url-handler/#urlhandlersetpref).
{:.tip}

Each Bunch file has the extension `.bunch`, so a basic config file would look like `~/bunches/Example.bunch`.

Each Bunch is a separate file, and the name of the Bunch will be taken from the filename (without the `.bunch` extension). Once you've added your own configuration(s), delete the `Example.bunch` file (or rename it with an extension other than `.bunch`).
