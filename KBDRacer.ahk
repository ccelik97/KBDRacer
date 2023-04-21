I_Icon = KBDRacer.ico
IfExist, %I_Icon%
    Menu, Tray, Icon, %I_Icon%
;return

;; ? FROM: https://www.autohotkey.com/boards/viewtopic.php?p=391598&sid=b225a17ae64d8e7fa5ae600b77b5b6f4#p391598

#InstallKeybdhook
#UseHook On
#MaxHotkeysPerInterval 200 ; ? FROM: https://www.autohotkey.com/board/topic/62512-permanently-turn-off-that-annoying-hotkey-limit/

;; * Pressing both r & Up buttons cancels each other.
;; ?  Throttle/Gas: r (Up cancels it)
;; ?    Hand brake: Space
;; ? Brake/Reverse: Down

~r::
    if(GetKeyState("Up", "p"))
        SendInput {r up}{Up up}
Return

~Up::
    if(GetKeyState("r", "p"))
        SendInput {r up}{Up up}
Return

~r up::
    if(GetKeyState("Up", "p"))
        SendInput {Up down}
Return

~Up up::
    if(GetKeyState("r", "p"))
        SendInput {r down}
Return

;; * Pressing both e & Left/Right buttons or both f & Left/Right buttons cancel each other.
;; ?    Steer left: e (Left or Right cancels it)
;; ?   Steer right: f (Left or Right cancels it)

~e::
    if(GetKeyState("Left", "p"))
        SendInput {e up}{Left up}
    if(GetKeyState("Right", "p"))
        SendInput {e up}{Right up}
Return
~f::
    if(GetKeyState("Left", "p"))
        SendInput {f up}{Left up}
    if(GetKeyState("Right", "p"))
        SendInput {f up}{Right up}
Return

~Left::
    if(GetKeyState("e", "p"))
        SendInput {e up}{Left up}
    if(GetKeyState("f", "p"))
        SendInput {f up}{Left up}
Return
~Right::
    if(GetKeyState("e", "p"))
        SendInput {e up}{Right up}
    if(GetKeyState("f", "p"))
        SendInput {f up}{Right up}
Return

~e up::
    if(GetKeyState("Left", "p"))
        SendInput {Left down}
    if(GetKeyState("Right", "p"))
        SendInput {Right down}
Return
~f up::
    if(GetKeyState("Left", "p"))
        SendInput {Left down}
    if(GetKeyState("Right", "p"))
        SendInput {Right down}
Return

~Left up::
    if(GetKeyState("e", "p"))
        SendInput {e down}
    if(GetKeyState("f", "p"))
        SendInput {f down}
Return
~Right up::
    if(GetKeyState("e", "p"))
        SendInput {e down}
    if(GetKeyState("f", "p"))
        SendInput {f down}
Return

;; ! BSDK