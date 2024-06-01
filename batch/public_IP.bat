@echo off
rem Script criado por [=Zac/ZNômade=] em 17/03/2024

rem Check if curl is installed
where /q curl
if %errorlevel% neq 0 (
    echo curl is not installed. Please install it first.
    pause
    exit /b
)

rem Get public IP address using curl
for /f "delims=" %%i in ('curl -s https://ipecho.net/plain') do set public_ip=%%i

rem Display public IP address
echo Your public IP address is: %public_ip%

pause