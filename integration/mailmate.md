---
layout: default
title: MailMate
parent: Integration
tags: [integration,email,mailmate]
---
# Integrating with MailMate

You can use MailMate for sending automated emails. There's a utility included with MailMate called `emate`. To install it, run:

	ln -s /Applications/MailMate.app/Contents/Resources/emate /usr/local/bin/

Then in a Bunch, you can call it to send an email, substituting [variables]({{ site.baseurl }}/docs/bunch-files/variables/) to allow dynamic emails.

By default the `emate` command will create the email and open the Compose window, ready to send. To send the email immediately without interaction, include the flag `--send-now`.

To have the contents processed as Markdown, include the flag `--header "#markup: markdown"`.

A Bunch script item might look like this:

```bunch
// Dropdown selection for recipient email
recipient = ?[address1@example.com, address2@example.com, address3@example.com]
// Text input for email subject
subject = ?"What email subject?"

$ echo -e "# Just Testing\n\n- See how this goes\n- Should make a Markdown list\n"|/usr/local/bin/emate mailto --to "${recipient}" -f "tester@example.com" --subject "${subject}" --header "#markup: markdown" --send-now
```
