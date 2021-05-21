---
layout: default
title: Spotlight Searches
parent: Bunch Files
tags: [apps,spotlight]
---
# Using Spotlight Queries
{:.no_toc}
    
* Table of Contents
{:toc}

In the dashed lines that follow an app, you usually list files you want to open in that app. But you can also run some searches and open the results instead.

## Tag Search {#tagsearch}

You can use hashtags on a line to search for one or more tags. Multiple tags are joined as a boolean AND, meaning files must contain all of the tags to match.

```
Default
- #Taxes #2020
```

You can limit these searches to one or more directories by including a comma-separated list of paths in square brackets:

```
Default
- #Taxes #2020 [~/Dropbox/Receipts]
```

By default all searches are limited to 15 results, just so that a wayward search query doesn't leave you with 1000 files open in random applications. You can override this limit in either direction by adding an exclamation point followed by a number to the end of the line:

```
Default
- #Taxes #2020 !25
```

Scopes and limits can be combined.

## Spotlight Search {#spotlightsearch}

You can also harness the full power of Spotlight using the syntax you're used to in the floating Spotlight window. Just surround your search in single quotes. A scope can be defined as above, but with this query you can only specify one folder. It defaults to your Home folder and all of its subfolders. The same scope and result limit modifiers as above apply.

```
Default
- 'kind:"affinity photo" tag:brettterpstra.com name:template' [~/Dropbox] !5
```

You could use this to review files at the end of the day. [Schedule a Bunch]({{ site.baseurl }}/docs/bunch-files/frontmatter) to launch at 4:30pm, and have it open recent files on your Desktop or in your Downloads folder for review:

```
---
open at: 4:30pm
title: Document Review
---
Default
- '(kind:pdf OR kind:Word) AND date:today' [~/Downloads] !10
```

> Tip: Along the same lines, you can also use the [URL handler]({{ site.baseurl }}/docs/integration/url-handler) to create links you can put into OmniFocus or Things to load up a daily review.
{:.tip}

