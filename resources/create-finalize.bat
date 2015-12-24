@echo off
ECHO create the globalizing script
IF DEFINED PUBLIC (SET AUDESKTOP=%PUBLIC%\Desktop) & (SET AUSTARTMENU=%PROGRAMDATA%\Microsoft\Windows\Start Menu) ELSE (SET AUDESKTOP=%ALLUSERSPROFILE%\Desktop) & (SET AUSTARTMENU=%ALLUSERSPROFILE%\Start Menu)
(
echo @echo off
echo mkdir "%AUSTARTMENU%\Programs\Bauble"
echo copy "%HOMEDRIVE%%HOMEPATH%"\Local\github\Bauble\bauble.classic\scripts\bauble.lnk "%AUSTARTMENU%\Programs\Bauble"
) > devinstall-finalize.bat

ECHO please run devinstall-finalize.bat as administrator.
pause
