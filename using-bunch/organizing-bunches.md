---
layout: default
title: Organizing Bunches
parent: Using Bunch
nav_order: 35
tags: [shortcuts,frontmatter]
---
# Organizing the Bunch Menu
{:.no_toc}

If you have a significant number of Bunches, you may want more control over how Bunches appear in the menu.

* Table of Contents
{:toc}

## Set Display Titles

Start by setting the title displayed in the menu using [title frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#displaytitle). You can use emoji in the display title without affecting the alphanumeric sort order.

## Define Menu Order

You can manually control the order of menu items using [menu order frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#sortorder).

## Sort With Submenus

Lastly, you can use folders in Finder to create submenus of Bunches. Submenus appear at the end of the list, after any Bunches in the base Bunch Folder.

To add a submenu, create a folder inside of your Bunch Folder (the base folder defined in Preferences) in Finder. Move Bunches you want in the submenu into the new folder. Bunch will automatically create a submenu titled with the name of the subfolder (see below for customizing the title), listing the Bunches it contains.


If you have a file arrangement like this:
```
Bunch Folder/
    Bunch 1.bunch
    Bunch 2.bunch
    Subfolder/
        Bunch 3.bunch
        Bunch 4.bunch
        folder.frontmatter (optional, see Customizing the Submenu Title)
```

The resulting menu would look like:

{% img aligncenter mx-auto /bunch/images/submenus.jpg 458 196 %}

A few things to note:

1. Folders can only be nested one level deeper than the base folder. Folders inside of subfolders will be ignored.
2. Relative paths (for scripts, snippets, other Bunches) used in Bunches within subfolders are still relative to the base folder. If you reference `myscript.sh` without a path, it will be assumed that it's located in the base Bunch Folder.
3. In the base menu, each item gets a numeric shortcut key automatically assigned to it. Items in submenus are not assigned shortcut keys, but you can still assign a custom one using [shortcut frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter/#shortcuts).
4. Bunches with the same name can exist in different subfolders. When referring to a Bunch in a subfolder (from another Bunch or via AppleScript/URL handler) you should prefix with the folder name (e.g. `Subfolder/Bunch Name`). This can be either the actual folder name, or the display title.

### Submenu Frontmatter {#frontmatter}

If you include a file called `folder.frontmatter` inside the subfolder, [frontmatter keys]({{ site.baseurl }}/docs/bunch-files/frontmatter/) in this file will be [applied to all Bunches it contains]({{ site.baseurl }}/docs/frontmatter/#folderfrontmatter), with the exceptions listed below. 

> A `folder.frontmatter` file can also exist in the base Bunch Folder, but doesn't affect subfolders and all submenu-specific keys are ignored. Other keys it contains will be applied to all Bunches in the root folder.

The following frontmatter keys in `folder.frontmatter` only apply to subfolders and will not affect the Bunches they contain:

__`ignore`__
: To ignore a folder completely, set `ignore` to true:

:   ```bash
    ---
    ignore: true
    ---
    ```

__`title`__
: Use the `title` key to set display title for the submenu, overriding the name of the folder. This can include emoji. Sort order of submenus is alphanumeric, ignoring emoji.

:   ```bash
    ---
    title: 👍🏻The Submenu Title
    ---
    ```

__`menu divider`__
: You can add menu separators before or after the submenu item as well, by setting `menu divider` to `before` or `after`:

:   ```bash
    ---
    title: Submenu After Divider
    menu divider: before
    ---
    ```

All other keys are passed on to the Bunches the folder contains, with the exception of `shortcut` (which is ignored entirely).

Folder frontmatter can also be used to apply frontmatter keys to every file it contains. See [Applying Frontmatter to Multiple Bunches]({{ site.baseurl }}/docs/frontmatter/#folderfrontmatter).
