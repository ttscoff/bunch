---
layout: default
title: IDE Packages
parent: Integration
tags: [integration,sublime,editor]
---
# IDE Packages
{:.no_toc}

* Table of Contents
{:toc}

[sublime]: https://github.com/ttscoff/Sublime-Bunch
[package control]: https://packagecontrol.io/packages/Bunch
[textmate]: https://github.com/kotfu/Bunch.tmbundle

## Sublime Text

A [Sublime Text package][sublime] for Bunch is available.

- Syntax highlighting for Bunch files and Snippets
- Light and Dark themes
- Completions for Bunch commands
- Completions for any app name on your system
- Completions for frontmatter keys
- Navigate snippet fragments with ⌘R

{% img aligncenter /bunch/images/bunch-sublime.jpg 800 424 %}

The package is hosted [on GitHub][sublime], but is most easily installed using [Package Control][]. Open the command palette, run `Package Control: Install Package`, and search for "Bunch."

## TextMate

Kotfu created a [TextMate bundle][textmate] which includes:

- Syntax highlighting for Bunch files and Snippets
- Completions for Bunch commands
- Completion for any installed application name
- Completion for frontmatter keys

{% img aligncenter /images/bunch-tmbundle-dark-cobalt.png %}

## VS Code

I don't personally use VS Code much, and there hasn't currently been an extension submitted for it. However, I took a minute and converted the syntax definition from kotfu's TextMate package and bundled it into [a rough draft of a VS Code extension](https://github.com/ttscoff/VSCode-Bunch).

To install, download the entire repo to your `~/.vscode/extensions` folder. You can just git clone it there:

```bash
cd ~/.vscode/extensions
git clone https://github.com/ttscoff/VSCode-Bunch
```

(Restart VS Code after installing)

This will give you syntax highlighting for Bunch files (any file ending in `.bunch`, `.bunchsnippet`, or `.frontmatter`). It doesn't currently do anything else. If you're interested in developing this extension, just let me know. Happy to add maintainers to the existing repo, or replace it with your own.

{% img aligncenter /images/bunch-vscode.jpg %}

## Contributions Welcome

If you'd like to add support for Bunch files to your favorite editor or IDE, your contribution would be greatly appreciated.
