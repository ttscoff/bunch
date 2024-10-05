---
layout: default
title: Touch Bar Status Board
parent: Advanced Scripting
grand_parent: Integration
tags: [scripts]
---
# Creating a Bunch Status Board in Your Touch Bar
{:.no_toc}

{% img aligncenter /images/touchbarbunches.png 1141 86 "Buttons in Touch Bar" %}

I've created a [BetterTouchTool-Widgets script](https://github.com/ttscoff/BetterTouchTool-Widgets/) which can generate all of the Bunch widgets in your Touch Bar, get their UUIDs for updating, and handle refreshing the widgets. To use the script with Bunch:

1. Install the script according to [the README](https://github.com/ttscoff/BetterTouchTool-Widgets/).
1. Run `btt_stats.rb add touch bunch`.
2. Select the new group in BTT configuration. If it was open at the time you ran the script, you'll need to switch to a different screen (e.g. Keyboard) and back to Touch Bar to see the new group.
3. Right click and choose "Copy" to copy the group's data to the clipboard.
4. Run `btt_stats.rb uuids` to get a configuration block for the group data in the clipboard.
5. Add the configuration block to `~/.config/bttstats.yml`, merging with any existing keys in the `:refresh:` section.
6. Add (or update) a `folder.frontmatter` file in your Bunch folder with the following keys:

    ```bunch
    ---
    run after: /path/to/btt_stats.rb refresh "bunch:${basename}"
    run after close: /path/to/btt_stats.rb refresh "bunch:${basename}"
    ---
    ```

The above scripts make use of the built-in frontmatter key `basename`, which returns the actual filename of your Bunch, ignoring any display title settings. The keys that the script creates based on the AppleScript response to `tell app "Bunch" to list bunches` will match the value of `basename` key for whatever Bunch is calling it.

> Note that this method applies the `run after:` scripts to every Bunch in the folder. If you're using `run after:` scripts in any of your individual Bunches, you'll need to append this script after the existing ones in Bunches containing that key, as that will override the setting in `folder.frontmatter`. You can run multiple scripts by separating with a comma:
>
> ```bunch
> ---
> run after: my_original_script.sh, /path/to/btt_stats.rb refresh "bunch:${basename}"
> run after close: my_original_script.sh, /path/to/btt_stats.rb refresh "bunch:${basename}"
> ---
> ```
{:.tip}

Now whenever a Bunch opens or closes, its associated Touch Bar button will be updated with its state. The script to handle checking state is created and linked automatically when running `btt_stats.rb add touch bunch`.



