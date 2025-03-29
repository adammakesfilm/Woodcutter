@echo off
setlocal enabledelayedexpansion

:: Define the folder where the JSON files are located
set "target_folder=D:\MultiMC\instances\1.20-\.minecraft\saves\Head Villagers Testing World\datapacks\Woodcutter\data\woodcutter\recipe\bamboo"

:: Define the search and replacement text
set "search=acacia"
set "replace=bamboo"

:: Check if the folder exists
if not exist "%target_folder%" (
    echo Error: Folder "%target_folder%" not found.
    pause
    exit /b
)

:: Loop through all JSON files in the target directory
for %%F in ("%target_folder%\*.json") do (
    echo Processing %%F...
    powershell -Command "(Get-Content '%%F') -replace '!search!', '!replace!' | Set-Content '%%F'"
)

echo Replacement complete!
pause
