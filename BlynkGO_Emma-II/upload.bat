@echo off
set COMPORT=%1
IF "%1" == "" GOTO HELP

esptool.exe --chip esp32 --port %COMPORT% --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 boot_app0.bin 0x1000 bootloader.bin 0x10000 rom.bin 0x8000 partition.bin 

GOTO:EOF

:HELP
echo.
echo Please input COM port.
echo example :  upload COM3