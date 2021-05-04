@echo off
title FO4 UHR DLC duplicate remover and repacker
rem requires FO4 UHR DLC and Creation Kit intalled
rem requires bat file from https://www.nexusmods.com/fallout4/mods/37518
rem you will need about 10GB free space

set currentDir=%cd%
set FO4path=C:\Program Files (x86)\Steam\steamapps\common\Fallout 4
set FO4-CKpath=C:\Program Files (x86)\Steam\steamapps\common\Fallout 4
set textureFiles=01 07 10 14
rem set textureFiles=01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16

cd /D "%FO4path%\Data"
(for %%a in (%textureFiles%) do (
echo Extracting DLCUltraHighResolution - Textures%%a.ba2
"%FO4-CKpath%\Tools\Archive2\Archive2.exe" "DLCUltraHighResolution - Textures%%a.ba2" -extract="DLCUltraHighResolution - Textures%%a" -q
del "DLCUltraHighResolution - Textures%%a.ba2"
copy "%currentDir%\High Res DLC Duplicates Delete Batch.bat" "DLCUltraHighResolution - Textures%%a"
echo Deleting duplicates
call "DLCUltraHighResolution - Textures%%a\High Res DLC Duplicates Delete Batch.bat" 2>NUL
del "DLCUltraHighResolution - Textures%%a\High Res DLC Duplicates Delete Batch.bat"
echo Repacking DLCUltraHighResolution - Textures%%a.ba2
"%FO4-CKpath%\Tools\Archive2\Archive2.exe" "DLCUltraHighResolution - Textures%%a" -create="DLCUltraHighResolution - Textures%%a.ba2" -root="%FO4path%\Data\DLCUltraHighResolution - Textures%%a" -format=DDS -q
rmdir /S /Q  "DLCUltraHighResolution - Textures%%a"
))

pause
