@echo off
REM ###################################
REM # UPDATE_VIEW
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

set INBOX__=INBOX\

echo # �J�n���� 
set /a n=0
for  %%A in (%INBOX__%*.ticket) do ( if exist %%A (set /a n=n+1) )
echo # INBOX�̃t�@�C���� = %n%
if %n%==0 goto :skip

REM #  SHOT: INBOX(ticket) ��   VIEW(JPG)
python copy-view.py
if %errorlevel% neq 0 goto :abend

goto :end
:skip
	echo �t�@�C�������O�̂��߃X�L�b�v���܂���
	
:end
exit /b 0

:abend
echo abend JOBNET
exit /b 1
