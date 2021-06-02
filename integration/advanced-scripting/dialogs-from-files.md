---
layout: default
title: Dialogs From Files
parent: Advanced Scripting
grand_parent: Integration
tags: [interactive,dialog,scripts]
---
# Dialogs From Files

You can build dialogs dynamically by reading the contents of an external file into a variable, then using the variable as the options for a dialog.

Let's assume you have a script that reads JSON data from an API and outputs a text file in a format Bunch can use for an interactive dialog. You would want to run the script before processing the Bunch in order to populate the text file before calling the dialog. Do this using `run before:` frontmatter.

```bunch
---
title: Dialogs from Files
run before: get_json.rb
---
```

That script would output a text file. Assuming we're building a dictionary-style dialog, we can output the options to a text file like this:

```
Option 1 => Value 1
Option 2 => Value 2
Option 3 => Value 3
```

Now, within the Bunch, we'll read that text file into a variable using `cat`:

```
options = $ cat ~/scripts/json_results.txt
```

Then we can use the `/raw` transform on the variable to substitute the raw contents of that variable into a query dialog:

```
choice = ?{${options/raw}}
```

When we open this Bunch, it will now run the script (not shown) to generate a Bunch-compatible list of options in a text file before running other items. Then, within the Bunch, read that text file into a variable and use it to display a menu of options. Putting it all together:

```bunch
---
title: Dialogs from Files
run before: get_json.rb
---
options = $ cat ~/scripts/json_results.txt
choice = ?{${options/raw}}

(log ${choice})
```
