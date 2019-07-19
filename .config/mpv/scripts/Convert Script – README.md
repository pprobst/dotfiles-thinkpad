#README:

This script for mpv intends to offer the fastest and simplest way to convert parts of a video—while you’re watching it and not really more work intensive than making a screenshot. 
A short demonstration:
https://d.maxfile.ro/omdwzyhkoa.webm

##Installation:

You need:
- yad (at least 0.26) ([AUR](https://aur.archlinux.org/packages/yad/))
- mpv (at least 0.4)
- notify-send (optional, to send a notification when the encode is done) (to be found in libnotify on Arch)
- mkvmerge (optional, for stream copy)
- imagemagick (optional, for gifs)
- linux

Install it by putting the script into ~/.config/mpv/scripts/ or ~/.mpv/scripts/ (mpv 0.8+) and ~/.config/mpv/lua/ ~/.mpv/lua/ respectively (mpv 0.4 through 0.7)


##Usage:

``alt + w`` activates the script. First activation marks one end of the clip, the second one the other, order does not matter.

Cropping doesn’t really work well with the OSC. 


##Configuration:

Configuration works in the same way as [configuring the OSC does](http://mpv.io/manual/master/#configuration).
You can bind it to another hotkey in your input.conf with
``<key> script_message convert_script``
and set some options in ``mpv/lua-settings/convert_script.conf`` or with ``--script-opts`` (mpv 0.7 and earlier: ``--lua-opts``)

    audio_bitrate
    Default: 112
    In kbps. The script tries to compensate for audio when going for a file size limit (2pass). You’ll only need to change this if you modify mpv’s audio encoding options, for example with oacopts-add=qscale=0 in the [encoding] section of your mpv.conf (in which case this option would need 64). 

    bitrate_multiplier
    Default: 0.975
    To make sure the file won’t go over the target file size, set it to 1 if you don’t care.

    output_directory
    Default: $HOME
    Where the script saves your converted files. 

    use_pwd_instead
    Default: no
    Use your working directory as the output directory. Overrides output_directory.

    use_same_dir
    Default: no
    Use the directory of the original video file. Overrides output_directory.

    libvpx_threads
    Default: 4
    Number of threads to use for encoding, libvpx only because it apparently doesn’t have auto detection. 

    crop_individually
    Default: yes
    Whether you want only the last crop argument to count—no—or you want to crop all segments individually—yes. In that case the final video will inherit the aspect ratio of the first segment. 

    libvpx_options
    Default: --ovcopts-add=cpu-used=0,auto-alt-ref=1,lag-in-frames=25,quality=good
    Higher quality at the expense of processing time.

    legacy_yad
    Default: no
    If you don’t want to upgrade your yad. Features like appending segments won’t be available. 

    libvpx_fps
    Default: --oautofps
    FPS settings (or any other settings really) for libvpx encoding. Set it to --ofps=24000/1001 for example. 

Warning: Some of these options aren’t very robust and setting them to bogus values will break the script. 