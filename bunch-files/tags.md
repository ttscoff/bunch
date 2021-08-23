---
layout: default
title: Tags
parent: Bunch Files
tags: [tag]
---
{% availablenotif 119 %}

# Organizing With Tags

You can add `tags:` frontmatter to a Bunch for organization and batch operations.

```bunch
---
title: My Tagged Bunch
tags: tag1, tag2
---
```

These tags generate a submenu. In the example above, you would now see a new __Tags__ menu item in the Bunch menu, containing __tag1__ and __tag2__ submenus. The tagged Bunch would show up in each of the menus, along with any other Bunches containing that menu's tag.

You can also [apply frontmatter keys to all Bunches with a given tag]({{ site.baseurl }}/docs/using-bunch/organizing-bunches/#tagfrontmatter) using `@tagname.frontmatter` files.

From within a Bunch, you can use a backslash to operate on tagged Bunches. To open all Bunches tagged with "tag1", you would include `\tag1` on a Bunch line.

```bunch
---
title: Launching other Bunches
---

\tag1
```

Multiple tags can be combined. Combining with a comma produces an OR boolean, so `\tag1,tag2` will launch any Bunches containing _either_ `tag1` or `tag2`. Use a plus sign to combine with AND, so `\tag1+tag2` will only launch Bunches tagged with _both_ `tag1` _and_ `tag2`.

You can close tagged Bunches with `!\tagname`. You can also launch tagged Bunches when closing the parent Bunch using `!!\tagname`.

> Be aware that if you call a `\tag` command from within a Bunch containing that tag, that Bunch will also be affected. Be cautious as results can be unpredictable if Bunches calling Bunches get nested too deeply.
{:.warning}

