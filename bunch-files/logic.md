---
layout: default
title: Conditional Logic
parent: Bunch Files
tags: [snippets,variables]
---
# Conditional Logic
{:.no_toc}

If you want to have your Bunches perform different tasks based on various criteria, conditional logic can add flexibility and control.

* Table of Contents
{:toc}

## Syntax

Bunch supports if/else syntax. There are a number of conditions you can use to determine if a certain block will run. The most basic form of this is the "if" statement. The block starts with an "if _condition_" line, no indentation, and ends with a line containing just "end". The contents between the "if" and "end" are indented 4 spaces or one tab.

```bunch
if var_one
	Messages
	<Snippets.snip#Group 1
end
```

> Indentation must be exactly four (4) spaces or one (1) tab per level, with an additional 4 spaces/1 tab per nested level. If using spaces instead of tabs, every indentation level must be a multiple of 4.
{:.warning}

The condition can use a variety of syntax, from human readable to symbolic. See the next section for details. In the example above, Bunch simply tests the contents of a variable called var_one to see if it's "truthy" (yes, true, or 1). If so, it launches Messages and runs a snippet.

You can go further by providing "else" statements. These can be "else if _condition_", or just "else" to have a block that runs if nothing else matches. Both are optional. If used, the "else" block should come last.

```bunch
if var_one is "Choice 1"
	var_two = "Project 1"
	<<#Load Project
else if var_one is "Choice 2"
	var_two = "Project 2"
	<<#Load Project
else
	<<#Load Default
end
```

### Boolean Operators

Conditions can be combined using "AND" and "OR". 

```bunch
if condition 1 AND condition 2
	<<#You Win
end
```

You can group multiple conditions in parentheses and compare multiple groupings.

```bunch
if (condition 1 AND condition 2) OR (condition 3 AND condition 4)
	<<#You Win
end
```

### Nesting If/Else Blocks

You can nest if/else blocks, continuing to indent contents 4 spaces or one tab from the last level of indentation. Variables can be changed within blocks and tested again in nested conditions.

```bunch
test_var = true

if test_var
	(log test_var is true)
	test_var = false

	if test_var
		(log test_var is true)
	else
		(log test_var is false)
	end
end
```

### Waiting Snippets in If/Else Blocks

[Waiting Snippets]({{ site.baseurl }}/docs/bunch-files/snippets/#waitingsnippet) are specified by indenting 4 spaces or 1 tab, so within an if/else block they should be indented an extra 4 spaces or 1 tab beyond the indentation of the block level.

```bunch
if TweetBot is running
	Messages
		<<#Position Comms
end
```

## Conditions

Variable names in conditions can be "bare," writing just the variable name (with no spaces). You can optionally use a `$`, e.g. `$variable` for clarity. If a variable matching the key isn't defined, it will return false and not run the block.

All conditions can be negated using "not" or `! condition`. Negatives can only be invoked once, e.g. `weekday not !Friday` will be interpreted as `weekday is not Friday`.

Syntax: `if [condition]` where `[condition]` is one of the following.

Bunch is opening/closing
: Test if self is in the process of opening or closing. Use "self" or "this" to test current Bunch.

	`self is opening`      | Current Bunch is opening
	`self is closing`      | Current Bunch is closing
	`BunchName is opening` | Test another Bunch such as a parent 
	^^                     | ^^  Bunch which opened this Bunch

Bunch is open/closed
: Test if another Bunch is currently open or closed.
	
	`BunchName is open`   | Bunch is currently open
	`BunchName is closed` | Bunch is currently closed. 
	^^                    |^^ Also works as `BunchName is not open`

Parent tests
: If a Bunch was opened by another Bunch, its parent can be tested

	`has parent`/`is child`    | Bunch was opened by another Bunch
	`not parent`/`is not child`| Negative test
	`!child`                   | Negative shorthand
	`parent is BunchName`      | Test which Bunch opened this Bunch
	^^                         | ^^ Any string comparison operators work
	^^                         | ^^ e.g. `parent contains PartialName`

App is running
: Test if a given app is running or not.
	
	Example: `if Messages is running`

	`AppName is running` | App is currently running
	`AppName is not running` | App is not running
	
	`is` is optional, works as `AppName running`, `AppName not running`

Numeric comparison
: Test a variable's contents numerically. Conditions can be written out or represented with mathematical symbols. 

	All conditions can be negated with `not`, e.g. `var_name is not less than` is the same as `var_name is greater than or equal to`. Symbols can be negated with `!`, e.g. `var_name !<= 5`.

	Example: `if var_name is greater than 1`
	
	Natural language | Symbolic
	:------ | :------
	`is less than` | `var_name < 5`  
	`is less than or equal` | `var_name >= 5`  
	`is greater than` | `var_name > 1`  
	`is greater than or equal to` | `var_name >= 3`  
	`equals` / `is equal` / `is` | `var_name == 2`  

Text comparison
: Compare variable contents as a string. Comparisons are always case insensitive. 

	Example: `if var_name contains "complete"`
	
	Natural language | Symbolic
	:------ | :------
	`is` / `is not` | `==` / `!=`
	`starts with` / `does not start with` | `^=` / `!^=`
	`ends with` / `does not end with` | `$=` / `!$=`
	`contains` / `does not contain` | `*=` / `!*=`

"Truthy" comparison
: If the string being compared to is "yes", "no", "true", or "false", the comparison is "truthy", meaning it's registered as a boolean (true/false), and if the variable starts with "t", "y", or a number greater than 0, it matches true, and if it starts with "n", "f", or zero, it matches false. 
: I.e. if `var_name` is set to "yes" and the condition is `if var_name is true`, the condition will pass.


Weekday comparison
: Test whether the current weekday is before, after or is a given day, with the week starting on Sunday. Days can be abbreviated with standard abbreviations (`mon`, `wed`, `fri`). This comparison only works in English. The condition just needs to start with `weekday`.

	Remember that you can combine multiple conditions with "OR", so to have a block run on Tuesday and Thursday, use `weekday is Tues OR weekday is Thurs`

	Example: `if weekday is Wednesday`

	`weekday is` / `is not` | Current weekday matches
	`weekday is before` / `is not before` | From Sunday up to current day
	`weekday is after` / `is not after` | After current day and before next Sunday

Time comparison
: Test whether the current time is before, after, or matches a test value. Times can be in 24-hour format, or 12-hour with a meridian (am/pm).

	Example: `if time is before 12pm`

	`time is` / `is not` | Current time matches
	`time is before` / `is not before` | Between 12am and current time
	`time is after` / `is not after` | Between current time and 12am

## Tips

### Use Script Results As Conditions

You can use the [output of shell scripts to set variables]({{ site.baseurl }}/docs/bunch-files/variables/#script) which can then be tested with if/else blocks.

```bunch
my_var = $ test_script.sh // returns a string value on STDOUT

if my_var is "result one"
	<<#First Result
else if my_var is "result two"
	<<#Second Result
end
```

This works with AppleScripts as well (`my_var = * ...`), as long as the script returns a string or number.

### Combine Dialogs and Conditions

You can set a variable using a dialog, and then use an if/else block to perform different actions based on the choice. In its simplest form, this is essentially the same as just having a dialog run different snippets based on user selection, but by setting a variable you can have multiple if/else blocks, and the variable is passed to snippets (which can also contain their own if/else blocks).

```bunch
my_var = ?[Option 1, Option 2, Option 3] "Which option?"

if my_var ends with "1"
	Sublime Text
	- ~/Code/My Project
	my_var_2 = $ Test.sh // set a second variable
	// both my_var and my_var_2 are passed to any snippets called
	// which can then branch further
	<<#First
else if my_var ends with "2"
	...
end
```

### Use Snippets To Run Conditional Logic On Close

Because if/else blocks can be used within Snippets, you can use an on-close Snippet to run logic when closing a Bunch.

```bunch
!<<#On Close
__________________________
-[On Close]---------------
if Tweetbot is not running
	Comms.bunch
end
```
