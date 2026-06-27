@echo off
title Instalador YouTube Portable
setlocal enabledelayedexpansion
color 0A

set "ROOT=%~dp0"
set "R=%ROOT%r"

echo ===========================================
echo        INSTALADOR YOUTUBE PORTABLE
echo ===========================================
echo

:: -----------------------------------------
:: YT-DLP
:: -----------------------------------------
if not exist "%R%\yt-dlp.exe" (
    echo [2/4] Descargando yt-dlp...
    powershell -Command "Invoke-WebRequest -Uri https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe -OutFile '%R%\yt-dlp.exe'"
) else (
    echo [2/4] yt-dlp ya existe
)

:: -----------------------------------------
:: FFMPEG
:: -----------------------------------------
if not exist "%R%\ffmpeg.exe" (
    echo [3/4] Descargando ffmpeg...
    powershell -Command "Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -OutFile '%R%\ffmpeg.zip'"

    powershell -Command "Expand-Archive -Path '%R%\ffmpeg.zip' -DestinationPath '%R%\temp'"

    for /r "%R%\temp" %%f in (ffmpeg.exe) do (
        copy "%%f" "%R%\ffmpeg.exe" >nul
    )

    rd /s /q "%R%\temp"
    del "%R%\ffmpeg.zip"
) else (
    echo [3/4] ffmpeg ya existe
)

:: -----------------------------------------
:: NODE (CORREGIDO)
:: -----------------------------------------
echo [4/4] Verificando Node.js portable...

if exist "%R%\node.exe" (
    echo ✔ Node OK
    echo   Detectado en %R%\node.exe
) else (
    echo.
    echo ⚠ NODE NO ENCONTRADO
    echo.
    echo PASOS:
    echo 1. Descarga Node portable desde https://nodejs.org
    echo 2. Descomprime el ZIP
    echo 3. Coloca node.exe dentro de la carpeta r
    echo 4. Debe quedar asi: %R%\node.exe
    echo.
)

echo.
echo ===========================================
echo INSTALACION COMPLETADA
echo ===========================================
echo.
echo Estructura:
echo   r\yt-dlp.exe
echo   r\ffmpeg.exe
echo   r\node.exe
echo.
echo Ahora crea tu downloader.bat en la raiz.
echo.
pause
