@echo off
setlocal
cd /d "%~dp0.."

where py >nul 2>&1
if %errorlevel%==0 (
    py -m http.server 2137 --bind 0.0.0.0
    exit /b %errorlevel%
)

where python >nul 2>&1
if %errorlevel%==0 (
    python -m http.server 2137 --bind 0.0.0.0
    exit /b %errorlevel%
)

echo Nie znaleziono Pythona. Zainstaluj Python i uruchom ten plik ponownie.
pause
