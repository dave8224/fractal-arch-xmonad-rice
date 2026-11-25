import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageHelpers (isInProperty)
import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
import XMonad.Layout.Spacing (spacingRaw, Border(..))
import XMonad.Util.SpawnOnce (spawnOnce)
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit (exitSuccess)

main :: IO ()
main = xmonad $ ewmh def
    { terminal = "alacritty"
    , modMask = mod4Mask
    , borderWidth = 2
    , manageHook = (isInProperty "WM_CLASS" "polybar" --> doIgnore) <+> manageDocks <+> manageHook def
    , layoutHook = avoidStruts myLayout
    , startupHook = spawnOnce "$HOME/.config/xmonad/autostart.sh"
    , keys = \c -> M.union (myKeys c) (keys def c)
    }

myKeys c = M.fromList
    [ ((mod4Mask, xK_Return), spawn "alacritty")
    , ((mod4Mask, xK_d), spawn "rofi -show drun")
    , ((mod4Mask, xK_b), spawn "firefox")
    , ((mod4Mask .|. shiftMask, xK_b), spawn "firefox")
    , ((mod4Mask, xK_e), spawn "dolphin")
    , ((mod4Mask, xK_c), kill)
    , ((mod4Mask, xK_q), io exitSuccess)
    , ((mod4Mask .|. shiftMask, xK_r), spawn "xmonad --restart")
    ]


-- 8px outer gaps, 12px between windows
myLayout = spacingRaw True (Border 8 8 8 8) True (Border 6 6 6 6) True
           $ layoutHook def
