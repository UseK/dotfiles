#~/Library/Application Support/Keyhac
#$ ln -s ~/dotfiles/config.py ./
import sys
import os
import datetime
import subprocess

from keyhac import *


def configure(keymap):

    # --------------------------------------------------------------------
    # Text editer setting for editting config.py file

    # Setting with program file path (Simple usage)
    if 1:
        keymap.editor = "MacVim"
        #keymap.editor = "Sublime Text 2"

    # --------------------------------------------------------------------
    # Customizing the display

    # Font
    keymap.setFont( "Osaka-Mono", 16 )

    # Theme
    keymap.setTheme("black")

    # --------------------------------------------------------------------
    # Global keymap which affects any windows
    keymap_global = keymap.defineWindowKeymap()
   
    # Sample of one-shot modifier
    # IME swtiching by Right-Command key
    if 1:
        #keymap_global[ "LCmd-Space" ] = "Ctrl-Shift-Semicolon"  # Move cursor up
        #keymap_global[ "RCmd-Space" ] = "Ctrl-Shift-J"   # Move cursor up
        keymap_global[ "Ctrl-P" ] = "Up"                  # Move cursor up
        keymap_global[ "Ctrl-N" ] = "Down"                # Move cursor down
        keymap_global[ "Ctrl-F" ] = "Right"               # Move cursor right
        keymap_global[ "Ctrl-B" ] = "Left"                # Move cursor left
        keymap_global[ "Ctrl-M" ] = "Enter"               # Move to end of line
        keymap_global[ "Ctrl-OpenBracket" ] = "Esc", "102"
        keymap_global["O-LCmd"] = "102"
        keymap_global["O-RCmd"] = "104"
