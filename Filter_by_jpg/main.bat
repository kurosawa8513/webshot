@echo off
REM ###################################
REM # SHOTJPG
REM ###################################

REM ジョブ定義(共通)
setlocal
SET JOB_NAME=%~n0%~x0
SET JOB_PATH=%~dp0
CD %JOB_PATH%
SET CUR_PATH=%CD%
ECHO ##############################################################################
ECHO # JOB_NAME = %JOB_NAME%
ECHO # JOB_PATH = %JOB_PATH%
ECHO # CUR_PATH = %CUR_PATH%
ECHO ##############################################################################

set NEXTPATH=..\..\60.Update_View\

set INBOX__=INBOX\
set OUTBOX_=OUTBOX\
set SHOT___=SHOT\
set DIFF___=SHOT_diff\
set SHOT_HI=SHOT_high\
set UPDATE_=UPDATE\
set NEXTBOX=%NEXTPATH%INBOX\

del %SHOT___%*.jpg		> nul 2>&1
del %UPDATE_%*.jpg		> nul 2>&1
del %DIFF___%*.jpg		> nul 2>&1
del %SHOT_HI%*.jpg		> nul 2>&1
del %OUTBOX_%*.ticket	> nul 2>&1

echo # 開始処理 
set /a n=0
for  %%A in (%INBOX__%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo # INBOXのファイル数 = %n%
if %n%==0 goto :skip

REM #  SHOT: INBOX(ticket) →   SHOT(html)
python conv-jpg.py
if %errorlevel% neq 0 goto :abend

REM #  DIFF: SHOT →   UPDATE
python diff-jpg.py
if %errorlevel% neq 0 goto :abend

REM #  PUSH: UPDATE → MASTER
python push-jpg.py
if %errorlevel% neq 0 goto :abend

REM #  CHECKOUT: UPDATE(html) → OUTBOX(ticket)
python checkout.py
if %errorlevel% neq 0 goto :abend

REM # HTML → TEXT
del  %NEXTBOX%*.ticket	 			> nul 2>&1
copy %OUTBOX_%*.ticket %NEXTBOX% 	> nul 2>&1

set /a n=0
for  %%A in (%OUTBOX_%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo #  OUTBOX のファイル数 = %n%

set /a n=0
for  %%A in (%NEXTBOX%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo #  NEXTBOXのファイル数 = %n%

goto :end
:skip
	echo ファイル数が０のためスキップしました
	
:end
exit /b 0

:abend
echo abend JOBNET
exit /b 1
