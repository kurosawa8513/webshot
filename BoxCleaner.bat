set rootpath=C:\Users\Public\@uts\WebShot\stage3\

set basepath=%rootpath%20.Filter_by_html\
cd %basepath%
del /q  inbox\*.*
del /q   shot\*.*
del /q update\*.*
del /q outbox\*.*
del /q main.log

set basepath=%rootpath%30.Filter_by_text\
cd %basepath%
del /q  inbox\*.*
del /q   shot\*.*
del /q update\*.*
del /q outbox\*.*
del /q main.log

set basepath=%rootpath%40.Filter_by_png\
cd %basepath%
del /q  inbox\*.*
del /q   shot\*.*
del /q outbox\*.*
del /q main.log

set basepath=%rootpath%50.Filter_by_jpg\
cd %basepath%
del /q     inbox\*.*
del /q      shot\*.*
del /q shot_diff\*.*
del /q shot_high\*.*
del /q    outbox\*.*
del /q main.log

pause
