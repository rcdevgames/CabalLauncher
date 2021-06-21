#RequireAdmin
#NoTrayIcon
#Region
#AutoIt3Wrapper_icon=cabal.ico
#AutoIt3Wrapper_outfile=cabal.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Description=Cabal Launcher
#AutoIt3Wrapper_Res_LegalCopyright=RCDevGames
#EndRegion
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#Include <File.au3>
#Include <Array.au3>
#include <IE.au3>
#include <String.au3>
#include <include\ControlHover.au3>
 if FileExists(@ScriptDir & "\cabalmain.exe") = 0 Then
	 MsgBox(0, "Error", "Cannot find cabalmain.exe")
	 Exit
 EndIf
$REGURL   = IniRead (@ScriptDir & "\Launcher\config.ini", "config", "register", "" )
$EVENTURL = IniRead (@ScriptDir & "\Launcher\config.ini", "config", "event", "" )
$WEBURL   = IniRead (@ScriptDir & "\Launcher\config.ini", "config", "webpage", "" )
$LAUNCHER = IniRead (@ScriptDir & "\Launcher\config.ini", "config", "launcher", "" )
$updateurl = IniRead (@ScriptDir & "\Launcher\config.ini", "config", "updateurl", "" )
$mainversion  = FileGetVersion(@ScriptDir & "\" & "cabalmain.exe", "FILEVERSION")
$Getit = InetGet ($updateurl & "config.ini", @ScriptDir & "\Launcher\server.ini")
$servversion  = IniRead (@ScriptDir & "\Launcher\server.ini", "config", "version", "" )
if FileExists(@ScriptDir & "\Launcher\server.ini") Then
   FileDelete(@ScriptDir & "\Launcher\server.ini")
EndIf
$TITLE = "Cabal Luncher"
$HEIGHT = "481"
$WIDTH = "770"
#Region ### START Koda GUI section ### Form=
$MAIN2 = GUICreate($TITLE, $WIDTH, $HEIGHT, (@DesktopWidth / 2) - 400, (@DesktopHeight / 2) - 300, BitOR($WS_SYSMENU,$WS_POPUP,$WS_CLIPSIBLINGS), $WS_EX_LAYERED)
GUISetIcon(@ScriptDir & "\Launcher\Data\FAVICON.LIF")
$CLOSE = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\CNORMAL.LIF", 745, 9, 15, 15, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$MINIMIZE = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\MNORMAL.LIF", 726, 9, 15, 15, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$START = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\SNORMAL.LIF", 574, 401, 171, 40, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$REG = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\REGISTER.LIF", 665, 9, 43, 11, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$EVENT = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\EVENT.LIF", 601, 9, 32, 9, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$WEB = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\WEBPAGE.LIF", 516, 8, 45, 10, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$CHECKFILES = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\CFN.LIF", 575, 444, 79, 16, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$OPTIONS = GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\ONORMAL.LIF", 670, 444, 62, 16, BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS))
$PROGRESS1 = GUICtrlCreateProgress(97, 407, 400, 5)
$PROGRESS2 = GUICtrlCreateProgress(97, 430, 400, 5)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$PERCENT1 = GUICtrlCreateLabel("0%", 516, 407, 25, 9, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, 0x404040)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$PERCENT2 = GUICtrlCreateLabel("0%", 516, 430, 25, 9, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, 0x404040)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$LABEL1 = GUICtrlCreateLabel("Update completed.", 96, 447, 350, 17, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, 0x404040)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$LABEL2 = GUICtrlCreateLabel("0/0Kb", 518, 447, 30, 17, BitOR($SS_RIGHT,$SS_CENTERIMAGE))
GUICtrlSetColor(-1, 0x404040)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$LABEL3 = GUICtrlCreateLabel("By RCDevGames", 670, 465, 85, 10, $SS_CENTERIMAGE)
GUICtrlSetColor(-1, 0x404040)
GUICtrlSetBkColor(-1, 0x0D0E0F)
$MAIN = ObjCreate("Shell.Explorer.2")
GUICtrlCreateObj($MAIN, 2, 26, 764, 357)
GUICtrlCreatePic(@ScriptDir & "\Launcher\Data\BACKMAIN.LIF", 0, 0, $WIDTH, $HEIGHT,  BitOR($SS_NOTIFY,$WS_GROUP,$WS_CLIPSIBLINGS), $GUI_WS_EX_PARENTDRAG)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFFFF00)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUISetState(@SW_SHOW)
$MAIN.Navigate($LAUNCHER)
#EndRegion ### END Koda GUI section ###
_ControlHover(2, "", $CLOSE)
_ControlHover(2, "", $MINIMIZE)
_ControlHover(2, "", $REG)
_ControlHover(2, "", $START)
_ControlHover(2, "", $EVENT)
_ControlHover(2, "", $CHECKFILES)
_ControlHover(2, "", $OPTIONS)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
	_CheckHoverAndPressed()
WEnd

Func _CheckHoverAndPressed()

	$CtrlId = _ControlHover(0)
	$tempID = @extended
	If $CtrlId = 1 Then
		_HoverFound($tempID)
	ElseIf $CtrlId = 0 Then
		_HoverLost($tempID)
	EndIf

	$CtrlId2 =  _ControlHover(1)
	$tempID2 = @extended
	If $CtrlId2 = 1 Then
		_ButtonPressed($tempID2)
	ElseIf $CtrlId2 = 0 Then
		_ButtonReleased($tempID2)
	EndIf

EndFunc

Func _HoverFound($ControlID)
	Switch $ControlID
		Case $CLOSE
			GUICtrlSetImage($CLOSE, @ScriptDir & "\Launcher\Data\COVER.LIF")
		Case $MINIMIZE
			GUICtrlSetImage($MINIMIZE, @ScriptDir & "\Launcher\Data\MOVER.LIF")
		Case $START
			GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SOVER.LIF")
	    Case $CHECKFILES
			GUICtrlSetImage($CHECKFILES, @ScriptDir & "\Launcher\Data\CFO.LIF")
	    Case $OPTIONS
			GUICtrlSetImage($OPTIONS, @ScriptDir & "\Launcher\Data\OOVER.LIF")
	EndSwitch
EndFunc

Func _HoverLost($ControlID)
	Switch $ControlID
		Case $CLOSE
			GUICtrlSetImage($CLOSE, @ScriptDir & "\Launcher\Data\CNORMAL.LIF")
		Case $MINIMIZE
			GUICtrlSetImage($MINIMIZE, @ScriptDir & "\Launcher\Data\MNORMAL.LIF")
		Case $START
			GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SNORMAL.LIF")
	    Case $CHECKFILES
			GUICtrlSetImage($CHECKFILES, @ScriptDir & "\Launcher\Data\CFN.LIF")
	    Case $OPTIONS
			GUICtrlSetImage($OPTIONS, @ScriptDir & "\Launcher\Data\ONORMAL.LIF")
	EndSwitch
EndFunc

Func _ButtonPressed($ControlID)
	Switch $ControlID
		Case $CLOSE
			GUICtrlSetImage($CLOSE, @ScriptDir & "\Launcher\Data\COVER.LIF")
			Exit
		Case $MINIMIZE
			GUICtrlSetImage($MINIMIZE, @ScriptDir & "\Launcher\Data\MOVER.LIF")
			GUISetState(@SW_MINIMIZE)
		Case $REG
			GUICtrlSetImage($REG, @ScriptDir & "\Launcher\Data\REGISTER.LIF")
			ShellExecute($REGURL)
		Case $EVENT
			GUICtrlSetImage($EVENT, @ScriptDir & "\Launcher\Data\EVENT.LIF")
			ShellExecute($EVENTURL)
		Case $WEB
			GUICtrlSetImage($WEB, @ScriptDir & "\Launcher\Data\WEBPAGE.LIF")
			ShellExecute($WEBURL)
	    Case $CHECKFILES
			GUICtrlSetImage($CHECKFILES, @ScriptDir & "\Launcher\Data\CFO.LIF")
			MsgBox(0, "Info", "not working")
	    Case $OPTIONS
			GUICtrlSetImage($OPTIONS, @ScriptDir & "\Launcher\Data\OOVER.LIF")
			MsgBox(0, "Info", "not working")
		Case $START
			GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SNORMAL.LIF")
			ShellExecute("cabalmain.exe", "akita")
			FileRecycle("*.RPT")
			FileRecycle("*.rpt")
			if @error Then
				MsgBox(16,"Error", "Cannot execute [cabalmain.exe]. It seems you have incorrect client!")
				Exit
			Else
				Exit
			EndIf
	EndSwitch
EndFunc

Func _ButtonReleased($ControlID)
	Switch $ControlID
		Case $CLOSE
			GUICtrlSetImage($CLOSE, @ScriptDir & "\Launcher\Data\CNORMAL.LIF")
		Case $MINIMIZE
			GUICtrlSetImage($MINIMIZE, @ScriptDir & "\Launcher\Data\MNORMAL.LIF")
		Case $START
			GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SNORMAL.LIF")
	    Case $CHECKFILES
			GUICtrlSetImage($CHECKFILES, @ScriptDir & "\Launcher\Data\CFN.LIF")
	    Case $OPTIONS
			GUICtrlSetImage($OPTIONS, @ScriptDir & "\Launcher\Data\ONORMAL.LIF")
	EndSwitch
EndFunc

Func _CheckGameUpdate()
    if FileExists(@ScriptDir & "\Launcher\patch.exe") Then
	   FileDelete(@ScriptDir & "\Launcher\patch.exe")
    EndIf
	$GAMEVERSION1 = $mainversion
	$GAMEVERSION2 = $servversion
	if $GAMEVERSION1 > $GAMEVERSION2 or $GAMEVERSION1 < $GAMEVERSION2 Then
		GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\UPDATE.LIF")
		GUICtrlSetState($START, $GUI_DISABLE)
		GUICtrlSetData($LABEL1, "New updates available!...")
		Sleep(1000)
		$array = _StringExplode($servversion, ".", 0)
		$patch = $updateurl & "update" & $array[3] & ".exe"
		$getupdate = InetGet($patch, "Launcher\patch.exe", 1, 1)
		$PATCHSIZE = InetGetInfo($getupdate, 1)
		FileWrite(@ScriptDir & "\launcher\update",  "Client is updating!...")
		While (InetGetInfo ($getupdate,3) = False)
			$dlinfo = InetGetInfo($getupdate)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit
			EndSwitch
			GUICtrlSetData($LABEL1, "Downloading: " & Int($dlinfo[0]/$dlinfo[1] * 100) & "%")
			GUICtrlSetData($LABEL2, Round($dlinfo[0]/1024) & "/" & Round($dlinfo[1] / 1024) & "Kb")
			GUICtrlSetData($PROGRESS1, Int($dlinfo[0]/$dlinfo[1] * 100))
			GUICtrlSetData($PERCENT1, Int($dlinfo[0]/$dlinfo[1] * 100) & "%")
			Sleep(250)
		WEnd
		GUICtrlSetData($PERCENT1, "100%")
		GUICtrlSetData($LABEL1, "Download finished!")
		GUICtrlSetData($LABEL2, "")
		Sleep(1000)
		if FileExists(@ScriptDir & "\Launcher\patch.exe") Then
		   ShellExecute("Launcher\patch.exe")
		   if @error Then
			  GUICtrlSetData($PROGRESS1, 0)
			  GUICtrlSetData($PROGRESS2, 0)
			  GUICtrlSetData($PERCENT1, "0%")
			  GUICtrlSetData($PERCENT2, "0%")
			  FileWrite(@ScriptDir & "\launcher\update", "update failed")
			  MsgBox(0, "ERROR", "Update failed", 0)
			  exit
		   EndIf
		   GUICtrlSetData($PROGRESS2, 50)
		   GUICtrlSetData($PERCENT2, "50%")
		   While ProcessExists("patch.exe")
			   GUICtrlSetData($LABEL1, "Extracting")
			   Sleep(100)
			   GUICtrlSetData($LABEL1, "Extracting.")
			   Sleep(100)
			   GUICtrlSetData($LABEL1, "Extracting..")
			   Sleep(100)
			   GUICtrlSetData($LABEL1, "Extracting...")
			   Sleep(100)
		   WEnd
		   GUICtrlSetData($PROGRESS2, 100)
		   GUICtrlSetData($PERCENT2, "100%")
		   GUICtrlSetData($LABEL1, "Update completed.")
		   GUICtrlSetData($LABEL2, "-OK-")
		   GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SNORMAL.LIF")
		   GUICtrlSetState($START, $GUI_ENABLE)
		Else
		   GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\UPDATE.LIF")
		   GUICtrlSetState($START, $GUI_DISABLE)
		   GUICtrlSetData($LABEL1, "fail to download server information. restart launcher please.")
		   GUICtrlSetData($LABEL2, "-FAIL-")
		EndIf
		if FileExists(@ScriptDir & "\Launcher\patch.exe") Then
		   FileDelete(@ScriptDir & "\Launcher\patch.exe")
	    EndIf
	 ElseIf $GAMEVERSION1 = $GAMEVERSION2 Then
		GUICtrlSetData($PROGRESS1, 100)
		GUICtrlSetData($PROGRESS2, 100)
		GUICtrlSetData($PERCENT1, "100%")
		GUICtrlSetData($PERCENT2, "100%")
		FileWrite(@ScriptDir & "\launcher\update", "No new patch available..")
		GUICtrlSetImage($START, @ScriptDir & "\Launcher\Data\SNORMAL.LIF")
		GUICtrlSetState($START, $GUI_ENABLE)
		GUICtrlSetData($LABEL1, "Update completed.")
		GUICtrlSetData($LABEL2, "-OK-")
	EndIf
EndFunc