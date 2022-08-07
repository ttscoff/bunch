---
layout: default
title: Snippets
parent: Bunch Files
tags: [snippets,variables]
---
# Avoid Repetition With Reusable Snippets
{:.no_toc}

* Table of Contents
{:toc}

If a series of tasks is repeated in multiple Bunches, you can separate them into their own "snippet" files and include the snippet in any Bunch. You can also [embed snippets](#embeddedsnippets) right in a Bunch.

## What Is a Snippet

A snippet file can be named with any extension other than `.bunch`, stored in your Bunch Folder. You can store snippets in a subfolder for organization, you'll just need to reference them with an appropriate path.

To include a snippet in a bunch, use `< snippet.name` on a line in the Bunch. If the snippet is in a subfolder, you would use `< folder_name/snippet.name`.

Snippet contents are treated like part of the Bunch that imports them, so when the Bunch closes, any apps or commands included by the snippet will be closed/reversed.

You can even call other Bunch files as snippets. If you use [fragment headers](#fragments) in your Bunch file, you can call just a portion of one Bunch from another, e.g. `< Comms.bunch#Social`. Fragment headers are ignored when processing a Bunch normally.

## Snippet Variables {#snippetvariables}

To make snippets flexible, Bunch allows [variables]({{ site.baseurl }}/docs/bunch-files/variables/) defined in the containing Bunch to be replaced within the snippet. Existing variable values are passed to the snippet, and you can specify additional/different values when calling the snippet. These are defined like files on the lines following the `<` line.

```bunch
< generic.snippet
- proj_path=~/Code/MyProject
```

Now you can use `${proj_path}` anywhere in your snippet file, allowing you to use the same snippet for different projects.

```bunch
TaskPaper
- ${proj_path}/todo.taskpaper
%iTerm
- ${proj_path}
```

You can also define values for snippet variables [using frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#arbitrarykeys).

Replace the dollar sign (`$`) with a percent symbol (`%`) in the placeholder and Bunch will URL encode the content. See the Variables documentation for more about [value transforms]({{ site.baseurl }}/docs/bunch-files/variables/#transforms).

### URL Encoding

If you use a percent (`%`) instead of a dollar sign (`$`) in your snippet placeholder, the value will be URL encoded when the variables are inserted. For example, if you have a variable called "foo" and the value passed to it is "This? This needs % encoding" then `%{foo}` will be replaced with `This%3F%20This%20needs%20%25%20encoding`, which is safe for use in URLs.

```bunch
---
search string: this is a search
---
___
Spotify
- spotify:​search:%{searchstring}

# sends "spotify:​search:this%20is%20a%20search"
```

For more details and other transformations, see [Variables: Transforming Values]({{ site.baseurl }}/docs/bunch-files/variables/#transforms).

### Default Variable Values {#defaultvalues}

If a snippet has variable placeholders but no values are provided when it's called, the placeholders will be removed. You can instead provide default values that will be used if no matching key/value pair is provided. To do this, just use a colon followed by the default within the placeholder:

```bunch
${proj_path:~/projects}
```

Only the first colon is used to split the value, so the default value can contain colons.

For more details, see [Variables - Default Values]({{ site.baseurl }}/docs/bunch-files/variables/#defaultvalues).

## Referencing Fragments {#fragments}

A snippet or bunch can contain multiple fragments, each beginning with a fragment header. Create a fragment header with a hash (`#`) or other accepted symbols (see below), and a fragment name in square brackets:

```bunch
#[First Fragment]
%nvUltra
&myWorkflow

#[Second Fragment]
MoreStuff
```

Reference the fragment with the snippet and fragment name, like this:

```bunch
<MySnippet.snippet#Second Fragment
```

If you load a snippet containing fragments without using a fragment name, i.e. just `<MySnippet.snippet`, it will run all of the fragments in the snippet.

If you feel like being creative, Bunch allows the use of several symbols to create the fragment headers, and you can have a variable number of them on either side of the brackets (you do need one symbol on the left).

Begin a fragment header using one of `#`, `-`, `=`, or `>`. The line must start with one or more of these symbols, followed by the fragment name enclosed in square brackets. In the case of a hyphen, two or more are required at the beginning of the line to avoid confusion with file lines. The other symbols only require a single character. Whitespace is allowed in the fragment header after the first (or second in the case of `--`) character. Fragment names can also include spaces.

Anything after the closing square bracket is ignored. You can use the rest of the line to continue a divider, add a comment, or just leave it blank.

The following all work as fragment headers:

```bunch
###[Fragment Name]
# [ Fragment ] #########
-------[My Fragment]-----------
-- [Fragment]
------------------------------------------[Frag]--
>>>[Some Fragment]
=[Fragment]== Add a comment, if you like
>-=# [My Fragment] #=-<
```

You get the idea. When you amass a lot of snippets in one file because you're making great use of fragments, it's just nice to make them look pretty...

## Adding Interactivity {#optionalsnippets}

See [Interactivity: Optional Snippets]({{ site.baseurl }}/docs/bunch-files/interactivity/optional-snippets/) for details on adding interactive choices to snippet loading.

## Run After Delay

Add a tilde and an integer at the end of the line to have the contents of the snippet run after a delay.

```bunch
<General.snippets#Spotify ~10
- url=spotify:​playlist:3cSpIL4Q0H3uqdBMbT6c9x
- autoplay=true
```

A delay can be combined with a query for an optional snippet. The delay should always be the last item on the line.

## Run When Closing

Like most script types in Bunch, you can precede a snippet line with an exclamation point (`!`) to run it when the Bunch closes instead of when it opens.

```bunch
!<General.snippets#Close Commands
```

These can also have a delay:

```bunch
# Run 5 seconds after closing the snippet
!<General.snippets#Close Commands ~5
```

## Wait Until Apps Have Launched {#waitingsnippet}

A "Waiting Snippet" is a snippet line indented by 4 spaces or 1 tab.

A Waiting Snippet will try to wait until all of the apps in the bunch have launched (or quit, if they're `!apps`). There's a timeout in case not all apps properly report their launch/termination to the OS.

```bunch
Skype
Audio Hijack
    <useful.snippets#Position Podcast
```

This is especially handy for running window management scripts ([a la Moom]({{ site.baseurl }}/docs/integration/moom/)) that need all of the apps to have windows present. It's more flexible than just putting a hard delay on the script, as it will take into account unusually long (or short) launch times. Just put the script line into a snippet or fragment and call it with an indented line.

Waiting Snippets rely on the apps to report that they've launched to the operating system. Just because an app has reported that it's launched doesn't necessarily mean it's _finished_ launching. Adding an additional delay is wise if some of the apps you're waiting on take a long time to display their windows.

You can have multiple Waiting Snippets in a Bunch, but they all wait for all apps and execute at once, not just waiting on the apps that come before them in the list.

> You can, however, use waiting snippets to chain multiple Bunches together in a sequence, having the next one launch after the first one finishes loading. Just include e.g. `Next Name.bunch` as a line in the Waiting Snippet.
{:.tip}

Waiting Snippets also work with [additional time delays]({{ site.baseurl }}/docs/bunch-files/delay/) as well as interactive optional snippets (see above).

Waiting Snippets get a 5-second timer attached. If all of the apps the Bunch is waiting for are already launched, it won't receive any notifications of their launch to trigger the snippet, so if it hasn't heard back it will check to see if all of the required apps are running (or have been terminated). If its requirements are satisfied, it will launch the Waiting Snippet.

## Embedded Snippet {#embeddedsnippets}

You can create separate snippet files to hold reusable items, but if you just need snippets to make use of features like Waiting Snippets, delayed blocks, or blocks to run on close, you can also embed a snippet right in the Bunch. Add a divider of three or more underscores (`___`) at the end of the document, and anything after it will be read as a snippet file.

Only a Bunch can contain an embedded snippet. The syntax won't have any effect on files loaded as snippets.

These work like any snippet file, and you can divide them into fragments to reference by name.

To reference an embedded snippet, just use an additional `<` instead of a filename:

```bunch
<<
```

That would run everything after the `___` as a snippet. You could also divide your embedded snippet into fragments and reference one of them with a fragment name:

```bunch
<<#My Fragment
```

Embedded snippets and fragments also work as Waiting Snippets, on-close snippets, and with delays, just like regular snippets. You can pass variables using file lines, and all frontmatter variables and variables assigned using dialogs in the Bunch are available to them.

__Embedded snippet example:__

```bunch
<<#First Fragment

!<<#On Close

<<#After Pause ~5

    <<#After Launch
___
---[First Fragment]
* say "first"

---[After Pause]
* say "I've been waiting"

---[On Close]
* say "Closing"

---[After Launch]
* say "Done launching"
```

