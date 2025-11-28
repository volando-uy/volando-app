@echo off
setlocal ENABLEDELAYEDEXPANSION
title VolandoUY - Web Server

:: Configuración
set CONFIG_FILE=%USERPROFILE%\volandouy\application.properties
set WAR_NAME=app-web-jsp.war
set WAR_PATH=app-web\target\%WAR_NAME%
set TOMCAT_DIR=tomcat
set TOMCAT_BIN=%TOMCAT_DIR%\bin
set TOMCAT_WEBAPPS=%TOMCAT_DIR%\webapps
set SERVER_XML=%TOMCAT_DIR%\conf\server.xml
set PORT=

:: Leer puerto desde application.properties
echo Leyendo configuración desde: %CONFIG_FILE%
if not exist "%CONFIG_FILE%" (
    echo ERROR: No se encontró %CONFIG_FILE%
    pause
    exit /b 1
)

for /f "tokens=1,2 delims==" %%A in (%CONFIG_FILE%) do (
    if /i "%%A"=="cargo.port" set PORT=%%B
)

if "%PORT%"=="" (
    echo ERROR: No se encontró cargo.port en el archivo
    pause
    exit /b 1
)

echo Puerto configurado: %PORT%

:: Verificar si el WAR existe
if not exist "%WAR_PATH%" (
    echo No se encontró %WAR_NAME%, compilando proyecto...
    pushd app-web
    mvn clean package -DskipTests
    popd

    if not exist "%WAR_PATH%" (
        echo ERROR: La compilación falló o el WAR aún no se generó.
        pause
        exit /b 1
    )
)

:: Copiar WAR al webapps de Tomcat
echo Copiando WAR a Tomcat...
copy /Y "%WAR_PATH%" "%TOMCAT_WEBAPPS%\%WAR_NAME%" >nul

:: Actualizar puerto en server.xml si es necesario
echo Configurando Tomcat en el puerto %PORT%...
powershell -Command ^
    "(Get-Content '%SERVER_XML%') -replace '(<Connector port=\")\d+(\" protocol=\"HTTP/1.1\")', '${1}%PORT%${2}' | Set-Content '%SERVER_XML%'"

:: Iniciar Tomcat
echo Iniciando Tomcat...
pushd "%TOMCAT_BIN%"
call startup.bat
popd

echo.
echo Aplicación desplegada en: http://localhost:%PORT%/%WAR_NAME:~0,-4%/
echo Presiona una tecla para detener Tomcat...
pause >nul

:: Apagar Tomcat
echo Deteniendo Tomcat...
pushd "%TOMCAT_BIN%"
call shutdown.bat
popd

echo Tomcat detenido.
timeout /t 1 >nul
