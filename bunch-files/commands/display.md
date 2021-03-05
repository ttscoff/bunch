---
layout: default
title: Display
parent: Commands
grand_parent: Bunch Files
---
# Display Commands
{:.no_toc}

The display command is used to open an HTML file, website, or text/log file in a viewer. The command allows for flexible window sizing and positioning. In it's most basic form it's just `display` and a filename:

    (display myfile.html)

If the file is in your Bunch folder, it can be a relative path. The above command would show a 600x600 web view centered on the main display. Read on to learn about the myriad options.

* Table of Contents
{:toc}

## __HTML Files and Websites__

The display command can display HTML files and web URLs. You can provide a full path to a file, or one relative to the current Bunch Folder. For a website, just provide a full URL.

If the file is either a local HTML file (which must have the extension `.html`) or a URL, it will be viewed in a popup web view that floats above all other windows and can be dismissed with either Enter or Escape. It's clickable and scrollable.

This is not a "web browser." You can navigate to links, but there's no back button, no history, no ability to download. It's designed for _displaying_, as the command name indicates. (You _can_, however, right click in the window and choose "Back", so it's not completely crippled).

## __Text Files__

If a file is specified with the extension `.txt` or `.log`, it will be displayed as a text file with a monospaced font. The file is watched for changes and the preview will automatically update. The preview will "tail" the file, always scrolling to the end when it changes.

ANSI escape codes are recognized and rendered. If the file you're watching contains escape codes, it's wise to set a background color appropriate for the display of the codes. See below for details on adding colors.

As an example, if your Bunch triggers a shell script that has logging, you can use this command to tail the log in a floating or desktop-level window.

> Note that if you want to preview Markdown or other text markup as HTML files, you should render it to HTML using your processor of choice. Point the `display` command to the resulting HTML file. That file will be watched for updates, so if you have a script running that refreshes the file, the preview will also refresh.
{:.tip}

## __Other File Types__

If the file is any kind other than HTML, it will be viewed using a Quick Look preview. This panel will appear above all open windows, but will not float so it can be hidden by other windows as new apps launch.

Quick Look previews can not be sized or positioned.


> This command was primarily created so I could show some welcome documentation, but it grew from there. Now you can use it to display a local log file, the image output of a shell script, or load up a website that you want to have floating while you work (or play). The latter is the most likely use for the average user. Bunch will store logins between launches, so once you've logged into a service like Facebook for messaging or Clockodo for time tracking, you can pop up a window when you open a Bunch to have the tools you need at hand, in a floating window, without opening them in your browser.
{:.tip}

## __Customizing the Window__

You can define which display to open the window on, what size it should be, what position on the screen, foreground and background colors (for text files), and set the window's opacity. The following parameters must be in the order `FILE/URL SCREEN SIZE POSITION BACKGROUND FOREGROUND OPACITY LEVEL`. Any of these may be omitted. Each specified parameter must be preceded by a space.

A display command that uses every option would look like the below. This command displays a text file as a desktop-level "visor" (full-width window at stuck to the top of the scrreen) on the second display with a light-on-dark color scheme and slight transparency.

    (display myfile.txt 1 500x100% left,top #111111 #efefef 95% desktop)

__Screen__
: By default the display window will open on the screen that has the menu bar when the Bunch is opened.

: You can specify that the window open on any connected display. Displays are numbered from left to right, starting at zero. Your leftmost display will be 0, counting up as you move to the right. The command expects a single digit between 0 and 9. (If you have more than 10 displays, I have some followup questions.)

: If you specify a screen number higher than the number of attached displays, your main display will be assumed. This means that you can specify a display that isn't always available, and Bunch will use it when it is, but default to your primary display when it's not.

: To put a centered window on your second monitor: `(display myfile.html 1 800x800)`

__Window Size__

: You can also append a size parameter in the form of WxH, e.g. `(display myfile.html 800x600)`. If this is omitted a default size will be assigned.

: You can also specify these as percents, with a minimum of 10% and a maximum of 100%: `(display myfile.txt 25%x100%)`. These can be mixed with integers: `(display myfile.txt 500x100%)`.

: You can also use `full` in place of 100%: `(display myfile.txt 500xfull)` displays a 500pt-wide window the full height of the display.

__Window Position__

: You can also set a location on the screen, either using coordinates or words. The format is X,Y (no space around comma) and must come _after_ any specified size, e.g. `(display myfile.html 800x800 left,center)`. 
: You can mix integers and words, e.g. : `(display myfile.html 500x900 right,800)`
: __Available options:__
: __integer__: X points from origin. 0,0 is the bottom left corner of your screen, and the measurement is to the lower left corner of the window, so 100,500 puts the left side of the window 100 points from the left of the display, and the bottom of the window 500 points from the bottom of the display.
: Distances are relative to the bottom left corner of the selected display. Unlike setting a frame using AppleScript or other tool, you don't have to calculate the width of the first display and add to it to target the second display. Just set the screen number and base your coordinates off of 0,0.
: __left, center, right__: For the X (first) parameter, you can use `left`, `center`, or `right`. These will put the window flush against either side, or centered horizontally. These can be abbreviated as `l`, `c`, and `r`.
: __top, center, bottom__: For the Y (second) parameter, you can use `top`, `center`, or `bottom`. These will put the window flush against the top or bottom of the screen, or vertically centered. These can be abbreviated as `t`, `c`, and `b`.

__Background__ and __Foreground__ color

: You can specify a background and foreground color using 3 or 6-character RGB hex codes, starting with `#`. If only one is specified, it becomes the background color, if two are given, it's read as BACKGROUND FOREGROUND.

: Background and Foreground color are only used when displaying text files. They will have no effect on other file types.

: Example: `(display myfile.txt 800x600 #000 #eee)`

__Window Opacity__

: You can specify an opacity for the window by appending XX% at the end of the command. Opacity must be between 0 and 100. Example: `(display https://youtube.com 800x600 right,top 90%)`

__Window Level__

: By default the window behaves like any standard window, clicking it brings it to the front, clicking other windows brings them in front of it. You can make it a floating window (nothing can come in front of it), a desktop window (always behind other windows), or a wallpaper window by adding `floating`, `desktop`, or `wallpaper` at the end of the command. These can be abbreviated to `f` or `float`, `d` or `desk`, and `w` or `wall`. To have it behave as a normal window, leave it empty or use `n` or `normal`.

: A wallpaper level window is not clickable or scrollable and gets no toolbar with close button. Desktop windows are closed when the Bunch closes. If you don't have Toggle Bunches enabled, you have to use Close Items In... to close a Desktop window opened by a Bunch.


> __Tip:__ Display a "visor" of `system.log` on secondary display as a wallpaper-level window:
> 
>     (display /var/log/system.log 1 100%x300 left,b #333 #b0d17d 95% w)
> 
> {% img aligncenter /images/displayvisor-600.jpg 600 375 %}
{:.tip}
