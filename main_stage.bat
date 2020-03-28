@echo off
REM ƒWƒ‡ƒu’è‹`(‹¤’Ê)
setlocal
SET JOB_NAME=%~n0%~x0
SET JOB_PATH=%~dp0
CD %JOB_PATH%
SET CUR_PATH=%CD%
ECHO JOB_NAME = %JOB_NAME%
ECHO JOB_PATH = %JOB_PATH%
ECHO DUR_PATH = %CUR_PATH%

set ROOTPATH=C:\Users\public\@uts\WebShot\
set STG_NAME=stage3
set STG_PATH=%ROOTPATH%%STG_NAME%\

set STARTBAT=main_%STG_NAME%.bat
set Update_Entry__=10.Update_Entry
set Update_View___=60.Update_View

set Filter_by_html=20.Filter_by_html
set Filter_by_text=30.Filter_by_text
set Filter_by_png_=40.Filter_by_png
set Filter_by_jpg_=50.Filter_by_jpg
echo # START webshot
echo #  %Update_Entry__%
cd %ROOTPATH%%Update_Entry__%
CALL %STARTBAT%
timeout /t 3 /nobreak >nul

echo #  STAGE = %STG_NAME%
cd %STG_PATH%
del desktop.ini /F /S /A:H > nul 2>&1
timeout /t 3 /nobreak >nul

echo #   %Filter_by_html%
cd %STG_PATH%%Filter_by_html%
CALL main.bat
if %errorlevel% neq 0 goto :abend
cd %STG_PATH%
timeout /t 3 /nobreak >nul

echo #   %Filter_by_text%
cd %STG_PATH%%Filter_by_text%
CALL main.bat
if %errorlevel% neq 0 goto :abend
cd %STG_PATH%
timeout /t 3 /nobreak >nul

echo #   %Filter_by_png_%
cd %STG_PATH%%Filter_by_png_%
CALL main.bat
if %errorlevel% neq 0 goto :abend
cd %STG_PATH%
timeout /t 3 /nobreak >nul

echo #   %Filter_by_jpg_%
cd %STG_PATH%%Filter_by_jpg_%
CALL main.bat
if %errorlevel% neq 0 goto :abend
cd %STG_PATH%
timeout /t 3 /nobreak >nul

echo #  %Update_View___%
cd %ROOTPATH%%Update_View___%
CALL main.bat
timeout /t 3 /nobreak >nul

echo # END   webhost
exit /b 0

:abend
echo ERRORLEVEL=%ERRORLEVEL%
echo ABEND!! webhost
cd %STG_PATH%
exit /b 1

