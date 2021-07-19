---
layout: default
title: Optional Snippets
nav_order: 10
parent: Interactivity
grand_parent: Bunch Files
tags: [interactivity,interactive,dialog,snippets]
---
# Optional Snippets With Dialog {#optionalsnippets}

You can have Bunch ask whether a snippet should be loaded when opening a Bunch by adding a query at the end of it. The format for the query is a question mark (?) immediately followed by a double-quoted string. The string within the quotes will be used as the text of the dialog, with buttons "Yes" and "No".

```bunch
< MySnippet.snippet ?"Load My Snippet?"
```

When the Bunch is launched, a dialog will ask "Load My Snippet?" and request user interaction. Clicking "Yes" will load the referenced snippet, clicking "No" will skip loading it. This can be used with variables and fragments, as well:

```bunch
<General.snippets#Spotify ?"Play some music while you work?"
- url=spotify:​playlist:3cSpIL4Q0H3uqdBMbT6c9x
- autoplay=true
```

{% hovergif images/optionalsnippet.gif "Animation showing result of Optional Snippet" "Optional Snippets" %}

You can include multiple optional snippets, but --- due to the asynchronous way Bunches are launched --- the questions may not be asked in file order. Make the queries descriptive to avoid confusion.

You can also ask about snippets when the Bunch is closing:

```bunch
!<General.snippets#Goodbye ?"Turn off the lights on your way out?"
```
