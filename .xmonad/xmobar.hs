-------------------
-- xmobar config --
-------------------

Config {
    position = Top,
    font = "xft:Iosevka:size=10,M+ 1p:style=Regular:size=9:antialias=true,Siji:size=11:antialias=true", -- (siji is converted to ttf!)
    --font = "xft:lucy tewi:size=9,mplus hlv:style=Regular:size=9,Siji:size=9",
    fgColor = "#C9B8D1",
    bgColor = "#090F1A",
    alpha = 255,
    border = BottomB,
    borderColor = "#0C121B",
    borderWidth = 1,
    lowerOnStart = True,
    overrideRedirect = True,
    allDesktops = True,
    persistent = False,
    commands = [
        Run Cpu [
            --"-t", "<fc=#38446C></fc> <total>%",
            "-t", "<fc=#494D76>cpu</fc> <total>%",
            "-L", "10",
            "-H", "80",
            "-h", "#C83737"
            ] 10,
        Run MultiCoreTemp [
            --"-t", "<fc=#38446C></fc> <core0>°C",
            "-t", "<fc=#494D76>temp</fc> <avg>°C",
            "-L", "40", "-H", "80",
            "-h", "#C83737"
            ] 10,
        Run Memory [
            --"-t","<fc=#38446C></fc> <usedratio>%",
            "-t","<fc=#494D76>mem</fc> <usedratio>%",
            "-H","3000","-h","#C83737"
            ] 10,
        --Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Wireless "wlp3s0" [
            --"-t","<fc=#38446C></fc> <quality>%"
            "-t","<fc=#494D76>wifi</fc> <quality>%"
            ] 10,
        --Run Date "<fc=#38446C></fc> <fc=#323232>%F</fc> <fc=#7878D1></fc> <fc=#323232>%H:%M</fc>" "date" 10,
        Run Date "<fc=#C9B8D1>%F</fc> <fc=#C9B8D1>%H:%M</fc>" "date" 10,
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
    template = "%StdinReader% ** %volumelevel% %bat% %cpu% %multicoretemp% %memory% %wlp3s0wi% <fc=#494D76>[</fc> <fc=#494D76>%date%</fc> <fc=#494D76>]</fc> %getRedshift%"
}
