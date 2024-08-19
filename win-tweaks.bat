@echo off
echo Disable any unnecessary apps from launching on start up. Close Task Manager when you are finished.
taskmgr /0 /startup
powercfg -SetActive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy /v LetAppsRunInBackground /t REG_DWORD /d 2 /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Dsh /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
sc config "WSearch" start= disabled
sc config "DiagTrack" start= disabled
sc config "SysMain" start= disabled
sc config "CertPropSvc" start= disabled
sc config "MapsBroker" start= disabled
sc config "Fax" start= disabled
sc config "iphlpsvc" start= disabled
sc config "MsKeyboardFilter" start= disabled
sc config "WpcMonSvc" start= disabled
sc config "TabletInputService" start= disabled
sc config "wisvc" start= disabled
sc config "XboxGipSvc" start= disabled
sc config "XblAuthManager" start= disabled
sc config "XblGameSave" start= disabled
sc config "XboxNetApiSvc" start= disabled

rem setting the dns ip will result in issues later with user name resolution. 
rem netsh interface ip set dns "Ethernet" static 1.1.1.1
rem netsh interface ip set dns "Wi-Fi" static 1.1.1.1
rem netsh interface ip add dns "Ethernet" 1.0.0.1 INDEX=2
rem netsh interface ip add dns "Wi-Fi" 1.0.0.1 INDEX=2
pause