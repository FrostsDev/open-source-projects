@echo off
chcp 65001 >nul
title IP Lookup Tool
color 0B
setlocal enabledelayedexpansion

:main
cls
echo.
echo                    ██╗██████╗ ██████╗ ██╗      ██████╗  █████╗  ██████╗████████╗██╗ ██████╗ ███╗   ██╗
echo                    ██║██╔══██╗╚════██╗██║     ██╔═══██╗██╔══██╗██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
echo                    ██║██████╔╝ █████╔╝██║     ██║   ██║███████║██║        ██║   ██║██║   ██║██╔██╗ ██║
echo                    ██║██╔═══╝ ██╔═══╝ ██║     ██║   ██║██╔══██║██║        ██║   ██║██║   ██║██║╚██╗██║
echo                    ██║██║     ███████╗███████╗╚██████╔╝██║  ██║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
echo                    ╚═╝╚═╝     ╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
echo.
echo                    --------------------------------- IP Lookup Tool ----------------------------------
echo                                                    Created by: Frosts
echo.  

:: Ask for IP
set /p "ip=Enter IP Address to lookup: "

:: Fetch and store data
echo.
echo [*] Fetching info for %ip%...
echo.

:: Use a temp file to hold the result
set "tmpfile=%temp%\ipinfo_result.txt"
curl -s ipinfo.io/%ip% > "%tmpfile%"
type "%tmpfile%"

echo.
echo [1] Save result to a .txt file
echo [2] Search another IP
echo [3] Exit
echo.
set /p "choice=Choose an option (1-3): "

if "%choice%"=="1" (
    set /p "filename=Enter filename (without extension): "
    if not "!filename!"=="" (
        copy /Y "%tmpfile%" "%cd%\!filename!.txt" >nul
        echo Saved as "!filename!.txt" in current directory.
    ) else (
        echo No filename entered. Skipping save.
    )
    pause
    goto main
)

if "%choice%"=="2" (
    goto main
)

if "%choice%"=="3" (
    del "%tmpfile%" >nul 2>&1
    exit
)

echo Invalid choice. Try again.
pause
goto main
