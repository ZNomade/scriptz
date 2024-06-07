rem Make Temporary Files Cleaner With Batch
rem
rem ➖➖➖➖➖➖➖➖➖➖

@echo off
@echo Made By @the_backup_zone
echo Cleaning Temporary Files...
del /s /q "%temp%\*.*"
del /s /q "%windir%\temp\*.*"
echo Temporary Files Cleaned !

rem ➖➖➖➖➖➖➖➖➖➖