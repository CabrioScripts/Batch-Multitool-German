@echo off
    color 0a
    chcp 65001
    cls
:Admin
        >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  
        REM --> If error flag set, we do not have admin.  
        if '%errorlevel%' NEQ '0' (    echo Requesting administrative privileges...    goto UACPrompt) else ( goto gotAdmin )  
    :UACPrompt  
            echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
            echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"  
            "%temp%\getadmin.vbs"  
            exit /B
        :gotAdmin  
                goto home
:home
    cls
    color 0a
    title Multitool - Version 1.0
    echo.
    echo ███╗   ███╗██╗   ██╗██╗  ████████╗██╗████████╗ ██████╗  ██████╗ ██╗     
    echo ████╗ ████║██║   ██║██║  ╚══██╔══╝██║╚══██╔══╝██╔═══██╗██╔═══██╗██║     
    echo ██╔████╔██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
    echo ██║╚██╔╝██║██║   ██║██║     ██║   ██║   ██║   ██║   ██║██║   ██║██║     
    echo ██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║   ██║   ╚██████╔╝╚██████╔╝███████╗
    echo ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
    echo Ein Batch-Script programmiert von Cabrio
    echo.
    echo ===========================================================================================================
    echo Hallo %username%
    echo.
    echo.
    echo ╔══════════════════════════════════════════════╗
    echo ║              █ MULTI-TOOL MENÜ █             ║
    echo ╠══════════════════════════════════════════════╣
    echo ║                                              ║
    echo ║   [1]   System-Informationen anzeigen        ║
    echo ║   [2]   Temporäre Dateien löschen            ║
    echo ║   [3]   Netzwerk-Tools                       ║
    echo ║   [4]   Laufwerke anzeigen                   ║
    echo ║   [5]   Discord-Webhook Tool                 ║
    echo ║   [6]   Zufällige Nummer                     ║
    echo ║   [7]   Info                                 ║
    echo ║   [8]   Verlassen                            ║
    echo ║                                              ║
    echo ╚══════════════════════════════════════════════╝
    set /p Home= Bitte wähle eine Option (1-8): 
    if %home%==1 goto systeminfo
    if %home%==2 goto temp
    if %home%==3 goto systeminfo
    if %home%==4 goto temp
    if %home%==5 goto webhook
    if %home%==6 goto temp
    if %home%==7 goto Info
    if %home%==8 goto exit
    cls
    color 4
    echo ERROR: Diese Option gibt es nicht!
    timeout 5 > nul
    goto home 
:systeminfo
    cls
    color 0B
    title Multitool - Systeminfo
    systeminfo
    echo.
    echo.
    echo.
    echo Drücke eine beliebige Taste um zum Hauptmenü zurückzukehren...
    pause > nul
    goto home
:temp 
    cls
    color 0B
    title Multitool - Lösche Temporäre Dateien
    pushd "%CD%"
    CD /D "%~dp0"  
    rd /s /q %temp% 
    rd /s /q %SystemRoot%\Prefetch
    echo.
    cls
    color 0a
    echo Erfolgreich ausgeführt!
    color 4
    echo Drücke eine beliebige Taste um zum Hauptmenü zurückzukehren...
    pause > nul
    goto home
:exit
    exit
    goto home
:Info
    title Multitool - Informationen
    cls
    color 0a
    echo Multitool v1.0
    echo.
    echo Changelog:
    echo    nix 
    echo.
    echo. 
    echo Mein Discord username: 
    color 6
    echo cabrio11
    color 0a
    echo (c) Cabrio 2024
    echo.
    echo Drücke eine beliebige Taste um zum Hauptmenü zurückzukehren...
    pause > nul
    goto home
:webhook
    @echo off
    setlocal enabledelayedexpansion

    REM Benutzer gibt die Discord Webhook URL im CMD ein
    cls
    echo Discord Webhook Text Sender
    echo ---------------------------
    set /p WEBHOOK_URL=Bitte gib die Discord Webhook URL ein: 
    :SEND_TEXT
    cls
    echo Discord Webhook Text Sender
    echo ---------------------------
    set /p TEXT=Gib den Text ein, der gesendet werden soll: 

    powershell -Command ^
  "$content = '%TEXT%';" ^
  "$url = '%WEBHOOK_URL%';" ^
  "Invoke-RestMethod -Uri $url -Method Post -ContentType 'application/json' -Body (@{content=$content} | ConvertTo-Json);" ^
  "Write-Host 'Text erfolgreich gesendet!'"

    pause
    goto SEND_TEXT

