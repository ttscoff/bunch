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

A variable is a key and a value. You can define the variable in frontmatter by using a `key: value` line. As long as the key doesn't conflict with one of [Bunch's built-in keys]({{ site.baseurl }}/docs/bunch-files/frontmatter/#keys), you can use anything you want. Keys should be letters and numbers only. They can contain spaces and underscores, but those will be compressed and stripped when they're used as a replacement, and the entire key will be lowercased, so "My Key" becomes "mykey".

```bash
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

```bash
# With a direct AppleScript command
keyname = * tell app...
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

You can use interactive dialogs to define values for variables. See [Interactivity->Variables]({{ site.baseurl }}/docs/bunch-files/interactivity/#variables) to learn how. Values assigned in this way will supercede values defined in Frontmatter or Dynamic Frontmatter.

For an example of a Bunch with a multiple choice dialog, see the [Coding example Bunch]({{ site.baseurl }}/docs/bunch-files/samplebunch/#multiplechoice).

### When Calling a Snippet or Bunch {#filelines}

When you call a Bunch or Snippet from within a Bunch, you can use file lines with `key=value` pairs to set frontmatter and variable values for them. 

For a Bunch, you would use:

```bash
MyBunch.bunch
- myvariable=my value
```

This value would override any matching key in `MyBunch.bunch`'s frontmatter. The value would then be available to MyBunch, any snippets it calls, and any Bunches it opens.

For a Snippet, you would use:

```bash
<MySnippet.snippet
- myvariable=my value
```

This variable would be set only for the snippet, but would not affect the frontmatter keys for the calling Bunch or any Bunches the snippet calls.

Values set using file lines will supercede any frontmatter or dialog values.

### With the URL Handler or AppleScript

You can also define variables in query strings when using the [URL handler]({{ site.baseurl }}/docs/integration/url-hander/#variables). Arbitrary `key=value` pairs can be added when using the methods for opening, closing, and toggling Bunches, and when running Snippets directly.

When using Bunch's [AppleScript]({{ site.baseurl }}/docs/integration/applescript/), you can add `with variables` and include a query string of keys and values, e.g. `with variables "variable1=My Value&variable2=Other Value"`.

Values set in this manner will supercede frontmatter values, but will be overridden by [file lines](#filelines).

> With this capability, you can create Bunches that focus efforts around a particular file (or files), but change that file with each opening of the Bunch. Set up a `${placeholder} in the Bunch for the filename, then specify the file in the url when calling the Bunch.
> 
> Scenario: you have Hazel watching for new audio files that need processing in a shared Dropbox folder. A new file shows up, and a Hazel script adds an entry to your task manager that includes a Bunch url with the file specified as a parameter. Clicking it not only switches to your audio editing context, but also loads the file in question in your audio editor.
{:.tip}

## Variable Precedence

Because variables can be set in multiple ways, you need to be aware of which value takes precedence. Variables are set in this order, the top available value being used.

1. Variables defined in file lines
2. Variables defined in the URL handler query string
3. Variables defined with interactive dialogs
4. Variables defined in dynamic frontmatter
5. Variables defined in frontmatter
6. Variable default values

## Using Variables {#usingvariables}

Once a variable has a value, you can use it in your Bunch or Snippet by adding a placeholder in the format `${variablename}`. Remember that spaces and underscores are removed and the name will be lowercase, regardless of casing and spacing in the key you defined.

In a Bunch or Snippet that might look like:

```bash
Xcode
- ~/Code/Projects/${project}/${project}.xcworkspace
```

You can use a placeholder anywhere, including in an app or command line.

```bash
${apptolaunch}

(display ${logtoshow} 800x800)
```

Placeholders can not be nested within other placeholders.

### Percent Encoding

You may need your variable to be percent encoded when it's used, for example when using it in a URL. In this case, use a percent symbol (`%`) instead of a dollar sign (`$`).

```bash
Safari
- https://imdb.com/search?q=%{searchterm}
```

### Default Values

You can (and generally should) define a default value for a placeholder. This will be used if the key is empty by the time the placeholder is reached. Add default values after a colon within the placeholder:

```bash
${myvariable:Default Value}
```

This is especially useful within a main Bunch, allowing the Bunch to function normally when called directly, but changing its functionality when its called from other Bunches or via the URL handler.

