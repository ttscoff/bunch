---
layout: default
title: Command Line Tool
parent: Integration
nav_order: 20
tags: [scripting,cli]
---
# The Bunch CLI

The latest version is {% bunchcli version %}.

> While Bunch 1.4 is in Beta, use the pre-release version of the CLI (for Bunch 1.4+ only): `gem install bunchcli --pre`.
{:.tip.important}

Install the Bunch CLI using `gem install bunchcli`.

Installing the gem provides the executable `bunch`, which should now be in your path.

Run `bunch -h` for usage instructions.

{% bunchcli help %}

Example:
    
    # Open or Toggle Coding.bunch
    bunch Coding

    # Force open Coding.bunch
    bunch -o Coding

    
The command line tool can also be used to generate Bunch urls for use in other applications. To output any command as a URL instead of executing it, add `-u`:

    bunch -o Coding -u

To generate a URL interactively, run:

    bunch -i

