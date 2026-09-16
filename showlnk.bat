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
::     Title        : Invoke-Keylogger.ps1                                              ::
::     Link         : https://github.com/Miiraak/show-LNK/tree/master/showink.bat       ::
::     Version      : 1.0                                                               ::
::     Category     : collection/keylogging                                             ::
::     Target       : Windows 10/11                                                     ::
::     Description  : A script to show or hide LNK file extension in Windows.           ::
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
set key="HKEY_CLASSES_ROOT\lnkfile"

:: Display menu and handle user choice
echo ___ Show LNK ___
echo Enable or disable LNK extensions visibility.
echo Choose an option :
echo 1. Show .lnk extensions
echo 2. Hide .lnk extensions
echo 3. Exit
set /p choice=Your choice : 

:: Handle the user's choice for showing or hiding LNK extensions
if "%choice%"=="1" (
    reg query %key% /v "AlwaysShowExt" >nul
    if %errorlevel% equ 0 (
        echo LNK extensions are already visible.
    ) else (
        echo Showing LNK extensions...
        REG ADD %key% /v "AlwaysShowExt" /t REG_SZ /f
        reg delete %key% /v "NeverShowExt" /f
        echo LNK extensions are now visible.
    )

) else if "%choice%"=="2" (
    reg query %key% /v "NeverShowExt" >nul
    if %errorlevel% equ 0 (
        echo LNK extensions are already hidden.
    ) else (
        echo Hiding LNK extensions...
        REG ADD %key% /v "NeverShowExt" /t REG_SZ /f
        reg delete %key% /v "AlwaysShowExt" /f
        echo LNK extensions are now hidden.
    )
) else if "%choice%"=="3" (
    :eof
) else (
	cls
    	echo Invalid choice, please enter 1 or 2.
	echo.
)

:: Restart Windows Explorer to apply changes
taskkill /im explorer.exe /f
timeout /t 2 /nobreak >nul
start explorer.exe
echo explorer.exe has been restarted.
echo LNK extensions visibility has been updated.

pause