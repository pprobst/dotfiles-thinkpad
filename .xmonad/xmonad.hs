-------------------
-- xmonad config --
-------------------
--
-------------
-- IMPORTS --
-------------
-- Main
import System.IO
import System.Exit
import XMonad

-- Hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops -- required for ueberzug to work

-- Layouts
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns(ThreeCol (ThreeCol, ThreeColMid))
import XMonad.Layout.MultiColumns(multiCol)
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimplestFloat

-- Layout modifiers
import XMonad.Layout.NoBorders
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Spacing

-- Utils
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.SpawnOnce

-- Actions
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote

--import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

------------
-- CONFIG --
------------
--
-- Terminal
myTerminal = "st"

-- Lock screen
myScreensaver = "lock"

-- Screenshot whole screen
myScreenshot = "maimn"

-- Screenshot selected area
myAreaScreenshot = "maims"

-- Program launcher
--myLauncher = "dmenu_run -i -b -fn 'Iosevka:pixelsize=13' -nb '#0E0E0E' -nf '#D5C3B9' -sb '#7F4630' -sf '#D5C3B9'"
myLauncher = "dmenu_run -i -b -fn 'cherry:pixelsize=13' -nb '#0A101B' -nf '#C6AFC7' -sb '#494D76' -sf '#C2D1CF' -p '>'"

-- File manager
myFileManager = "vifmrun"

-- xmobar location
myXmobarrc = "~/.xmonad/xmobar.hs"

-- Workspaces
myWorkspaces = clickable $ [" 一"," 二"," 三"," 四"," 五"," 六"] ++ map show [7..9]
  where clickable l = ["<action=`xdotool key super+" ++ show (n) ++ "`>" ++ ws ++ "</action>" | 
                        (i,ws) <- zip [1..9] l, let n = i ]

------------------------------------------------------------------------

-- Window rules
-- use xprop to find relations!
--
myManageHook = composeAll
    [ resource  =? "desktop_window" --> doIgnore
    , className =? "Gcolor2"        --> doCenterFloat
    , className =? "Steam"          --> doFullFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "pqiv"           --> doCenterFloat
    , className =? "File-roller"    --> doCenterFloat
    , className =? "xarchiver"      --> doCenterFloat
    , className =? "Lxappearance"   --> doCenterFloat
    , className =? "mpv"            --> doFullFloat
    , className =? "crawl-tiles"    --> doFullFloat
    , className =? "Umineko5to8"    --> doFullFloat
    , className =? "deadcells"      --> doFullFloat
    , className =? "PapersPlease"   --> doFullFloat
    , className =? "StreetsOfRogueLinux.x86_64"   --> doFullFloat
    , isDialog --> doCenterFloat
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)]

------------------------------------------------------------------------

-- Colors and borders
--
myNormalBorderColor  = "#1B212E"
myFocusedBorderColor = "#38446C"

titleBarTheme = def
  { activeColor = "#9740f9"
  , activeTextColor = "#9740f9"
  , activeBorderColor = "#9740f9"
  , inactiveColor = "#3f3f3f"
  , inactiveTextColor = "#3f3f3f"
  , inactiveBorderColor = "#3f3f3f"
  , decoHeight = 8
  }

-- Window title color
xmobarTitleColor = "#694B69"

-- Current workspace color
xmobarCurrentWorkspaceColor = "#694B69"

-- Window border width
myBorderWidth = 2

------------------------------------------------------------------------

-- Layouts
--
--titleBar = noFrillsDeco shrinkText titleBarTheme
-- Gaps 4 fags:
--mySpacing = spacingRaw True (Border 2 2 2 2) True (Border 2 2 2 2) True
myLayout = avoidStruts (
    ResizableTall 1 (3/100) (1/2) [] |||
    Grid |||
    multiCol [1] 1 0.01 (-0.5) |||
    ThreeColMid 1 (3/100) (1/2) |||
    simplestFloat |||
    Full)

------------------------------------------------------------------------

-- Key bindings
--
myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

  -- GENERAL --
  --
  -- Start a terminal
  [ ((modMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Lock screen
  , ((modMask, xK_i),
     spawn myScreensaver)

  -- Spawn launcher
  , ((modMask, xK_d),
     spawn myLauncher)

  -- Eat a fortune cookie
  , ((modMask, xK_z),
     spawn "getFortune")

  -- Weather
  , ((modMask, xK_w),
     spawn "getWttr")

  -- Current month
  , ((modMask, xK_c),
     spawn "calendar")

  -- Screenshot whole screen
  , ((0, xK_Print),
     spawn myScreenshot)

  -- Screenshot a selected area
  , ((modMask, xK_Print),
     spawn myAreaScreenshot)

  -- CLI PROGRAMS --
  --
  -- Lauch file manager
  , ((modMask, xK_f),
     spawn (myTerminal ++ " -e " ++ myFileManager ++ " ~"))

  -- MULTIMEDIA KEYS --
  --
  -- Mute vol
  , ((modMask .|. controlMask, xK_m),
     spawn "amixer -q set Master toggle")
  , ((0, 0x1008ff12),
     spawn "amixer -q set Master toggle")

  -- Decrease vol
  , ((modMask .|. controlMask, xK_j),
     spawn "amixer -q set Master 5%- unmute")
  , ((0, 0x1008ff11), 
     spawn "amixer -q set Master 5%- unmute")

  -- Increase vol
  , ((modMask .|. controlMask, xK_k),
     spawn "amixer -q set Master 5%+ unmute")
  , ((0, 0x1008ff13), 
     spawn "amixer -q set Master 5%+ unmute")

  -- Increase brightwness
  , ((0, 0x1008ff02), 
     spawn "xbacklight -inc 10")

  -- Increase brightness
  , ((0, 0x1008ff03), 
     spawn "xbacklight -dec 10")
  
  -- WINDOW RELATED --
  --
  -- Close focused window
  , ((modMask, xK_q),
     kill)

  -- Cycle through layout algorithms
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window
  , ((modMask .|. shiftMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Promote focused window to master
  , ((modMask, xK_BackSpace), 
     promote)

  -- Shrink the master area
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- ResizableTile vertical expand/shrink
  , ((modMask, xK_semicolon),
     sendMessage MirrorExpand)
  , ((modMask, 0xfe51), -- dead acute
     sendMessage MirrorShrink)

  -- Restart xmonad
  , ((modMask .|. shiftMask, xK_q),
     restart "xmonad" True)
  ]

  ++

  -- WORKSPACE RELATED --
  -- 
  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------

-- Startup hook
myStartupHook = do
            spawnOnce "feh --bg-fill /home/probst/Images/Wallpapers/current-thinkpad.png"
            --spawnOnce "feh --bg-tile /home/probst/Images/Wallpapers/current-thinkpad.png"
            setWMName "LG3D"

------------------------------------------------------------------------

-- Run xmonad
main = do
  xmproc <- spawnPipe ("xmobar " ++ myXmobarrc)
  xmonad $ ewmh defaults {
      logHook = dynamicLogWithPP $ xmobarPP {
            ppOutput = hPutStrLn xmproc
          , ppTitle = xmobarColor xmobarTitleColor "" . shorten 30
          , ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
          , ppSep = " : "
      }
      , manageHook = manageDocks <+> myManageHook
      , handleEventHook = docksEventHook
  }

------------------------------------------------------------------------

-- Struct w/ config settings
defaults = def {
    terminal           = myTerminal,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    -- key bindings
    keys               = myKeys,

    -- hooks, layouts
    layoutHook         = smartBorders $ mouseResize $ myLayout,
    manageHook         = myManageHook,
    startupHook        = myStartupHook
}
