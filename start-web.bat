@echo off
setlocal ENABLEDELAYEDEXPANSION
title VolandoUY - Web Server

set CONFIG_FILE=%USERPROFILE%\volandouy\application.properties
set PORT=
set /a RMI_START=8205

echo Cargando configuración desde: %CONFIG_FILE%

if not exist "%CONFIG_FILE%" (
    echo ERROR: No se encontró %CONFIG_FILE%
    pause
    exit /b 1
)

for /f "tokens=1,2 delims==" %%A in (%CONFIG_FILE%) do (
    if /i "%%A"=="cargo.port" set PORT=%%B
)

if "%PORT%"=="" (
    echo ERROR: No se encontró cargo.port en el archivo.
    pause
    exit /b 1
)

echo Puerto HTTP: %PORT%

:: Buscar RMI libre
set RMI=%RMI_START%
:find_rmi
netstat -ano | findstr :!RMI! >nul
if not errorlevel 1 (
    set /a RMI+=1
    goto find_rmi
)

echo Puerto RMI disponible: %RMI%

cd /d "%~dp0app-web"

:: Ejecutar directamente Maven. El script espera aquí hasta que termine.
echo Iniciando servidor... (Ctrl+C para detenerlo)
mvn cargo:run -Dcargo.servlet.port=%PORT% -Dcargo.rmi.port=%RMI%

echo Servidor detenido correctamente.
pause

