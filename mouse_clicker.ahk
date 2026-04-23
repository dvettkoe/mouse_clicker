#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;===========================================================================================
;
; 		Automated Mouse Clicking Script by Dennis Vettkötter 17.07.2020
;
;===========================================================================================
; Shortcut to find X/Y coordinates of desired screen positions for mouse-click shortcut.
; Activate window first, move mouse to desired position and press ALT+y. X/Y coordinates and window title will be visible in Tooltip as well as additional informations.
; Tooltip will be present for 10s.
;===========================================================================================
;				Changelog:
;	17.07.2020: v1 - Script basic
;	21.07.2020: v2 - Updated script to relative X/Y coordinates of active window, instead whole screen. By adding CoordMode, Mouse, Relative.
;	24.07.2020: v3 - Added support for swimming assay labview script
;===========================================================================================

!y::
	CoordMode, Mouse, Relative		; Outputs coordinates relative to active window. If window size is not changed, the position of the window does not matter anymore!
	MouseGetPos, xpos, ypos, id, control	; Command for displaying X/Y coordinates of mouse cursor.
	WinGetTitle, title, ahk_id %id%		; Command to get Window Title of activated window
	WinGetClass, class, ahk_id %id%		; Command to get Window Class information, might not be necessary to be even displayed.
	ToolTip, X: %xpos% Y: %ypos%`n%title%`nahk_id %id%`nahk_class %class%`nControl: %control%	; Tooltip command.
	SetTimer, RemoveToolTip, -10000		; Timer set to 10s (-1000) for terminating displayed Tooltip
return
	
RemoveToolTip:		; After SetTimer time (10s) this Variable will be executed.
	ToolTip		; Tooltip is removed by simply executing ToolTip command with a blank text parameter.
return


; Shortcut for automated mouse-clicks at desired screen positions. Replace window titles and X/Y coordinates as needed.

#IfWinExist MWT.vi 		; The shortcut will only work, if windows specified here are open already
#IfWinExist COM5	; If programs which should be controlled by automated mouseclicks contain more than one add additional here
; #IfWinExist window title		; "window title" can be found by hovering over the windows task bar or activating the window and pressing the shortcut ALT+y

!x::
	CoordMode, Mouse, Relative
	WinActivate, MWT.vi 		; Activates the window which should be open for first mouse-click
		Click, 900, 126			; X and Y coordinates for the first mouse-click. To get coordinates use ALT+y shortcut at desired position
	WinActivate, COM5	; Activates the window which should be open for second mouse-click
		Click, 558, 45			; X and Y coordinates for the second mouse-click. To get coordinates use ALT+y shortcut at desired position
		
return