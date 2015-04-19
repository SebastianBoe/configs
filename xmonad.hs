import Control.Monad(liftM2)
import Data.Map(fromList)
import Graphics.X11.ExtraTypes.XF86
import System.IO

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.StackSet(greedyView,shift)
import XMonad.Actions.WindowBringer

myWorkspaces = ["1", "2", "3", "4", "5"] ++ map show [6..9]

myModMask = mod4Mask

myManageHook = composeAll
     [ className =? "Opera" --> viewShift "1:web"
     , manageDocks
     ]
     where viewShift = doF . liftM2 (.) greedyView shift

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/boe/.xmonad/xmobarrc"
    xmonad $ defaultConfig
         { manageHook   = myManageHook <+> manageHook defaultConfig
         , layoutHook   = avoidStruts   $  layoutHook defaultConfig
         , modMask      = myModMask
	 , startupHook = setWMName "LG3D"
         , logHook      = dynamicLogWithPP xmobarPP
                              { ppOutput = hPutStrLn xmproc
                              , ppTitle  = xmobarColor "green" "" . shorten 80
                              , ppSep    = " § "
                              , ppCurrent = xmobarColor "black" "green" . pad
                              }
         , terminal     = "xterm"
         , workspaces   = myWorkspaces
         }
         `additionalKeys`
         [((0, xF86XK_MonBrightnessUp),   spawn "xbacklight -inc 10"),
          ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10"),
          ((0, xF86XK_AudioLowerVolume),  spawn "amixer set Master 2-"),
          ((0, xF86XK_AudioRaiseVolume),  spawn "amixer set Master 2+"),
          ((0, xF86XK_Launch1),           spawn "ssh root halt"),
          ((myModMask, xK_p),             spawn "dmenu_run -i -p '>' -nb black -nf white -sb green -sf black"),
	  ((myModMask, xK_o),		  gotoMenu),
	  ((myModMask, xK_i),		  bringMenu)
          ]

