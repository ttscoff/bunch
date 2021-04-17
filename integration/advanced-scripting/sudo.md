---
layout: default
title: Using Sudo
parent: Advanced Scripting
grand_parent: Integration
tags: [password,scripts]
---
# Running Privileged Tasks (sudo)
{:.no_toc}

You can securely store and access passwords, including root passwords, by using built-in macOS tools. Using these tools makes it possible to run privileged tasks within a Bunch without having to hardcode your passwords in plain text.

* Table of Contents
{:toc}

## Adding a Password to Your Keychain

You can make use of Bunch's scripting features and the macOS Keychain to enable secure use of `sudo` in your scripts, as well as securely store and access passwords for other purposes.

The first step is to create a Keychain entry for the password you want to use. In this case, this will be your system password.

Open __Keychain Access__ in /Applications/Utilities. Unlock your `login` keychain if needed, then click the "Create new" button in the toolbar. Give the item a unique name, any account name you want, and then enter the password and click "Add."

{% img aligncenter /bunch/images/keychainhelper.jpg 600 332 %}

> Note that you can right click on the login toolchain in the left sidebar and use __Change Settings...__ to tell it how long to remain unlocked after entering your password. If your machine is private and you want it to remain unlocked for as long as you're logged in, disable "Lock after..." and enable "Lock when sleeping."
{:.tip}

## Scripting Keychain

Now this password entry can be accessed using the command line tool `security`, which we can use in a script. If the keychain is unlocked, the password will be retrieved without interaction. If it's locked, you'll be asked to enter your keychain password before access is granted.

The first and simplest option is just to put all of the sudo commands you need in one script and call the `security` tool at the top. You can then echo the retrieved password to `sudo -S`, which tells `sudo` to read the password from the command line.

We'll call `security` and give it the name you assigned to the keychain item (`-l`), and the account name (`-a`). `-w` tells it to return only the password.

```bash
#!/bin/bash

PASS=$(security find-generic-password -l "bunch password" -a bunch -w|tr -d '\n')

echo "$PASS" | sudo -S [your privileged command]
```

> The first time `security` is used from a script, you'll get a prompt to allow access. Be sure to click "Always Allow" to avoid getting the same prompt every time.
{:.tip}

If you want to make the password available to multiple scripts with one call, or want to gather multiple passwords at once for different scripts, you can use frontmatter to store them.

## Passwords and Frontmatter

1. Create a script to retrieve the password and return it formatted as a frontmatter key we can use in our Bunch.

    ```bash
    #!/bin/bash

    PASS=$(security find-generic-password -l "bunch password" -a bunch -w|tr -d '\n')

    echo "password: $PASS"
    ```

    (Repeat the above as many times as needed to get multiple passwords, storing them as unique variables.)

2. Save that as "password.sh" in your Bunch folder and make it executable with `chmod a+x password.sh`. 
3. In the Bunch, we'll set the script to load the result as frontmatter using `from script`:

    ```bunch
    ---
    title: My sudo Bunch
    from script: password.sh
    ---
    ```

    Now, when the Bunch is opened, it will get the password(s) from the script, asking us to unlock the keychain if needed, then assign it to the variable `password`, which we can then use in a Script Item. We're redirecting STDERR output just to keep the password prompt from showing up in our script output.

The following Bunch disables automatic Time Machine backup when it opens, and re-enables it when it closes. We're also running `tmutil stopbackup` to gracefully terminate any currently-running backups, which doesn't require privileged access.

```bunch
---
title: My Time Machine Bunch
from script: password.sh
---
# pass our password to sudo on STDIN
$ echo "${password}" | sudo -S tmutil disable 2>/dev/null
# stopbackup doesn't require root privileges
$ tmutil stopbackup

# Reverse on close with !$
!$ echo "${password}" | sudo -S tmutil enable 2>/dev/null
```

### Inline Variable Assignment

Rather than using `from script` and outputting YAML-formatted keys, you can also just run a single command and immediately assign it to a variable. If you're only getting one password, this would make sense.

```bash
password = $ security find-generic-password -l "bunch password" -a bunch -w|tr -d '\n'
$ echo "${password}" | sudo -S [my command]
```

### Better Password Masking

Following the above procedure does have the downside of showing your password in the command title when it's listed under Running Scripts (and in the Task Monitor). An alternative is to wrap the command in a second shell script. 

As mentioned at the top, if there's only one script being run, it's probably easiest to just include the `security` call in the script itself. But if you want to use frontmatter, all frontmatter keys/values are passed to the environment of every script the Bunch runs. You can access the `password` variable using `$password` (in Bash, Zsh, etc.) or whatever method the script's shell uses to access environment variables.

__timemachine.sh:__

```bash
#!/bin/bash

if [[ $1 == "disable" ]]; then
    echo "$password" | sudo -S tmutil disable 2>/dev/null
    tmutil stopbackup
else
    echo "$password" | sudo -S tmutil enable 2>/dev/null
fi

# Print the status Time Machine so it's available in the Task Monitor
tmutil status
```

__Time Machine.bunch:__

```bunch
---
title: My Time Machine Bunch
from script: password.sh
---
$ timemachine.sh disable
!$ timemachine.sh enable
```

Now the "Running Scripts" title will just read `timemachine.sh ...` in the menu and the Task Monitor.
