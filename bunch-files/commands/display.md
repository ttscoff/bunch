---
layout: default
title: Display
parent: Commands
grand_parent: Bunch Files
tags: [display, command, browser, shell]
---
# Display Command
{:.no_toc}

The display command is used to open an HTML file, website, or text/log file in a viewer. The command allows for flexible window sizing and positioning. In it's most basic form it's just `display` and a filename:

```bunch
(display myfile.html)
```

If the file is in your Bunch folder, it can be a relative path[^relative]. The above command would show a 600x600 web view centered on the main display. Read on to learn about the myriad options.

[^relative]: Remember that relative paths in Bunches within subfolders are relative to the base Bunch Folder, not the containing subfolder.

* Table of Contents
{:toc}

## __HTML Files and Websites__

The display command can display HTML files and web URLs. You can provide a full path to a file, or one relative to the current Bunch Folder. For a website, just provide a full URL.

If the file is either a local HTML file (which must have the extension `.html`) or a URL, it will be viewed in a popup web view that floats above all other windows and can be dismissed with either Enter or Escape. It's clickable and scrollable.

This is not a "web browser." However, you can navigate to links, there are back, forward, and refresh buttons, and you can interact with sign-ins and forms. It's primarily designed for _displaying_, as the command name indicates, but it can replace opening a browser in a lot of situations. In situations where it's appropriate, this avoids having to open (possibly duplicate) browser tabs for task-related sites. Think of it as a lightweight Single Site Browser (SSB).

> Tip: If you point to a local server with LiveReload enabled, the preview will update appropriately. That makes it a decent preview for writing, say, documentation built on Jekyll (ahem), without opening a tab in your browser.
>
> `(display http:​//127.0.0.1:4000/bunch/ 1200x100% right,top)`
>
> If you want to use the WebKit Web Inspector on a web display window, you can do it through Safari. If you have the Develop menu enabled, any open Bunch web views will show up under your host name in that menu.
{:.tip}

A web view allows navigation to any link. If you'd rather open a link in the web view in your default browser, hold down Command ({% kbd ⌘ %}) when clicking it.

Navigate backwards and forwards with the `<` and `>` buttons, or use {% kbd ⌘[ %} and {% kbd ⌘] %}.

Refresh the view with the "Reload" button, or hit {% kbd ⌘R %}.

Press the Home button in the toolbar (or hit {% kbd ⇧⌘H %}) at any time to return to the URL originally specified for the display command.

If the initial window width is less than 1024, a mobile user agent string will be sent to any remote url requests. This can be overridden (or forced) by using `ua:desktop` or `ua:mobile`.

## __Text Files__

If a file is specified with the extension `.txt` or `.log`, it will be displayed as a text file with a monospaced font. The file is watched for changes and the preview will automatically update. The preview will "tail" the file, always scrolling to the end when it changes. Only the last 10,000 characters of the file are displayed.

ANSI escape codes are recognized and rendered. If the file you're watching contains escape codes, it's wise to set a background color appropriate for the display of the codes. See below for details on adding colors.

As an example, if your Bunch triggers a shell script that has logging, you can use the `display` command to tail the log in a floating or desktop-level window.

Use the Pause button to pause watching for file changes (and thus pause the window updates). When you click Resume, all changes that accumulated while paused will be shown.

> Note that if you want to preview Markdown or other text markup as HTML files, you should render it to HTML using your processor of choice. Point the `display` command to the resulting HTML file. That file will be watched for updates, so if you have a script running that refreshes the file, the preview will also refresh.
{:.tip}

## __Other File Types__

If the file is any kind other than HTML, it will be viewed using a Quick Look preview. The preview will be contained in a window that can be sized and positioned like the other display windows.

This works for any file that has a Quick Look plugin (pressing ⌘Y on it in Finder shows you a preview). It can be used to display images, Pages files for reference, audio files, or just about anything you can throw at it.

> This command was primarily created so I could show some welcome documentation, but it grew from there. Now you can use it to display a local log file, the image output of a shell script, or load up a website that you want to have floating while you work (or play). The latter is the most likely use for the average user. Bunch will store logins between launches, so once you've logged into a service like Facebook for messaging or Clockodo for time tracking, you can pop up a window when you open a Bunch to have the tools you need at hand, in a floating window, without opening them in your browser.
{:.tip}

## __Customizing the Window__ {#window}

You can define which display to open the window on, what size it should be, what position on the screen, foreground and background colors (for text files), and set the window's opacity. All parameters are optional. Except in the case of shell scripts, the first parameter must be the path to the file. Other parameters can be in any order.

| Parameter  |       Format      |            Additional options           |
|------------|-------------------|-----------------------------------------|
| FILE/URL   | file path or URL  |                                         |
| DISPLAY    | display:[0-9]     |                                         |
| SIZE       | [W]x[H]           | Points (e.g. 800x600)                   \
|            |                   | Percentage (e.g. 50%x50%)               \
|            |                   | "full" (same as 100%)                   \
|            |                   | Options can be mixed (50%x900)          |
| POSITION   | [X],[Y]           | Points from lower left (e.g. 600,800)   \
|            |                   | X can be "left", "center", "right"      \
|            |                   | Y can be "top", "center", "bottom"      \
|            |                   | Options can be mixed (left,100)         |
| BACKGROUND | 6-digit HEX (CSS) | #FFFFFF can be shortened to #FFF        |
| FOREGROUND | 6-digit HEX (CSS) | Must come after background              |
| OPACITY    | alpha:[0-100]%    |                                         |
| LEVEL      | level:[w,d,n,f]   | "wallpaper", "desktop"                  \
|            |                   | "normal", "floating"                    |
| CHROME     | chrome:none       | Create a "chromeless" window            |
| SPACE      |space:[all,current]| Display window on "all" spaces          \
|            |                   | or only on "current" (default)          |
| USER AGENT |ua:[desktop,mobile]| Specify whether an HTML view should     \
|            |                   | identify as desktop or mobile           |


Any of these may be omitted. Each parameter must be preceded by a space.

> All options can be abbreviated to one letter, i.e. `alpha:90%` can be written as `a:90%`, `display:1` can be shortened to `d:1`.
{:.tip}

A display command that uses every option would look like the below. This command displays a text file as a desktop-level "visor" (full-width window at stuck to the top of the screen) on the second display with a light-on-dark color scheme and slight transparency.

```bunch
(display myfile.txt display:1 100%x500 left,top #111111 #efefef alpha:97% level:desktop)
```

> Tip: If you leave size and position empty, it will create the window with default settings. Resize and position the window to your liking, then choose "Copy Dimensions of Active Window" from the Bunch menu. A compatible string containing that window's new dimensions and position will be copied to your clipboard for use in the `(display)` command.
{:.tip}

__Display__
: By default the display window will open on the screen that has the menu bar when the Bunch is opened.

    You can specify that the window open on any connected display. Displays are numbered from left to right, starting at zero. Your leftmost display will be 0, counting up as you move to the right. The command expects a single digit between 0 and 9. (If you have more than 10 displays, I have some followup questions.)

    If you specify a screen number higher than the number of attached displays, your main display will be assumed. This means that you can specify a display that isn't always available, and Bunch will use it when it is, but default to your primary display when it's not.

    The parameter must be preceded by `display:` but can be shortened to `d:`

    To put a centered window on your second monitor: `(display myfile.html d:1 800x800)`

__Window Size__

: To set the size of the window, include a size parameter in the form of WxH, e.g. `(display myfile.html 800x600)`. If this is omitted a default size will be assigned.

    You can specify these as percents, with a minimum of 10% and a maximum of 100%: `(display myfile.txt 25%x100%)`. These can be mixed with integers: `(display myfile.txt 500x100%)`.

    You can use `full` in place of 100%: `(display myfile.txt 500xfull)` displays a 500pt-wide window the full height of the display.

__Window Position__

: Set a location on the screen using either coordinates or words. The format is X,Y (no space around comma), e.g. `(display myfile.html 800x800 left,center)`. 
    
    You can mix integers and words, e.g. : `(display myfile.html 500x900 right,800)`
    
    __Available options:__

    __integer__: X points from origin. 0,0 is the bottom left corner of your screen, and the measurement is to the lower left corner of the window, so 100,500 puts the left side of the window 100 points from the left of the display, and the bottom of the window 500 points from the bottom of the display.
    
    > Distances are relative to the bottom left corner of the selected display. Unlike setting a frame using AppleScript or other tool, you don't have to calculate the width of the first display and add to it to target the second display. Just set the screen number and base your coordinates off of 0,0.
    
    __left, center, right__: For the X (first) parameter, you can use `left`, `center`, or `right`. These will put the window flush against either side, or centered horizontally. These can be abbreviated as `l`, `c`, and `r`.
    
    __top, center, bottom__: For the Y (second) parameter, you can use `top`, `center`, or `bottom`. These will put the window flush against the top or bottom of the screen, or vertically centered. These can be abbreviated as `t`, `c`, and `b`.

__Background__ and __Foreground__ color

: You can specify a background and foreground color using 3 or 6-character RGB hex codes, starting with `#`. If only one is specified, it becomes the background color, if two are given, it's read as BACKGROUND FOREGROUND.

    When used with text/log files, background and foreground will accurately set the colors of the display. If a foreground color is omitted, a color that contasts the background will be automatically generated.

    With other display types (web, quick look), setting a background color greater than 50% black will cause the window chrome to display in Dark Mode. Foreground color is ignored in these cases.

    Example: `(display myfile.txt 800x600 #000 #eee)`

    When specifying a background for a Quick Look display window (any file type other than text or HTML), you can use `#clear` as the background color to create a transparent window.

__Window Opacity__

: Specify an opacity for the window using `alpha:XX%`. This can be abbreviated as `a:75%`. Opacity must be between 0 and 100. 

    Example: `(display https://youtube.com 800x600 right,top a:90%)`

__Window Level__

: By default the window behaves like any standard window, clicking it brings it to the front, clicking other windows brings them in front of it. You can make it a floating window (nothing can come in front of it), a desktop window (always behind other windows), or a wallpaper window by adding `level:` followed by `floating`, `desktop`, or `wallpaper` at the end of the command. 
`level:` can be abbreviated as `l:`, and the options can be abbreviated to `f` or `float`, `d` or `desk`, and `w` or `wall`. To have it behave as a normal window, leave it empty or use `n` or `normal`.

    A wallpaper level window is not clickable or scrollable and gets no toolbar with close button. Wallpaper windows are closed when the Bunch closes. If you don't have Toggle Bunches enabled, you have to use Close Items In... to close a wallpaper window opened by a Bunch.

    > __Tip:__ As an alternative to the (wallpaper) command, you can simulate a wallpaper change by displaying an image at full width and height and setting it to wallpaper level. While the Bunch is running, it will appear you changed the wallpaper, and it will change back when the Bunch closes.
    > 
    >     (display Desktop.png d:1 100%x100% l,t l:w)
    {:.tip #simulatewallpaper}

__Chrome__

: Make a window "chromeless" with `chrome:none` (or `c:n`) and it will display a window with no title bar or close/zoom buttons. The window is still be resized from the edges and is draggable (see below). Chromeless windows can be closed with {% kbd ⌘W %}.
    
    This setting affects window dragging in the various preview types differently.

    - HTML Windows still get the bottom bar with navigation buttons. The window can be moved by dragging from this bar.
    - Text windows get no chrome, but can still be dragged by clicking where the title bar would normally be and dragging. Resize from window edges.
    - Other preview types get no chrome, and are draggable by clicking anywhere in the window.

    "chrome:none" or "c:n" are the only accepted options. Other syntax will be left in the command and will break the path if unintentional.

    Example `(display my presentation.keynote 600x1000 chrome:none)`

    In Quick Look previews, hovering over the window will display the title and "traffic light" buttons.

__Space__
: Specify `space:all` to cause the window to display on all available spaces, staying stationary when switching spaces. If set to `space:current` or omitted, window displays only on the active space when the Bunch is opened.
: Can be abbreviated as `s:a`.

__User Agent__

: Applies only to web views. By default, if a window has an initial width less than 1024, a mobile user agent string will be sent, indicating to the site that you're on a mobile device. This often provides a better experience for viewing websites in small windows, simulating an phone or tablet screen. There are times you may want to override this, though, and you can do so using `ua:desktop` to force desktop mode, or `ua:mobile` to force mobile.

    In the case of Facebook Messenger, for example, sending a mobile user agent makes the site only offer the option to download the iPhone app. To use Messenger in a display window at a narrow width, add `ua:desktop` to the command.

    Example `(display https://messenger.com ua:desktop)`

    This parameter can be abbreviated as `ua:d` or `ua:m`.

> __Tip:__ Display a "visor" of `system.log` on secondary display as a desktop-level window:
>
> ```bunch
> (display /var/log/system.log d:1 100%x300 left,b #333 #b0d17d a:95% l:d)
> ```
> 
> {% img aligncenter /images/displayvisor-600.jpg 600 375 %}
> 
> The log file will be watched for changes and the window will automatically update, "tailing" the file.
{:.tip}
