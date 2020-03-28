@echo off
set ROOTPATH=C:\Users\public\@uts\WebShot\
set BASEPATH=%ROOTPATH%10.Update_Entry\
set OUTBOX__=outbox_stage3\
set STAGE___=%ROOTPATH%stage1\
rem set STAGEBOX=%STAGE___%20.Filter_by_html\inbox\
set STAGEBOX=%STAGE___%40.Filter_by_png\inbox\

del    %BASEPATH%%OUTBOX__%desktop.ini /F /S /A:H		2>NUL
del /q %BASEPATH%%OUTBOX__%*.ticket					2>NUL

cd %BASEPATH%
python list2ticket.py urllist\URLLIST_hotentry.org.txt	%OUTBOX__%	TODAY	10	5
python list2ticket.py urllist\URLLIST_social.org.txt	%OUTBOX__%	TODAY	10	1
python list2ticket.py urllist\URLLIST_towntweet.org.txt	%OUTBOX__%	TODAY	10	5

copy %BASEPATH%%OUTBOX__%*.ticket %STAGEBOX%
exit /b 0

:abend
exit /b 1
