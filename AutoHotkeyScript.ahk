#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

: Left<Alt>Space to Muhenkan
<!Space::Send, {vk1D}

: Right<Alt>Space to Henkan
>!Space::Send, {vk1C}

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
;  IfWinActive,ahk_class SWT_Window0 ; Eclipse
;    Return 1
;   IfWinActive,ahk_class Xming X
;     Return 1
;   IfWinActive,ahk_class SunAwtFrame
;     Return 1
;   IfWinActive,ahk_class Emacs ; NTEmacs
;     Return 1  
;   IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
;     Return 1
  Return 0
}

;<ctrl>[ -> Escape
^[::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Esc}
  Return

;<ctrl>m -> Enter
^m::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Enter}
  Return

^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {End}
  Return

^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Home}
  Return

^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {BS}
  Return

^p::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Up}
  Return

^n::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Down}
  Return

^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Right}
  Return

^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
    Send {Left}
  Return

<!<+]::Send, ^{Tab}
<!<+[::Send, ^+{Tab}