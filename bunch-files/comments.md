---
layout: default
title: Comments
parent: Bunch Files
---
# Commenting a Bunch

Comments can be included in your Bunch files. They can be used to remind yourself what a long [key combo]({{ site.baseurl }}/docs/bunch-files/keystrokes/) string or a why apps are in a specific sequence, or they can be used to explain things when sharing Bunches with others. (Admittedly, they're mostly so I can clearly explain things in example Bunches.)

## Line comments

Line comments are preceded by `#` or `//`. They can be at the beginning of a line, or included with a regular line at the end. Comments indicators must be followed by one or more spaces, and comments at the end of a line must also be preceded by one or more spaces.

```
// This is a line comment
# This is also a line comment

%MailMate // this is an inline comment
@Xcode # This is also an inline comment

# Not to be confused with snippet fragment identifiers, 
# which don't have a space before or after
<Useful.snippets#Fragment ID

# Though you can use comments *after* a fragment ID...
<Useful.snippets#Fragment ID # as long as it's surrounded by spaces

// Also not to be confused with fragment identifiers in snippets, 
// which function as comments but also require square brackets
###[My Fragment]###

// But they won't work on a fragment divider line
###[My Fragment]### # This fragment won't be found.
```

## Block Comments

Block comments can also be used. These are delineated with `/*` at the beginning, and `*/` at the end. These markers can be on the same line or on their own line.

```
/* This is a block comment
   It has a couple of lines */

/******************************
/* This is also a block comment
/* with some decoration.
/*
/* It will keep going until the
/* end marker.
/******************************/

/*
Or keep it simple
*/
```
