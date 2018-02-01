#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Inet.au3>
#Region ### START Koda GUI section ### Form=C:\Users\super\Desktop\Form1.kxf
$Form1 = GUICreate("Matt Libraries AutoUpdater", 484, 269, 267, 124)
GUISetFont(20, 400, 0, "Yu Gothic UI Light")
$Label1 = GUICtrlCreateLabel("What library do you want installed?", 48, 16, 396, 41)
$Button1 = GUICtrlCreateButton("mattcore.h", 88, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button2 = GUICtrlCreateButton("mattgui.h", 192, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button3 = GUICtrlCreateButton("mattsets.h", 296, 88, 83, 73)
GUICtrlSetFont(-1, 12, 400, 0, "Yu Gothic UI Light")
$Button4 = GUICtrlCreateButton("Open github", 192, 176, 83, 73)
GUICtrlSetFont(-1, 9, 400, 0, "Yu Gothic UI Light")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
#comments-start
StringRegExpReplace($test,"<[^<]*>","")
#comments-end
func download($url,$file)
local $string=_INetGetSource($url)
#comments-start $string = StringRegExpReplace($string,"<[^<]*>","")
#comments-end
FileWrite($file,$string)

   EndFunc
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		 Case $Button1
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattcore.h","mattcore.h")
			EndIf
		 Case $Button2
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattgui.h","mattgui.h")
			EndIf
		 Case $Button3
			local $choice=MsgBox(4,"Confirm","Are you sure? This will download a library which will take up some space and use some mobile data!")
			if($choice==$IDYES) Then
			   download("https://raw.githubusercontent.com/masecla22/libraries/master/mattsets.h","mattsets.h")
			EndIf
		 Case $Button4
			ShellExecute("https://www.github.com/masecla22")
	EndSwitch
WEnd
