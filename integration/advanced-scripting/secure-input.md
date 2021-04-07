---
layout: default
title: Secure Input
parent: Advanced Scripting
grand_parent: Integration
tags: [password,interactive,dialog]
---
# Adding a Secure User Input Dialog

Bunch allows you to get text input for a script, but it doesn't have secure text entry. Here's an example that allows you to use AppleScript's `display dialog with hidden answer` to handle this.

Also see [Using Sudo]({{ site.baseurl }}/docs/integration/advanced-scripting/sudo/) for another option.

## Secure Input Using AppleScript

You can use the `from script` [frontmatter]({{ site.baseurl }}/docs/bunch-files/frontmatter#dynamicfrontmatter) to implement a password dialog that can be passed on to your scripts. This could, for example, allow you to automate unlocking a keychain and getting a secure password for a scripted curl call. It also serves as an example of just getting interactive input for a script and could be applied to select dialogs, file select dialogs, and more.

1. Create a script that uses AppleScript to show a dialog. This can be done in an actual AppleScript, or in a shell script that calls `osascript`. Here's a ruby example:
    
    ```ruby
    #!/usr/bin/env ruby
    require 'yaml'
    
    password = %x{osascript <<'APPLESCRIPT'
      return text returned of (display dialog "Enter password" default answer "" buttons {"Cancel", "OK"} default button 2 with hidden answer)
    APPLESCRIPT}.strip
    
    puts YAML.dump({'password' => password})
    ```
    
    This displays a secure input dialog (secure in that the input is hidden) and returns the response formatted as YAML.
2. Save the script in your Bunch folder as `mypasswordscript.rb`. Make the script executable (`chmod a+x mypasswordscript.rb`) and you can call it from a Bunch's frontmatter:

    ``` 
    ---
    from script: mypasswordscript.rb
    ---
    ```

    When the Bunch is opened, the result of the above script will be read in and appended to the Bunch's frontmatter.

3. Now you can use the `${password}` variable as either an argument or an environment variable in a snippet. Here's a Bunch with an embedded snippet and appropriate frontmatter:

    ```
    ---
    from script: mypasswordscript.rb
    ---
    
    <<#Password Protected
    - user=ttscoff
    
    ___

    ---[Password Protected]
    $ mycoolscript.sh ${user}:${password}
    ```

    This calls an embedded snippet containing two variables. The variables will be populated by the frontmatter we generated in the Ruby script.

    The snippet calls another shell script with a command line argument containing `user:password`.

    When this Bunch is opened, the Ruby script runs and the password dialog is shown. The result gets added to the frontmatter, which then populates the variables in the snippet.

This is, of course, a fairly silly example, as you could simply add the password request into a script and have it execute something using the password in one line, as opposed to the roundabout method of passing data to the frontmatter through one script and then calling a second script in a snippet. Hopefully it illustrates some possibilities, though.
