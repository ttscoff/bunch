---
layout: default
title: Variables
parent: Bunch Files
tags: [frontmatter,snippets,variables]
---
# Using Variables
{:.no_toc}

Bunch allows the use of variables within Bunches and Snippets, adding flexibility and dynamic capabilities to your Bunches.

* Table of Contents
{:toc}

## Defining Variables

In order to use a variable within a Bunch, you need to give it a value. Variables get their values in a variety of ways: from frontmatter, from interactive dialogs, or from arguments passed when opening a Snippet or Bunch from within a Bunch or via automation tools.

### In Frontmatter

A variable is a key and a value. You can define the variable in frontmatter by using a `key: value` line. As long as the key doesn't conflict with one of [Bunch's built-in keys]({{ site.baseurl }}/docs/bunch-files/frontmatter/#keys), you can use anything you want. Keys should be letters, numbers, and underscores only. They can contain spaces, but those will be compressed and stripped when they're used as a replacement, and the entire key will be lowercased, so "My Key" becomes "mykey".

```bunch
---
title: My Bunch
my variable: my value
---
```

The variable `my variable` is now available as `myvariable` for use in the Bunch and any snippets it calls. See [using variables](#usingvariables) to see how.

#### Dynamic Frontmatter

Using the [dynamic frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#dynamicfrontmatter) options `from file` or `from script`, you can set variable values dynamically when opening the Bunch.

Variables set by reading a file or running a script will supercede any values hardcoded in the frontmatter.

### With a Script {#script}

You can set a frontmatter key's value using a script (shell script or AppleScript). To do so, use the format:

```bunch
# With a direct AppleScript command
keyname = * tell app... // AppleScript
# With an AppleScript script file
keyname = * myscript.applescript

# With a shell command
keyname = $ echo "my value"
# With a shell script
keyname = $ myscript.sh
```

A script line like this is executed in the order of the Bunch. It should appear before any usage of the variable, but can be added after other script items and will allow their execution before running.

See the [CodeKit example Bunch]({{ site.baseurl }}/docs/bunch-files/samplebunch/#scriptvariable) for a demonstration of this in action.


### With a Dialog

You can use interactive dialogs to define values for variables. See [Interactivity->Variables]({{ site.baseurl }}/docs/bunch-files/interactivity/#variables) to learn how. A dialog that sets a variable will only be triggered if the variable is not already assigned a value via another method.

For an example of a Bunch with a multiple choice dialog, see the [Coding example Bunch]({{ site.baseurl }}/docs/bunch-files/samplebunch/#multiplechoice).

### In a Snippet

You can also directly assign a variable from within a Snippet, including embedded snippets. This abstracts the process, but allows you to use a dialog to load Snippets and have the variable set by the snippet instead of by setting with the dialog itself. A variable set within a snippet is available after the snippet is imported, but will not override a variable already set by other methods (see [Variable Precedence](#precedence)).

To assign a variable directly from a Snippet:

```
choice = ?[One, Two]

<<${choice}

TextEdit
- ${text_file}
___
#[One]
text_file = "~/Documents/File 1.txt"

#[Two]
text_file = "~/Documents/File 2.txt"
```

> Direct assignment also works in a Bunch itself, having the same effect as setting a frontmatter key. For the sake of clarity, it's better that you use frontmatter in this case.

### When Calling a Snippet or Bunch {#filelines}

When you call a Bunch or Snippet from within a Bunch, you can use file lines with `key=value` pairs to set frontmatter and variable values for them. 

For a Bunch, you would use:

```bunch
MyBunch.bunch
- myvariable=my value
```

This value would override any matching key in `MyBunch.bunch`'s frontmatter. The value would then be available to MyBunch, any snippets it calls, and any Bunches it opens.

For a Snippet, you would use:

```bunch
<MySnippet.snippet
- myvariable=my value
```

This variable would be set only for the snippet, but would not affect the frontmatter keys for the calling Bunch or any Bunches the snippet calls.

Values set using file lines will supercede any frontmatter or dialog values.

### With the URL Handler or AppleScript

You can also define variables in query strings when using the [URL handler]({{ site.baseurl }}/docs/integration/url-handler/#variables). Arbitrary `key=value` pairs can be added when using the methods for opening, closing, and toggling Bunches, and when running Snippets directly.

When using Bunch's [AppleScript]({{ site.baseurl }}/docs/integration/applescript/), you can add `with variables` and include a query string of keys and values, e.g. `with variables "variable1=My Value&variable2=Other Value"`.

Values set in this manner will supercede frontmatter values, but will be overridden by [file lines](#filelines).

> With this capability, you can create Bunches that focus efforts around a particular file (or files), but change that file with each opening of the Bunch. Set up a `${placeholder} in the Bunch for the filename, then specify the file in the url when calling the Bunch.
> 
> Scenario: you have Hazel watching for new audio files that need processing in a shared Dropbox folder. A new file shows up, and a Hazel script adds an entry to your task manager that includes a Bunch url with the file specified as a parameter. Clicking it not only switches to your audio editing context, but also loads the file in question in your audio editor.
{:.tip}

## Variable Precedence {#precedence}

Because variables can be set in multiple ways, you need to be aware of which value takes precedence. Variables are set in this order, the top available value being used.

> Precedence also takes into account assignment order. If a variable is already assigned (e.g. by a URL handler query string), a dialog that sets that variable (`var = ?[]`) will be skipped, as will a direct assignment (`var = val`). This allows you to, for example, skip a dialog if opening via a URL by setting the variable in the URL itself.
{:.tip}

1. Variables set in __file lines__
2. Variables set by in a __URL call__/__AppleScript method__
3. Variables set by __interactive dialogs__
4. Variables set in __dynamic frontmatter__
5. Variables set in __frontmatter__
6. Variables set using __direct assignment__
7. Variable __default values__



## Using Variables {#usingvariables}

Once a variable has a value, you can use it in your Bunch or Snippet by adding a placeholder in the format `${variablename}`. Remember that spaces are removed and the name will be lowercase, regardless of casing and spacing in the key you defined.

In a Bunch or Snippet that might look like:

```bunch
Xcode
- ~/Code/Projects/${project}/${project}.xcworkspace
```

You can use a placeholder anywhere, including in an app or command line.

```bunch
${apptolaunch}

(display ${logtoshow} 800x800)
```

Placeholders can not be nested within other placeholders.

### Percent Encoding

You may need your variable to be percent encoded when it's used, for example when using it in a URL. In this case, use a percent symbol (`%`) instead of a dollar sign (`$`).

```bunch
Safari
- https://imdb.com/search?q=%{searchterm}
```

### Default Values

You can (and generally should) define a default value for a placeholder. This will be used if the key is empty by the time the placeholder is reached. Add default values after a colon within the placeholder:

```bunch
${myvariable:Default Value}
```

This is especially useful within a main Bunch, allowing the Bunch to function normally when called directly, but changing its functionality when it's called from other Bunches or via the URL handler.

