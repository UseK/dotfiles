#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
;SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

: Left<Alt>Space to Muhenkan
<!Space::Send, {vk1D}

: Right<Alt>Space to Henkan
>!Space::Send, {vk1C}