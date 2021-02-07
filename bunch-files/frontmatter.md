---
layout: default
title: Frontmatter
parent: Bunch Files
---
# Controlling Bunch With Frontmatter

You can use frontmatter at the top of your Bunch to do things like change the menu display title or schedule launches on a repeating basis.

Frontmatter goes at the very top of a Bunch, and is fenced off by three dashes (minus symbol) at the top and bottom. Within the fence is a series of keys and values separated by colons.

Example frontmatter:

```
---
title: 📞Comms
open at: 8am
startup: true
---
```

Bunch treats keys the way MultiMarkdown does: it allows spaces and is case insensitive, but they're compressed and lowercased when read in, so `Open at` becomes `openat`. Feel free to make your keys as readable or as efficient as you like. Unrecognized keys have no effect and are saved as arbitrary variables available to snippets.

## YAML-ish

Bunch frontmatter resembles YAML, but it's a simplified system. Spaces are allowed in key names, but any spaces or underscores are removed when the variable is read in. All keys are lowercased. If your line is `First Name: Brett`, the variable would be accessed using `${firstname}`.

Bunch frontmatter doesn't support the more complex structures of YAML, such as arrays and blocks. It's simply single-line keys and string values.

## Available Keys

Here are the available keys:

| `title:`       | Override the [display title](#displaytitle). Emojis OK.    |
| `menu order:`  | Force menu [sort order](#sortorder)                        |
| `open at:`     | Set a time to open this bunch daily                        |
| `close at:`    | Set a time to close this bunch daily                       |
| `close after:` | Automatically close after an interval                      |
| `open on:`     | Set a weekday and time to repeat weekly                    |
| `open every:`  | Repeat open at intervals                                   |
| `startup:`     | true or false to open this Bunch on launch                 |
| `from file:`   | A file path to [load additional YAML](#dynamicfrontmatter) |
| `from script:` | A shell script path that returns YAML                      |
| `sequence:`    | parallel or sequential, determines execution order         |


{% img float-right pl-4 pt-4 /bunch/images/emojititles.jpg 490 212 %}

See [Scheduling Bunches]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) for details on the `open ...` and `close ...` keys.

To learn more about sequential and parallel execution with the `sequence` key, see [Execution Sequence]({{ site.baseurl }}/docs/bunch-files/sequence)

The `startup` key can be set to true, false, or ask. (or yes/no/?) and has the same effect as adding a bunch name to a [`*.startup` script]({{ site.baseurl }}/docs/bunch-files/startup-scripts). If set to `ask`, a confirmation dialog will pop up before opening that Bunch.

### Customizing Menu Display Title {#displaytitle}

The "title" key changes the display title of the Bunch, as seen in the menu. When calling the Bunch from any other Bunch, you'll still use the filename.

You can totally use emoji in the frontmatter title and get a sweet looking menu 😁. The menus are sorted alphabetically by display title, so changing the `title:` key will change the sort order of the list. Sort order ignores emoji, so `😊Bunch A` still comes before `♥️Bunch B`.

### Customizing Menu Order {#sortorder}

The "menu order" key defines the sort order of Bunches in the menu that Bunch displays, either in the menu bar or from the Dock icon. 

Any Bunch with a "menu order" number between 1 and 99 will be sorted by number at the beginning of the menu. If multiple Bunches have the same number, they will be sorted alphanumerically (by display title) within that position.

Bunches without a menu order value will be sorted alphabetically after the numbered bunches.

Bunches with a menu order greater than 99 will be sorted by number and appended to the end of the list. Adding `menu order: 100` to a Bunch will force it the the end of the list. Duplicate numbers are sorted alphanumerically.

> If you increment your menu order numbers by 5 or 10 when first starting out, you'll have room to stick new ones in or move them around without having to re-order everything. E.g. put your top menu item at 10, second one at 20. Then if in the future you want something else at the top of the list or between those two, you can just put it at position 5 or 15 and still have room to fit 4 more in either direction before you have to go through and renumber everything.
{:.tip}

### Arbitrary Keys as Default Variable Values {#arbitrarykeys}

You can add arbitrary key/value pairs in the frontmatter. These will be stored and passed as default values to snippets and scripts. For example, if your snippet had a variable `${say}` in it, and the calling Bunch had a `say:` line in the frontmatter, that value would be passed unless specifically passed as a variable to the snippet.

    ---
    say: anything
    ---
    # Gets say=anything as variable
    <speech.snippet

    # Gets say=something as variable
    <speech.snippet
    - say=something

The order of precedence for snippet variables is variable defined after the snippet line, then value found for matching key in the frontmatter, then any [default value]({{ site.baseurl }}/docs/bunch-files/snippets#defaultvalues) defined in the snippet.

These variables are available in Snippets and as environment variables in shell scripts. They are not passed to Automator Workflows because those will error out if given unexpected variables.

### Dynamic Frontmatter {#dynamicfrontmatter}

You can use `from file` and `from script` to load in variables from external sources.

A frontmatter line such as `from file: filename.txt` would read in additional values from `filename.txt`. Paths are assumed to be relative to the configured Bunches folder unless they're absolute paths. The contents of `filename.txt` should be only colon-separated key-value pairs. This allows external automation to write data to files that affect your Bunch without having to modify the Bunch itself.

You can also run a shell script, which should also return just key value pairs. Most scripting languages have a YAML library that makes it pretty easy to easily output data in a suitable format. Lines with YAML separators (`---`) will be ignored.

When one of these keys is detected, the file or script results will be merged with the other keys, if any, overwriting values for existing keys.

Frontmatter is only updated when a Bunch is opened or when a change is made to the Bunch file itself. Changing a referenced file or script will not trigger an update, but the new data will be parsed before any additional snippets or scripts are opened.

You can also incorporate dialogs in a frontmatter script. See [advanced scripting]({{ site.baseurl }}/docs/integration/advanced-scripting#password) for an example.

#### A Ridiculous Example

Just to demonstrate the capability of dynamic frontmatter, you could have a line in your frontmatter that reads additional data in from a script called `frontmatter.rb`:

    ---
    from script: frontmatter.rb
    ---

The file `frontmatter.rb` would exist in your Bunch folder, so no path would be needed. It would do something like:

```ruby
#!/usr/bin/env ruby
require 'yaml'
require 'time'
t = Time.now
names = %w(Jim Sara Jake Sue John Sally Joe)
data = {
  'name' => names[rand(names.length)],
  'date' => t.strftime('%c') }
puts YAML.dump(data)
```

Picking a random name and adding the current date. Now when the Bunch is read in, the frontmatter it actually stores looks like:

    ---
    fromscript: frontmatter.rb
    name: Sara
    date: Sat Jan 30 15:09:31 2021
    ---

Which means that in any snippets that are called within the Bunch, you can reference the `name` and `date` variables. Let's load a snippet called `test.snippets` that contains:

    ---[Welcome]
    * say "Hi ${name}, today is ${date}"

Reference that snippet in the Bunch but don't define either of the variables:

    <test.snippets#Welcome

When it runs, the name variable will be replaced with a random name, and the current date will be passed. It will update prior to every time it opens. This is obviously stupid, as you could have just written a script that said this without populating variables and importing snippets, but it illustrates how dynamic frontmatter can work.

See [Advanced Scripting]({{ site.baseurl }}/docs/integration/advanced-scripting) for more crazy ideas.
