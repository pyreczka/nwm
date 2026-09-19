Option Explicit

Const TARGET_URL = "http://127.0.0.1:2137/ll.html"

Dim browser, shell, fileSystem, scriptFolder, serverLauncher
Set shell = CreateObject("WScript.Shell")
Set fileSystem = CreateObject("Scripting.FileSystemObject")
scriptFolder = fileSystem.GetParentFolderName(WScript.ScriptFullName)
serverLauncher = """" & scriptFolder & "\showip.bat" & """"
shell.Run serverLauncher, 1, False
WScript.Sleep 1000

On Error Resume Next
Set browser = CreateObject("InternetExplorer.Application")

If Err.Number = 0 Then
	browser.Visible = True
	browser.Navigate2 TARGET_URL

	Do While browser.Busy Or browser.ReadyState <> 4
		WScript.Sleep 250
	Loop

	browser.Document.Title = "Internet Explorer - localhost:2137"
	On Error GoTo 0
Else
	Err.Clear
	shell.Run "msedge.exe " & TARGET_URL, 1, False
	On Error GoTo 0
End If

Set browser = Nothing
Set fileSystem = Nothing
Set shell = Nothing