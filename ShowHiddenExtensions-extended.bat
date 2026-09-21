::                                                                                      ::
::                 ███▄ ▄███▓ ██▓ ██▓ ██▀███   ▄▄▄      ▄▄▄       ██ ▄█▀                ::
::                ▓██▒▀█▀ ██▒▓██▒▓██▒▓██ ▒ ██▒▒████▄   ▒████▄     ██▄█▒                 ::
::                ▓██    ▓██░▒██▒▒██▒▓██ ░▄█ ▒▒██  ▀█▄ ▒██  ▀█▄  ▓███▄░                 ::
::                ▒██    ▒██ ░██░░██░▒██▀▀█▄  ░██▄▄▄▄██░██▄▄▄▄██ ▓██ █▄                 ::
::                ▒██▒   ░██▒░██░░██░░██▓ ▒██▒ ▓█   ▓██▒▓█   ▓██▒▒██▒ █▄                ::
::                ░ ▒░   ░  ░░▓  ░▓  ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░▒▒   ▓▒█░▒ ▒▒ ▓▒                ::
::                ░  ░      ░ ▒ ░ ▒ ░  ░▒ ░ ▒░  ▒   ▒▒ ░ ▒   ▒▒ ░░ ░▒ ▒░                ::
::                ░      ░    ▒ ░ ▒ ░  ░░   ░   ░   ▒    ░   ▒   ░ ░░ ░                 ::
::                       ░    ░   ░     ░           ░  ░     ░  ░░  ░                   ::
::     Title        : ShowHiddenExtensions-extended.bat                                 ::
::     Link         : https://github.com/Miiraak/Show-Hidden-File-Extensions/blob/main/ ::
::     Version      : 1.0                                                               ::
::     Category     : automated/helper                                                  ::
::     Target       : Windows 11                                                        ::
::     Description  : A script to show or hide all hidden file extension in Windows.    ::
::                    require system rights (NT autority\System)                        ::
::                                                                                      ::

@echo off
:: Verify if the script is launched as Administrator.
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo "Requesting administrator privileges..."
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Set the registry key
set key_list=HKEY_CLASSES_ROOT\lnkfile HKEY_CLASSES_ROOT\InternetShortcut HKEY_CLASSES_ROOT\piffile HKEY_CLASSES_ROOT\LibraryFolder HKEY_CLASSES_ROOT\SearchConnectorFolder HKEY_CLASSES_ROOT\SearchFolder HKEY_CLASSES_ROOT\SettingContent HKEY_CLASSES_ROOT\Microsoft.Website HKEY_CLASSES_ROOT\SHCmdFile HKEY_CLASSES_ROOT\CLSID{ECF03A32-103D-11d2-854D-006008059367} HKEY_CLASSES_ROOT\CLSID{888DCA60-FC0A-11CF-8F0F-00C04FD7D062} HKEY_CLASSES_ROOT\CLSID{9E56BE60-C50F-11CF-9A2C-00A0C90A90CE} HKEY_CLASSES_ROOT\CLSID{9E56BE61-C50F-11CF-9A2C-00A0C90A90CE}

:: Display menu and handle user choice
:menu
echo ___ Show-Hidden-File-Extensions ___
echo Enable or disable hidden extensions visibility.
echo Choose an option :
echo 1. Show hidden extensions
echo 2. Hide hidden extensions
echo 3. Exit
set /p choice=Your choice : 

:: Handle the user's choice for showing or hiding hidden extensions
if "%choice%"=="1" (
    echo Showing hidden extensions...
    (for %%i in (%key_list%) do (
        echo Processing %%i...
        echo.
        REG ADD %%i /v "AlwaysShowExt" /t REG_SZ /f
        reg delete %%i /v "NeverShowExt" /f
    ))
    echo Finished processing all keys.

    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "Hidden" /t REG_DWORD /d 1 /f
    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "HideFileExt" /t REG_DWORD /d 0 /f
    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
    echo Hidden extensions are now visible.
    goto restart_explorer
)
if "%choice%"=="2" (
    echo Hiding hidden extensions...
    (for %%i in (%key_list%) do (
        echo Processing %%i...
        echo.
        REG ADD %%i /v "NeverShowExt" /t REG_SZ /f
        reg delete %%i /v "AlwaysShowExt" /f
    ))
    echo Finished processing all keys.

    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "Hidden" /t REG_DWORD /d 0 /f
    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "HideFileExt" /t REG_DWORD /d 1 /f
    REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v "ShowSuperHidden" /t REG_DWORD /d 0 /f

    echo Hidden extensions are now hidden.
    goto restart_explorer
) 
if "%choice%"=="3" (
    :eof
)
echo Invalid choice. Please run choose 1, 2, or 3.
goto menu

:: Restart Windows Explorer to apply changes
:restart_explorer
taskkill /im explorer.exe /f
timeout /t 2 /nobreak >nul
start explorer.exe
echo explorer.exe has been restarted.
echo Hidden extensions visibility has been updated.

pause
