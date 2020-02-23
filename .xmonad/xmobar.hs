-------------------
-- xmobar config --
-------------------

Config {
    position = Top,
    font = "xft:Go Mono:size=9,M+ 1p:style=regular:size=9:antialias=true,Siji:size=10:antialias=true", -- (siji is converted to ttf!)
    --font = "xft:cherry:size=9,hlv:style=Regular:size=10,Siji:size=10",
    bgColor = "#222222",
    fgColor = "#FAFAFA",
    alpha = 255,
    border = BottomB,
    borderColor = "#222222",
    borderWidth = 1,
    lowerOnStart = True,
    overrideRedirect = True,
    allDesktops = True,
    persistent = False,
    commands = [
        Run Cpu [
            --"-t", "<fc=#AA7158></fc> <total>%",
            "-t", "<fc=#A6B0D4>cpu</fc> <total>%",
            "-L", "10",
            "-H", "80",
            "-h", "#C83737"
            ] 10,
        Run MultiCoreTemp [
            --"-t", "<fc=#AA7158></fc> <core0>°C",
            "-t", "<fc=#A6B0D4>temp</fc> <avg>°C",
            "-L", "40", "-H", "80",
            "-h", "#C83737"
            ] 10,
        Run Memory [
            --"-t","<fc=#AA7158></fc> <usedratio>%",
            "-t","<fc=#A6B0D4>mem</fc> <usedratio>%",
            "-H","3000","-h","#C83737"
            ] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp3s0" [
            --"-t","<fc=#AA7158></fc> <quality>%"
            "-t","<fc=#A6B0D4>wifi</fc> <quality>%"
            ] 10,
        --Run Date "<fc=#AA7158></fc> <fc=#D5C3B9>%F</fc> <fc=#AA7158></fc> <fc=#D5C3B9>%H:%M</fc>" "date" 10,
        Run Date "<fc=#FAFAFA>%F</fc> <fc=#FAFAFA>%H:%M</fc>" "date" 10,
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
    template = "%StdinReader% ** %volumelevel% %bat% %cpu% %multicoretemp% %memory% %wlp3s0wi% <fc=#A6B0D4>[</fc> <fc=#A6B0D4>%date%</fc> <fc=#A6B0D4>]</fc> %getRedshift%"
}
