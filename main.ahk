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

Result := Msgbox("Kész. Felhasználó: localhost\" . name . "`nJelszó: Klik033442`nKilépés és belépés az új fiókba?", "Kész.", 1)

if Result = "Ok" {
    exit
}
exit

passsave() {
    RunWait "cmd /c savepass.bat"
    return
}