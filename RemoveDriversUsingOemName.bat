@echo off
setlocal enabledelayedexpansion

set OEM_DRIVER_NAME=oem128.inf

for /f "tokens=*" %%a in ('pnputil.exe -e ^| findstr /i /c:"%OEM_DRIVER_NAME%"') do (
    set line=%%a
    set package=!line:~21!
    echo Uninstalling driver package: !package!
    pnputil.exe -f -d !package!
)

echo All drivers with the OEM driver name "%OEM_DRIVER_NAME%" have been uninstalled.

pause
