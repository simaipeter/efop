#Requires AutoHotkey >=2.0-
name:=RegExReplace(A_UserName, "([A-Z])", "_$1", &replacecount, -1, 2)
Result := msgbox( "Új felhasználónév: " . name . "`nIndulhat?", "Indulhat?", 1)
if Result = "Cancel" {
    passsave()
    exit
}
RunWait "cmd /c net user " . name . " /add"
RunWait "cmd /c net user " . name . " Klik033442"
RunWait "cmd /c net localgroup rendszergazdák /add " . name
passsave()
Msgbox("Kész, jelentkezz be az új fiókba: localhost\" . name . "`nJelszó: Klik033442")
exit

passsave() {
    RunWait "cmd /c savepass.bat"
    return
}