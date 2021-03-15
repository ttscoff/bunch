---
layout: default
title: Frontmatter
parent: Bunch Files
---
# Controlling Bunch With Frontmatter
{:.no_toc}
    
* Table of Contents
{:toc}

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

## Available Keys {#keys}

Here are the available keys:

| `title:`       | Override the [display title](#displaytitle). Emojis OK. |
| `menu order:`  | Force menu [sort order](#sortorder)                     |
| `shortcut:`    | Define a keyboard shortcut for opening the Bunch        |
| `open at:`     | Set a time to open this bunch daily                     |
| `close at:`    | Set a time to close this bunch daily                    |
| `close after:` | Automatically close after an interval                   |
| `open on:`     | Set a weekday and time to repeat weekly                 |
| `open every:`  | Repeat open at intervals                                |
| `startup:`     | `true`, `false`, or `ask` to open this Bunch on launch  |
| `from file:`   | A file path to load additional                          |
| `from script:` | A shell script path that returns YAML                   |
| `sequence:`    | parallel or sequential, determines execution order      |
| `single bunch mode:`  | `ignore` prevents closing                        |
| `toggles:`     | `false` prevents toggling this Bunch open/closed        |
| `ignores state:`| Allow open/close even when already open/closed         |
| `quits apps:`  | `always` close apps open in other Bunches               |

{% img float-right pl-4 pt-4 /bunch/images/emojititles.jpg 490 212 %}

### Bunch Scheduling

See [Scheduling Bunches]({{ site.baseurl }}/docs/bunch-files/scheduling-bunches) for details on the `open ...` and `close ...` keys.

### Bunch Behavior {#behavior}

To learn more about sequential and parallel execution with the `sequence` key, see [Execution Sequence]({{ site.baseurl }}/docs/bunch-files/sequence).

The `startup` key can be set to `true`, `false`, or `ask`. (or `yes`/`no`/`?`) and has the same effect as adding a bunch name to a [`*.startup` script]({{ site.baseurl }}/docs/bunch-files/startup-scripts). If set to `ask`, a confirmation dialog will pop up before opening that Bunch.

Setting `single bunch mode: ignore` will prevent the Bunch from affecting or being affected by the launch of other Bunches in Single Bunch Mode. This allows you to use Single Bunch Mode to quit one Bunch when opening the next, but have Bunches that can be always-on.

Setting `toggles: false` will only allow the Bunch to open, but will never register it as Open, meaning it can't be closed. It won't get a checkmark in the menu, it won't be remembered as an open Bunch if "Preserve Open Bunches" is on, and other Bunches can't close it. Apps it has open won't be registered by other apps, and won't prevent other apps from quitting them. (If you like it better semantically, you can also use `only opens: true`.)

Setting `ignores state: true` will allow Bunches to re-open or re-close when scheduled. Normally if a schedule is set for a Bunch to open or close and it already is, that schedule is ignored. With this option set you can have the Bunch re-launch or re-close, restoring the launched or quit apps and running scripts on a schedule. This setting functions independently of `toggles/only opens`.

Setting `quit apps: always` will force the Bunch to quit apps it opened regardless of whether the app is open in another Bunch. This correlates with the "Quit Apps Open in Other Bunches" global preference, but allows enabling this on a per-Bunch basis.

## Customizing Menu Display Title {#displaytitle}

The "title" key changes the display title of the Bunch, as seen in the menu. When calling the Bunch from any other Bunch, you'll still use the filename.

You can totally use emoji in the frontmatter title and get a sweet looking menu 😁. The menus are sorted alphabetically by display title, so changing the `title:` key will change the sort order of the list. Sort order ignores emoji, so `😊Bunch A` still comes before `♥️Bunch B`.

## Customizing Menu Order {#sortorder}

The "menu order" key defines the sort order of Bunches in the menu that Bunch displays, either in the menu bar or from the Dock icon. 

Any Bunch with a "menu order" number between 1 and 99 will be sorted by number at the beginning of the menu. If multiple Bunches have the same number, they will be sorted alphanumerically (by display title) within that position.

Bunches without a menu order value will be sorted alphabetically after the numbered bunches.

Bunches with a menu order greater than 99 will be sorted by number and appended to the end of the list. Adding `menu order: 100` to a Bunch will force it the the end of the list. Duplicate numbers are sorted alphanumerically.

> If you increment your menu order numbers by 5 or 10 when first starting out, you'll have room to stick new ones in or move them around without having to re-order everything. E.g. put your top menu item at 10, second one at 20. Then if in the future you want something else at the top of the list or between those two, you can just put it at position 5 or 15 and still have room to fit 4 more in either direction before you have to go through and renumber everything.
{:.tip}

### Adding Menu Dividers {#dividers}

You can use the `menu divider` key to add separators to the Bunch menu. The key can be set to `before` or `after`, determining whether the inserted divider comes before or after the Bunch in the menu.

    ---
    title: Just A Bunch
    menu order: 10
    menu divider: after
    ---


### Setting a Shortcut Key {#shortcuts}

When running in the menu bar Bunch has full keyboard control. Assign a Hotkey key in preferences to open the Bunch menu, and then use keyboard shortcuts to open your Bunches. By default Bunches are given numbers as shortcuts, from 1-9 and then 0, assigned in menu display order. Subsequent items are assigned Command-Number, from "⌘1" to "⌘0". You can customize these using the `shortcut:` frontmatter key.

A shortcut can be anything other than a number, and can include modifiers (control, option, shift, command). A capital letter automatically implies the Shift modifier.

> Modifiers are not required and single keystrokes work great for launching Bunches. Just assign `shortcut: a`, then hit the hotkey to open the menu and type "a" to open the Bunch.;
{:.tip}

Modifiers can be specified using symbols:

| symbol |   modifier  |
|--------|-------------|
| @      | Command (⌘) |
| $      | Shift (⇧)   |
| ~      | Option (⌥)  |
| ^      | Control (⌃) |

To use any of these symbols as the actual modifier key, use the Shift-equivalent, i.e. `$` would be `$6` (Shift-6), and `@` would be `$2`.

To set a menu shortcut of Command-T for your Bunch, you would include this in the frontmatter:

```
---
shortcut: @t
---
```

Shortcuts can also use words in the format `option-command-t`.

If you duplicate a shortcut between two Bunches, only the first one (in menu order) will get the shortcut. The conflicting Bunch will fall back to the auto-assigned numeric shortcuts.

## Arbitrary Keys as Default Variable Values {#arbitrarykeys}

You can add arbitrary key/value pairs in the frontmatter. These will be stored and passed as default values to Bunches, snippets, and scripts. For example, if your snippet had a variable `${say}` in it, and the calling Bunch had a `say:` line in the frontmatter, that value would be passed unless specifically passed as a variable to the snippet.

    ---
    say: anything
    ---
    # Gets say=anything as variable
    <speech.snippet

    # Gets say=something as variable
    <speech.snippet
    - say=something

The order of precedence for snippet variables is: variable defined after the snippet line, then value found for matching key in the frontmatter, then any[default value]({{ site.baseurl }}/docs/bunch-files/snippets#defaultvalues)  defined in the snippet.

These variables are available in Snippets and as environment variables in shell scripts. They are not passed to Automator Workflows because those will error out if given unexpected variables.

## Flexible Frontmatter

In addition to hardcoding frontmatter keys and values, you can set them on the fly using several flexible options.

### Interactively Setting Variable Values

You can use dialogs to set values for frontmatter keys interactively when the Bunch opens. See [Interactivity->Variables]({{ site.baseurl }}/docs/bunch-files/interactivity/#variables) for details.

### Setting Variables On Open

When calling a Bunch [from another Bunch]({{ site.baseurl }}/docs/bunch-files/other-bunches/#variables) or via the [URL handler]({{ site.baseurl }}/docs/integration/url-handler/), you can pass key/value pairs to override hardcoded (or missing) frontmatter keys for use in `${variables}`.

If using `${variables}` in a Bunch, be sure to include [default values]({{ site.baseurl }}/docs/bunch-files/snippets#defaultvalues) (`${variable:default value}`) or hardcoded frontmatter values for the keys for when the Bunch is called directly from the menu and can't have values passed to it.

### Dynamic Frontmatter {#dynamicfrontmatter}

You can use `from file` and `from script` to load in variables from external sources.

A frontmatter line such as `from file: filename.txt` would read in additional values from `filename.txt`. Paths are assumed to be relative to the configured Bunch folder unless they're absolute paths. The contents of `filename.txt` should be only colon-separated key-value pairs. This allows external automation to write data to files that affect your Bunch without having to modify the Bunch itself. A file called in this manner will be watched for updates, and the Bunch will be automatically updated if the file changes.

You can also run a shell script, which should also return just key value pairs. Most scripting languages have a YAML library that makes it pretty easy to easily output data in a suitable format. Lines with YAML separators (`---`) will be ignored.

When one of these keys is detected, the file or script results will be merged with the other keys, if any, overwriting values for existing keys.

Frontmatter is only updated when a Bunch is opened, when a change is made to the Bunch file itself, or when an imported file is changed. Changing a referenced script will not trigger an update, but the new data will be parsed before any additional snippets or scripts are opened.

You can also incorporate dialogs in a frontmatter script. See [advanced scripting]({{ site.baseurl }}/docs/integration/advanced-scripting#password) for an example.

#### A Ridiculous Example
{:.no_toc}
    
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
