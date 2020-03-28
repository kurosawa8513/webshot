@echo off
REM ###################################
REM # SHOTHTML
REM ###################################

REM �W���u��`(����)
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

set NEXTPATH=..\30.Filter_by_text\

set INBOX__=INBOX\
set OUTBOX_=OUTBOX\
set SHOT___=SHOT\
set UPDATE_=UPDATE\
set NEXTBOX=%NEXTPATH%INBOX\

del %SHOT___%*.html		> nul 2>&1
del %UPDATE_%*.html		> nul 2>&1
del %OUTBOX_%*.ticket	> nul 2>&1

echo # �J�n���� 
set /a n=0
for  %%A in (%INBOX__%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo # INBOX�̃t�@�C���� = %n%
if %n%==0 goto :skip

echo #  SHOT: INBOX(ticket) ��   SHOT(html)
python shot-Html.py
if %errorlevel% neq 0 goto :abend

echo #  DIFF: SHOT ��   UPDATE
python diff-Html.py
if %errorlevel% neq 0 goto :abend

echo #  PUSH: UPDATE �� MASTER
python push-Html.py
if %errorlevel% neq 0 goto :abend

echo #  CHECKOUT: UPDATE(html) �� OUTBOX(ticket)
python checkout.py
if %errorlevel% neq 0 goto :abend

echo # HTML �� TEXT
del  %NEXTBOX%*.ticket	 			> nul 2>&1
copy %OUTBOX_%*.ticket %NEXTBOX% 	

set /a n=0
for  %%A in (%OUTBOX_%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo #  OUTBOX �̃t�@�C���� = %n%

set /a n=0
for  %%A in (%NEXTBOX%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo #  NEXTBOX�̃t�@�C���� = %n%

goto :end
:skip
	echo �t�@�C�������O�̂��߃X�L�b�v���܂���
	
:end
exit /b 0

:abend
echo abend JOBNET
exit /b 1
