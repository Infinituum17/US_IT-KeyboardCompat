#Requires AutoHotkey v2.0

; Only one instance can run at the same time
#SingleInstance

Tray := A_TrayMenu
A_IconTip := "Keyboard Compat (US-IT)"

; Removing all the tray default options on right-click
Tray.Delete()

; Adding Credits
Tray.Add("Credits", CreditsCallback)

; Adding back an exit option
Tray.Add("Exit", (ItemName, ItemPos, TrayMenu) => ExitApp)

; Registering all *hardcoded* keyboard combinations
<^<!<+a:: Send("À")
<^<!a:: Send("à")
<^<!<+e:: Send("È")
<^<!e:: Send("è")
<^<!<+i:: Send("Ì")
<^<!i:: Send("ì")
<^<!<+o:: Send("Ò")
<^<!o:: Send("ò")
<^<!<+u:: Send("Ù")
<^<!u:: Send("ù")
>^>!>+e:: Send("É")
>^>!e:: Send("é")
>^>!>+u:: Send("Ú")
>^>!u:: Send("ú")

CreditsCallback(ItemName, ItemPos, TrayMenu) {
    credits := Gui.Call("+AlwaysOnTop", ItemName)

    credits.SetFont("s10")
    credits.AddLink(, 'Author: <a href="https://github.com/Infinituum17/">Infinituum17</a>')
    credits.AddLink(, 'GitHub repository: <a href="https://github.com/Infinituum17/US_IT-KeyboardCompat">US_IT-KeyboardCompat</a>')
    credits.AddLink(, 'License: <a href="https://github.com/Infinituum17/US_IT-KeyboardCompat/blob/main/LICENSE">MIT</a>')
    okButton := credits.AddButton("w80 x200 y95", "OK")

    okButton.OnEvent("Click", (GuiCtrlObj, Info, Href?) => credits.Destroy())

    credits.Show("Center w300 h140")
}