@echo off
REM ジョブ定義(共通)
setlocal
SET JOB_NAME=%~n0
SET JOB_PATH=%~d0
CD %JOB_PATH%
SET CUR_PATH=%~dp0
ECHO JOB_NAME = %JOBNAME%
ECHO JOB_PATH = %JOBPATH%
ECHO DUR_PATH = %CUR_PATH%

set ROOTPATH=C:\Users\public\@uts\WebShot\
set BASEPATH=%ROOTPATH%10.Update_Entry\
set OUTBOX__=outbox_stage2\
set STAGE___=%ROOTPATH%stage2\
set STAGEBOX=%STAGE___%20.Filter_by_html\inbox\

del    %BASEPATH%%OUTBOX__%desktop.ini /F /S /A:H		1> NUL 2>&1
del /q %BASEPATH%%OUTBOX__%*.ticket						1> NUL 2>&1

cd %BASEPATH%
python list2ticket.py urllist\URLLIST_DQW.ORG.txt		%OUTBOX__%     NOW		10	5
python list2ticket.py urllist\URLLIST_sheet.org.txt		%OUTBOX__%     NOW		10	1
python list2ticket.py urllist\URLLIST_youtube.org.txt	%OUTBOX__%     NOW		10	50
python list2ticket.py urllist\URLLIST_news.org.txt		%OUTBOX__%     TODAY	10	1
python list2ticket.py urllist\URLLIST_daily.org.txt		%OUTBOX__%     TODAY	10	5

DEL  %STAGEBOX%*.ticket						 1> NUL 2>&1
copy %BASEPATH%%OUTBOX__%*.ticket %STAGEBOX% 1> NUL 2>&1
exit /b 0

:abend
exit /b 1


