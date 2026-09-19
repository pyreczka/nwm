@echo off
setlocal
cd /d "%~dp0"

set "PORT=2137"
set "LOCAL_URL=http://localhost:%PORT%/ll.html"
set "LAN_IP="

for /f "tokens=2 delims=:" %%A in ('ipconfig ^| findstr /R /C:"IPv4"') do if not defined LAN_IP set "LAN_IP=%%A"
for /f "tokens=*" %%A in ("%LAN_IP%") do set "LAN_IP=%%A"

echo.
echo ==============================
echo       Lokalny serwer strony
echo ==============================
echo Localhost: http://127.0.0.1:%PORT%/ll.html
echo IP sieci lokalnej: %LAN_IP%
echo Dla innych urzadzen: http://%LAN_IP%:%PORT%/ll.html
echo Port: %PORT%
echo.

start "localhost:%PORT%" /min cmd /c call "%~dp0start-localhost.bat"
echo Serwer zostal uruchomiony.
echo To okno mozesz zamknac.
pause
