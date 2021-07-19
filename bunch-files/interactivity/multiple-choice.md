---
layout: default
title: Multiple Choice
nav_order: 20
parent: Interactivity
grand_parent: Bunch Files
tags: [interactivity,interactive,dialog,menu]
---
# Multiple Choice Dialogs
{:.no_toc}

* Table of Contents
{:toc}

You can easily define multiple-choice dialogs using simple syntax in your Bunch. You can use these to choose snippets to load, scripts to run, or variables to include.

> These syntaxes will be familiar to coders, but should make sense to anyone once you get the hang of it.
{:.tip}

Both of the syntaxes below start with a question mark as the first character on the line. This syntax won't work as an indented [Waiting Snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet), but they work in other snippets, so you can call them from a Waiting Snippet. They also work as on-close snippets; just precede the question mark with an exclamation point.

Choosing an item and clicking OK with either syntax will execute that item as if it were included directly in the Bunch. Clicking Cancel will remove the line from the Bunch.

Items executed will be treated as part of the Bunch, meaning they will be quit on close and will prevent other Bunches from quitting them while the Bunch is open.

## Query Arrays {#array}

The simplest syntax for multiple choice is an "array," which is just a list of items. Whatever the name of the choice is, that's what will be run, so it's mostly useful for selecting apps by name.

An array is defined by `?[...]`. Items in an array are separated by either a comma or a newline, whitespace (indentation, blank lines) is ignored. 

You can optionally include a title for the dialog after the closing bracket in double quotes on the same line as the right bracket.

```bunch
?[Omnifocus, Things, TaskPaper] "Which Task Manager?"

# or...

?[
    Omnifocus
    Things
    TaskPaper
] "Which Task Manager?"
```

By combining this with [variable assignment]({{ site.baseurl }}/docs/bunch-files/interactivity/multiple-choice/populating-variables/), you can have the list directly choose a snippet fragment to run. The following example assigns a `snippet` variable, then uses that to call a fragment of an [embedded snippet]({{ site.baseurl }}/docs/bunch-files/snippets/#embeddedsnippets).

```bunch
snippet = ?[
    First
    Second
    Third
]

<<#${snippet}
___
#[First]
// do something

#[Second]
// do something else

#[Third]
// you get the idea
```

## Query Dictionaries {#dictionary}

If you want to display a menu with more complex commands with nicer wording, use the "dictionary" syntax. This is a list of keys (menu titles) and values (commands that item runs) surrounded by curly brackets (`{}`). The menu is built from the keys, and whichever item is selected, the value for that item will be inserted into the Bunch and run as if it were included to begin with.

The values can only be a single line, but they can be snippet import statements, so you can use them to branch the launch of entire subsets of items.

Dictionaries are defined by `?{key => value}`. The separator between key and value is equal sign (`=`) greater than (`>`), known in programming as a "fat arrow." Entries are separated by comma or newline (or both), whitespace (indentation and blank lines) is ignored.

Here's a query included in a "Coding" Bunch that asks me which project I'm tackling, then loads snippets for each answer.

```bunch
?{
    Marked => <coding.snippets#Marked
    Bunch => <coding.snippets#Bunch
    nvUltra => <coding.snippets#nvUltra
} "Whatcha Coding?"
```

{% hovergif /images/querydictionary.gif "Animation showing result of Query Dictionary" "Query Dictionary" %}

## Checkbox Arrays {#checkbox}

If you'd like multiple choice dialogs using checkboxes, you can use the Checkbox Array syntax. This consists of GitHub-style checkboxes followed by a title and the snippet or app to load.

Start the lines with `-[ ]`. If the brackets contain "x" (`-[x]`), the checkbox will be initially checked. Title and value are separated by `=>`. 

```bunch
-[x] Option 1 => <<#One
-[x] Option 2 => <<#Two
-[] Option 3 => <<#Three
___
#[One]
(log Snippet One)
#[Two]
(log Snippet Two)
#[Three]
(log Snippet Three)
```

{% img aligncenter /images/checkboxes.png 644 323 %}

If the (`=>`) is omitted, the contents of the line will be used for both the item title and the returned value. This can be used to easily offer a list of optional apps to load:

{% img aligncenter /images/appscheckboxes.png 521 311 %}

Add one checkbox item per line. All consecutive lines will be grouped into one dialog, empty lines between items are ignored. If you want to create separate dialogs from multiple groupings of options, separate the groups with a horizontal rule (`---`) or a line starting with at least two hashes (`## A divider line`).

Checkbox Arrays do not work in on-close Snippets --- they can only be used when opening a Bunch.
