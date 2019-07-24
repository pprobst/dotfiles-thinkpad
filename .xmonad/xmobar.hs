-------------------
-- xmobar config --
-------------------

Config {
    position = Top,
    --font = "xft:Iosevka:size=10,M+ 1p:style=regular:size=10:antialias=true,Siji:size=10:antialias=true", -- (siji is converted to ttf!)
    font = "xft:cherry:size=9,Fixed:style=ja:size=10,Siji:size=10",
    bgColor = "#FEF6FB",
    fgColor = "#3F3051",
    alpha = 255,
    border = BottomB,
    borderColor = "#EBD7E4",
    borderWidth = 1,
    lowerOnStart = True,
    overrideRedirect = True,
    allDesktops = True,
    persistent = False,
    commands = [
        Run Cpu [
            --"-t", "<fc=#AA7158></fc> <total>%",
            "-t", "<fc=#AC88B7>cpu</fc> <total>%",
            "-L", "10",
            "-H", "70",
            "-h", "#C83737"
            ] 10,
        Run CoreTemp [
            --"-t", "<fc=#AA7158></fc> <core0>°C",
            "-t", "<fc=#AC88B7>temp</fc> <core0>°C",
            "-L", "40", "-H", "75",
            "-h", "#C83737"
            ] 10,
        Run Memory [
            --"-t","<fc=#AA7158></fc> <usedratio>%",
            "-t","<fc=#AC88B7>mem</fc> <usedratio>%",
            "-H","3000","-h","#C83737"
            ] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp3s0" [
            --"-t","<fc=#AA7158></fc> <quality>%"
            "-t","<fc=#AC88B7>wifi</fc> <quality>%"
            ] 10,
        --Run Date "<fc=#AA7158></fc> <fc=#D5C3B9>%F</fc> <fc=#AA7158></fc> <fc=#D5C3B9>%H:%M</fc>" "date" 10,
        Run Date "<fc=#3F3051>%F</fc> <fc=#3F3051>%H:%M</fc>" "date" 10,
        --Run Com "getMasterVolume" [] "volumelevel" 1,
        Run Com "getMasterVolumeNoIcons" [] "volumelevel" 1,
        Run Com "getRedshift" [] "redshift" 60,
        --Run Com "getBattery" [] "bat" 10,
        Run Com "getBatteryNoIcons" [] "bat" 10,
        Run Battery [ -- substituted by my own script
            "-t", "<acstatus> <left>%",
            "-L", "15", "-H", "60",
            "--",
            "-O", "<fc=#AA7158></fc>",
            "-i", "<fc=#AA7158></fc>",
            "-o", "<fc=#AA7158></fc>",
            "-l", "<fc=#C83737></fc>"
            ] 10,
        --Run Alsa "default" "Master" [],
        Run StdinReader
        ],
    sepChar = "%",
    alignSep = "**",
    template = "%StdinReader% ** %volumelevel% %bat% %cpu% %coretemp% %memory% %wlp3s0wi% <fc=#AC88B7>[</fc> <fc=#3F3051>%date%</fc> <fc=#AC88B7>]</fc> %getRedshift%"
}
