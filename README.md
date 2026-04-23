# Automated Mouse Clicking Script

A lightweight AutoHotkey (AHK) utility designed to simplify GUI automation by identifying window coordinates and performing automated sequences of clicks.

## Features

* **Coordinate Finder:** Easily identify the relative X/Y coordinates of any UI element.
* **Window-Specific Logic:** Actions are restricted to specific windows (e.g., LabView/MWT.vi) to prevent accidental clicks.
* **Relative Positioning:** Uses coordinates relative to the active window, ensuring the script works even if you move the window on your screen.

---

## Hotkeys

### 1. Identify Coordinates (`Alt + Y`)
* **Action:** Hover your mouse over the target area and press `ALT` + `Y`.
* **Result:** A tooltip appears for 10 seconds showing:
    * X and Y coordinates.
    * Window Title and ID.
    * Window Class and Control information.
* **Purpose:** Use this to gather the coordinates needed for your automation.

### 2. Run Click Sequence (`Alt + X`)
* **Action:** Press `ALT` + `X`.
* **Result:** The script automatically:
    1. Activates the "MWT.vi" window and clicks at `900, 126`.
    2. Activates the "COM5" window and clicks at `558, 45`.
* **Condition:** This hotkey only triggers if both "MWT.vi" and "COM5" windows are currently open.

---

## Requirements

* [AutoHotkey](https://www.autohotkey.com/) (v1.1 or higher)
* Windows OS

## Customization

To adapt the script for other programs, open the `.ahk` file and edit the following lines:
* `#IfWinExist`: Change this to your target window title.
* `WinActivate`: Match this with the window you want to bring to the foreground.
* `Click, X, Y`: Update the coordinates using the values found via the `Alt + Y` tool.

---
*Created by Dennis Rentsch (né Vettkötter)*
