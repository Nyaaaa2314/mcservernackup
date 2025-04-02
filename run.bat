@echo off
setlocal enabledelayedexpansion

:: Get the current date and time
for /f "tokens=2 delims==" %%D in ('wmic os get localdatetime /value ^| find "="') do set datetime=%%D

:: Format the date (YYYY-MM-DD)
set commitDate=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%

git add .
git commit -m "Backup: %commitDate%"
git push origin main

java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.0/win_args.txt %*
pause
