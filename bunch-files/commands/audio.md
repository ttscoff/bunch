---
layout: default
title: Audio
parent: Commands
grand_parent: Bunch Files
---
# Audio Commands

Change your system input and output devices, as well as control the volume of either. 

To set an audio device, you just need to specify input or output, and then provide all or a unique part of the name of an existing device (case insensitive, first match wins). For example, `(audio input scarlett)` would set my system input to my Scarlett Solo. `(audio output io hub)` would change my system audio output to my iO Hub. 

The volume command defaults to output volume if `input` or `output` is not specified (e.g. `(audio volume 50)`). Specify input or output before a volume or mute command to affect one channel or the other. `(audio output 0)` will simulate mute --- use `(audio output mute)` to actually mute the channel while preserving volume setting. (All of the preceding commands will work with either `input` or `output`.)

See [Bunch gets audio control](https://brettterpstra.com/2020/09/10/bunch-gets-audio-control/) for more info.

## Examples

```
(audio output Macbook Pro)
(audio output volume 50)
```
