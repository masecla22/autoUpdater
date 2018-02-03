#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Inet.au3>
#RequireAdmin
#Region ### START Koda GUI section ### Form=C:\Users\super\Desktop\Form1.kxf
$Form1_1 = GUICreate("Matt Libraries AutoUpdater", 484, 279, 330, 135)
GUISetFont(20, 400, 0, "Yu Gothic UI Light")
$Label1 = GUICtrlCreateLabel("What library do you want installed?", 48, 16, 396, 41)
$Button1 = GUICtrlCreateButton("mattcore.h", 88, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button2 = GUICtrlCreateButton("mattgui.h", 192, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button3 = GUICtrlCreateButton("mattsets.h", 296, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button4 = GUICtrlCreateButton("Open github", 128, 176, 83, 73)
GUICtrlSetFont(-1, 9, 400, 0, "Yu Gothic UI Light")
$Button5 = GUICtrlCreateButton("Install All", 232, 176, 83, 73)
GUICtrlSetFont(-1, 9, 400, 0, "Yu Gothic UI Light")
$Checkbox1 = GUICtrlCreateCheckbox("Install in CodeBlocks", 328, 232, 129, 17)
GUICtrlSetFont(-1, 9, 400, 0, "Yu Gothic UI Light")
$Label2 = GUICtrlCreateLabel("Requires Admin!", 352, 248, 86, 19)
GUICtrlSetFont(-1, 9, 400, 0, "Yu Gothic UI Light")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
#comments-start
StringRegExpReplace($test,"<[^<]*>","")
#comments-end
Func _GetNetworkConnect()
    Local Const $NETWORK_ALIVE_LAN = 0x1  ;net card connection
    Local Const $NETWORK_ALIVE_WAN = 0x2  ;RAS (internet) connection
    Local Const $NETWORK_ALIVE_AOL = 0x4  ;AOL

    Local $aRet, $iResult

    $aRet = DllCall("sensapi.dll", "int", "IsNetworkAlive", "int*", 0)

    If BitAND($aRet[1], $NETWORK_ALIVE_LAN) Then $iResult &= "LAN connected" & @LF
    If BitAND($aRet[1], $NETWORK_ALIVE_WAN) Then $iResult &= "WAN connected" & @LF
    If BitAND($aRet[1], $NETWORK_ALIVE_AOL) Then $iResult &= "AOL connected" & @LF

    Return $iResult
EndFunc
func download($url,$file,$onOrOff)
local $string=_INetGetSource($url)

if($onOrOff==1) Then
   if(FileExists("C:\Program Files (x86)\CodeBlocks\MinGW\include"&"\"&$file)) Then
	  local $choiiice=MsgBox(4,"Warning!","This will overwrite the current library! Procced?")
	  if($choiiice==$IDYES) Then
		 FileDelete("C:\Program Files (x86)\CodeBlocks\MinGW\include"&"\"&$file)
		 FileWrite("C:\Program Files (x86)\CodeBlocks\MinGW\include"&"\"&$file,$string)
	  Else
		 MsgBox(0,"Failed!","Operation failed!")
	  EndIf
   Else
	  FileWrite("C:\Program Files (x86)\CodeBlocks\MinGW\include"&"\"&$file,$string)
   EndIf
EndIf
if($onOrOff==4) Then
   if(FileExists($file)) Then
	  local $chh=MsgBox(4,"Warning!","This will overwrite the current library! Procced?")
	  if($chh==$IDYES) Then
		 FileDelete($file)
		 FileWrite($file,$string)
	  Else
		 MsgBox(0,"Failed!","Operation failed!")
	  EndIf
   Else
	  FileWrite($file,$string)
   EndIf
EndIf
   EndFunc
$connect = _GetNetworkConnect()
$connect=1
If $connect Then
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button1
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   $chhoice=GUICtrlRead($Checkbox1)
			  download("https://raw.githubusercontent.com/masecla22/libraries/master/mattcore.h","mattcore.h",$chhoice)
			   MsgBox(0,"Completed","Operation completed!")
			EndIf
		 Case $Button2
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   $chhoice=GUICtrlRead($Checkbox1)
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattgui.h","mattgui.h",$chhoice)
			   MsgBox(0,"Completed","Operation completed!")
			EndIf
		 Case $Button3
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   $chhoice=GUICtrlRead($Checkbox1)
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattsets.h","mattsets.h",$chhoice)
			   MsgBox(0,"Completed","Operation completed!")
			EndIf
		 Case $Button4
			ShellExecute("https://www.github.com/masecla22")
		 Case $Button5
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   $chhoice=GUICtrlRead($Checkbox1)
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattgui.h","mattgui.h",$chhoice)
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattsets.h","mattsets.h",$chhoice)
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattcore.h","mattcore.h",$chhoice)
			   MsgBox(0,"Completed","Operation completed!")
			EndIf

	EndSwitch
 WEnd
 Else
	GUISetState(@SW_HIDE)
    MsgBox(48, "Warning", "No Internet Connection Detected!")
EndIf
