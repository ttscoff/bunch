---
layout: default
title: Populating Variables
nav_order: 50
parent: Interactivity
grand_parent: Bunch Files
tags: [variables,interactivity,interactive,dialog]
---
# Populating Variables Interactively {#variables}
{:.no_toc}

* Table of Contents
{:toc}

You can always write your own scripts with dialogs to return frontmatter keys and values [using the `from script` key]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dynamicfrontmatter), but you can also assign them within a Bunch using any of the dialog options above.

To populate a frontmatter key for use as a variable, just start the line with the variable name, followed by `=`, and then the syntax for the type of query you want (text, multiple choice, etc.). Variable assignment does not work with Checkbox Arrays.

___Note that the dialogs will only display if the frontmatter key is not already assigned.___ This allows you to have a Bunch offer interactivity when launched directly, but when called from another Bunch, an AppleScript, or the URL handler, you can assign the variable directly and skip the dialog.

## Text Input {#textinput}

To display a text field and request user input, use this in your Bunch:

```bunch
myvar = ?"Question to ask"
```

When the field pops up, type your response and hit OK. Then the `myvar` variable will be populated for any snippets that include it with `${myvar}`.

As an example, you could use this to enter a search term when opening a Bunch:

```bunch
spotifyurl = ?"Spotify Search"
Spotify
- spotify:​search:%{spotifyurl}
```

That will take your input and url encode it into a Spotify URL that is directly opened by Spotify.

## Menu Selection Input

You can use the same syntax from [Query Arrays]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/#array) or [Query Dictionaries]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/#dictionary) (or [external files]({{ site.baseurl }}/docs/bunch-files/interactivity/external-files/)) to offer multiple choice dialogs.

```bunch
podcast = ?[Overtired, Systematic] "Which Podcast are you recording?"
```

Now you'll get a dialog asking you to pick a podcast, and then you can use the `podcast` variable in a snippet. I use something like this when building a new show notes file in nvUltra, creating a note called, for example "Overtired 250.md".

```bunch
podcast = ?[Overtired, Systematic] "Which podcast?"
episode = ?"Episode Number"
<<
___
// Open nvUltra, close all windows, open Podcasting notebook using URL handler
// If the script has populated an episode note title, include it in the URL
%nvUltra Beta
- XX
- x-nvultra:​//open?path=/Users/ttscoff/Dropbox/Notes/Podcasting/&note=%{podcast:Podcast}%20${episode}.md
```

My choice from the podcast query gets populated just like it is in the array (either "Overtired" or "Systematic"). If I wanted to provide different text for the options than the final values it returns, I would use a [Dictionary]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/#dictionary).

As mentioned above, if I wanted to call this Bunch from the URL handler with a specific podcast pre-defined, I could just define the `podcast` and `episode` variables when calling it, and the select and input dialogs would not display:

    open x-bunch://open/?bunch=Podcast&podcast=Overtired&episode=203

> You can use variable assignment to abstract some of the above examples. Instead of having a dialog immediately call a snippet, you can assign a fragment name to a variable and then use that when calling the snippet. The following sets `which_snippet` to the result of the dialog, then calls a snippet, passing the result as the fragment to search for:
>
> ```bunch
> which_snippet = ?[Snippet One, Snippet Two] "Which Snippet?"
>
> <MyBunch.snippets#${which_snippet:Default Snippet}
> ```
>
> Include a default value to run in case the dialog is cancelled.
{:.tip}
