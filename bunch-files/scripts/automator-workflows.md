---
layout: default
title: Running Automator Workflows
parent: Running Scripts
grand_parent: Bunch Files
tags: [automator, scripts]
---
# Running Automator Workflows

If a line starts with an ampersand (`&`), it will be run as an Automator workflow. These should be created in Automator as a Workflow, and saved with the `.workflow` extension.

> Note that all Workflows for Bunch must have a variable named "Bunch" defined. See the [Using Variables](#variables) section for instructions on adding a variable to a Workflow.
{:.warning}

In your Bunch, you can specify a full path to a Workflow like this:

```bunch
& ~/Dropbox/MyWorkflow.workflow
```

...but if the workflow is in the same folder as your Bunches, you can just list its filename, with or without `.workflow`. For example, if my Bunch folder contained `Do Something.workflow`, I could use a line in my Bunch with simply:

```bunch
& Do Something
```

If you want to keep a subfolder of Workflows in your Bunch folder, just reference them with a relative path, e.g.

```bunch
& workflows/Do Something
```

## Using Variables {#variables}

You can pass variables to a workflow the way you pass files to an application in Bunch, using hyphens below the line that calls the workflow, one variable per line:

```bunch
& Do Something
- variable1 = Contents of var 1
```

The spacing around the `=` doesn't matter, as long as there is a single key and a value. Additional `=` in the line will be included in the variable value.

To use these in Automator, they must exist in the workflow; if you pass a variable that doesn't exist, the workflow will not run. Simply open the __Variable__ palette in Automator by clicking the "stack" button at the bottom of the window, right click in the table view, and select "New Variable". Make the variable name exactly the same (case sensitive) as the variable you're passing from Bunch. Now, when the workflow is run, that variable will be populated automatically by the lines in your Bunch.

{% img flex-justify-around /bunch/images/automatorvariable.png 668 283 "Adding the Bunch variable to the Automator Workflow" %}

> The variable "Bunch" is automatically populated with the name of the opened Bunch, but you have to add an empty variable with this title or Bunch will get an error when it tries to populate it.
{:.warning}

In combination with "Run Shell Script" actions, "Bunch" and your custom variables can be used to run different actions based the arguments provided, allowing re-use of the same workflow in multiple Bunches.

See the [Bunch and Timing](https://brettterpstra.com/2019/07/02/bunch-and-timing/) post for details.
