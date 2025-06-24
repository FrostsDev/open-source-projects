::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD1GQxeWL1eeA6YX/Ofr08iTo04VcuszfZzn962sIfQvw1W2WZku125Tl8UwJQsKUh2obxs9pmAMtGWRecKEtm8=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
