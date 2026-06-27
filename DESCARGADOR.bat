@echo off
title YouTube Downloader (yt-dlp)
setlocal enabledelayedexpansion

:: -----------------------------------------
:: RUTAS (AHORA TODO EN r\)
:: -----------------------------------------
set "ROOT=%~dp0r"

set "YTDLP=%ROOT%\yt-dlp.exe"
set "FFMPEG=%ROOT%\ffmpeg.exe"
set "NODE=%ROOT%\node.exe"

set "BASE=%~dp0DESCARGAS"

mkdir "%BASE%\MP4\360P" >nul 2>&1
mkdir "%BASE%\MP4\1080P" >nul 2>&1
mkdir "%BASE%\MP3" >nul 2>&1
mkdir "%BASE%\PORTADAS" >nul 2>&1

set "LINK_PRUEBA=https://youtu.be/1GSMvBDqNdo?si=G9QmKrY7rMh5DfG0"

:: -----------------------------------------
:: CONFIG
:: -----------------------------------------
set "COOKIE_OPTION=--cookies-from-browser firefox"

if exist "%NODE%" (
    set "YTDLP_OPTS=--js-runtime node --extractor-args ""youtube:player_client=default,web_safari"""
) else (
    set "YTDLP_OPTS="
)

:inicio
cls
color 0A
echo ===========================================
echo   YOUTUBE DOWNLOADER (yt-dlp)
echo ===========================================
echo.

:: 🔥 FIX IMPORTANTE (evita arrastre de nombre)
set "URL="
set "NOMBRE="
set "USAR_NOMBRE_ORIGINAL="

set /p URL=Pegue un link o escriba PRUEBA: 

if /i "%URL%"=="PRUEBA" (
    set "URL=%LINK_PRUEBA%"
)

if /i "%URL%"=="salir" goto fin
if "%URL%"=="" goto inicio

:: Limpia playlists
set "URL=%URL:&list=%"
set "URL=%URL:?list=%"

echo.
set /p NOMBRE=Nombre deseado (Enter = original): 

if "%NOMBRE%"=="" (
    set "USAR_NOMBRE_ORIGINAL=1"
) else (
    set "USAR_NOMBRE_ORIGINAL=0"
)

echo.
echo [1] MP3
echo [2] MP4
echo [3] Volver
set /p FORMAT=Formato: 

if "%FORMAT%"=="3" goto inicio
if "%FORMAT%"=="1" goto mp3
if "%FORMAT%"=="2" goto mp4
goto inicio


:: =========================
:mp3
echo.
echo ¿Deseas descargar portada/thumbnail?
echo [1] SI
echo [2] NO
echo [3] Volver
set /p COVER=Opcion:

if "%COVER%"=="3" goto inicio

if "%COVER%"=="2" goto mp3_sin_portada

echo Descargando MP3 con portada...

if exist "%~dp0TEMP" rd /s /q "%~dp0TEMP"
mkdir "%~dp0TEMP"

if "%USAR_NOMBRE_ORIGINAL%"=="1" (
    set "OUT=%~dp0TEMP\%%(title)s.%%(ext)s"
) else (
    set "OUT=%~dp0TEMP\%NOMBRE%.%%(ext)s"
)

"%YTDLP%" "%URL%" ^
 -f bestaudio ^
 --extract-audio --audio-format mp3 --audio-quality 5 ^
 --write-thumbnail --convert-thumbnails jpg ^
 --ffmpeg-location "%FFMPEG%" ^
 %COOKIE_OPTION% %YTDLP_OPTS% ^
 -o "%OUT%"

if errorlevel 1 goto error

for %%A in ("%~dp0TEMP\*.mp3") do set "NOMBRE=%%~nA"

move "%~dp0TEMP\*.mp3" "%BASE%\MP3\" >nul
move "%~dp0TEMP\*.jpg" "%BASE%\PORTADAS\" >nul

rd /s /q "%~dp0TEMP"

echo ✔ MP3 con portada listo
pause
goto inicio


:: =========================
:mp3_sin_portada
echo Descargando MP3...

if "%USAR_NOMBRE_ORIGINAL%"=="1" (
    set "OUT=%BASE%\MP3\%%(title)s.mp3"
) else (
    set "OUT=%BASE%\MP3\%NOMBRE%.mp3"
)

"%YTDLP%" "%URL%" ^
 -f bestaudio ^
 --extract-audio --audio-format mp3 ^
 --no-write-thumbnail ^
 --ffmpeg-location "%FFMPEG%" ^
 %COOKIE_OPTION% %YTDLP_OPTS% ^
 -o "%OUT%"

if errorlevel 1 goto error

echo ✔ MP3 listo
pause
goto inicio


:: =========================
:mp4
echo.
echo [1] 360p
echo [2] 1080p
set /p RES=

if "%RES%"=="1" (
    set "QUALITY=bestvideo[height<=360]+bestaudio/best"
    set "CARP=360P"
)

if "%RES%"=="2" (
    set "QUALITY=bestvideo[height<=1080]+bestaudio/best"
    set "CARP=1080P"
)

if "%USAR_NOMBRE_ORIGINAL%"=="1" (
    set "OUT=%BASE%\MP4\%CARP%\%%(title)s.mp4"
) else (
    set "OUT=%BASE%\MP4\%CARP%\%NOMBRE%.mp4"
)

"%YTDLP%" "%URL%" ^
 -f "%QUALITY%" ^
 --merge-output-format mp4 ^
 --write-thumbnail ^
 --convert-thumbnails jpg ^
 --embed-thumbnail ^
 --ffmpeg-location "%FFMPEG%" ^
 %COOKIE_OPTION% %YTDLP_OPTS% ^
 -o "%OUT%"

if errorlevel 1 goto error

:: 🔥 MOVER PORTADA MP4 A CARPETA CENTRAL
for %%B in ("%BASE%\MP4\%CARP%\*.jpg") do (
    move "%%B" "%BASE%\PORTADAS\" >nul
)

echo ✔ MP4 listo
pause
goto inicio


:: =========================
:error
echo.
echo ❌ ERROR en la descarga
pause
goto inicio


:fin
exit
