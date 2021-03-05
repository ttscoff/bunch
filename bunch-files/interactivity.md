---
layout: default
title: Interactivity
parent: Bunch Files
---
# Interactive Bunches
{:.no_toc}

There are a couple of ways you can add interactivity to a Bunch.

* Table of Contents
{:toc}



## Optional Snippets With Dialog {#optionalsnippets}

You can have Bunch ask whether a snippet should be loaded when opening a Bunch by adding a query at the end of it. The format for the query is a question mark (?) immediately followed by a double-quoted string. The string within the quotes will be used as the text of the dialog, with buttons "Yes" and "No".

    < MySnippet.snippet ?"Load My Snippet?"

When the Bunch is launched, a dialog will ask "Load My Snippet?" and request user interaction. Clicking "Yes" will load the referenced snippet, clicking "No" will skip loading it. This can be used with variables and fragments, as well:

    <General.snippets#Spotify ?"Play some music while you work?"
    - url=spotify:playlist:3cSpIL4Q0H3uqdBMbT6c9x
    - autoplay=true

{% gif images/optionalsnippet.gif "Optional Snippets" %}

You can include multiple optional snippets, but --- due to the asynchronous way Bunches are launched --- the questions may not be asked in file order. Make the queries descriptive to avoid confusion.

You can also ask about snippets when the Bunch is closing:

    !<General.snippets#Goodbye ?"Turn off the lights on your way out?"

## Multiple Choice Dialogs {#multiplechoice}

You can easily define multiple-choice dialogs using simple syntax in your Bunch. You can use these to choose snippets to load, scripts to run, or variables to include.

> These syntaxes will be familiar to coders, but should make sense to anyone once you get the hang of it.
{:.tip}

Both of the syntaxes below start with a question mark as the first character on the line. This syntax won't work as an indented [Waiting Snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet), but they work in other snippets, so you can call them from a Waiting Snippet. They also work as on-close snippets; just precede the question mark with an exclamation point.

Choosing an item and clicking OK with either syntax will execute that item as if it were included directly in the Bunch. Clicking Cancel will remove the line from the Bunch.

Items executed will be treated as part of the Bunch, meaning they will be quit on close and will prevent other Bunches from quitting them while the Bunch is open.

### Query Arrays {#array}

The simpler syntax is an "array," which is just a list of items. Whatever the name of the choice is, that's what will be run, so it's mostly useful for selecting apps by name.

An array is defined by `?[...]`. Items in an array are separated by either a comma or a newline, whitespace (indentation, blank lines) is ignored. 

You can optionally include a title for the dialog after the closing bracket in double quotes on the same line as the right bracket.

    ?[Omnifocus, Things, TaskPaper] "Which Task Manager?"

    # or...

    ?[
        Omnifocus
        Things
        TaskPaper
    ] "Which Task Manager?"

{% gif images/MultiChoiceArray.gif "Multiple-choice array" %}

### Query Dictionaries {#dictionary}

If you want to display a menu with more complex commands with nicer wording, use the "dictionary" syntax. This is a list of keys (menu titles) and values (commands that item runs) surrounded by curly brackets (`{}`). The menu is built from the keys, and whichever item is selected, the value for that item will be inserted into the Bunch and run as if it were included to begin with.

The values can only be a single line, but they can be snippet import statements, so you can use them to branch the launch of entire subsets of items.

Dictionaries are defined by `?{key => value}`. The separator between key and value is equal sign (`=`) greater than (`>`), known in programming as a "fat arrow." Entries are separated by comma or newline (or both), whitespace (indentation and blank lines) is ignored.

Here's a query included in a "Coding" Bunch that asks me which project I'm tackling, then loads snippets for each answer.

    ?{
        Marked => <coding.snippets#Marked
        Bunch => <coding.snippets#Bunch
        nvUltra => <coding.snippets#nvUltra
    } "Whatcha Coding?"

### Assigning Variables With Input {#variables}

You can always write your own scripts with dialogs to return frontmatter keys and values [using the `from script` key]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dynamicfrontmatter). But you can also assign them within a Bunch to get input at the time you open the Bunch and populate variables in snippets with it.

To populate a frontmatter key for use as snippet variables, just start the line with the variable name, followed by `=`, and then the syntax for the type of query you want.

#### Text Input

To display a text field and request user input, use this in your Bunch:

    myvar = ?"Question to ask"

When the field pops up, type your response and hit OK. Then the `myvar` variable will be populated for any snippets that include it with `${myvar}`.

#### Multiple Choice Input

You can use the same syntax from [Query Arrays](#array) or [Query Dictionaries](#dictionary) to offer multiple choice dialogs.

    podcast = ?[Overtired, Systematic] "Which Podcast are you recording?"

Now you'll get a dialog asking you to pick a podcast, and then you can use the `podcast` variable in a snippet. I use something like this when building a new show notes file in nvUltra, creating a note called, for example "Overtired 250.md".

```
podcast = ?[Overtired, Systematic] "Which podcast?"
episode = ?"Episode Number"
<<
___
// Open nvUltra, close all windows, open Podcasting notebook using URL handler
// If the script has populated an episode note title, include it in the URL
%nvUltra Beta
- XX
- x-nvultra://open?path=/Users/ttscoff/Dropbox/Notes/Podcasting/&note=%{podcast:Podcast}%20${episode}.md
```

My choice from the podcast query gets populated just like it is in the array (either "Overtired" or "Systematic"). If I wanted to provide different text for the options than the final values it returns, I would use a [Dictionary](#dictionary).
