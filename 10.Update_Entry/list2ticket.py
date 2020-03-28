import sys
from pathlib import Path
import logging.config
sys.path.append('C:\\Users\\public\\@UTS\WebShot\\library')
from mylib.webshot	import ticket
from mylib          import configlib

logging.config.fileConfig('logging.conf')
logger = logging.getLogger()
#ConfDir     ="outbox_stage3\\"
#ListFile    ="URLLIST\\URLLIST_hotentry.org.txt"
#view        ="TODAY"
#outcnt      =10
#term        =5

args = sys.argv
ListFile   =args[1]
ConfDir    =args[2]
view       =args[3]
outcnt     =int(args[4])
term       =int(args[5])

basename = Path(ListFile).stem
list            =[]
f               = open(ListFile, "r", encoding="utf-8")
urls            = f.readlines()
last_pos        = configlib.getSimpleConfig( "last_pos_"+basename,0)
last_pos		= int(last_pos)
last_pos_pre    = last_pos
exec_cnt        = int(configlib.getSimpleConfig( "実行回数",0))
i_in = 1
i_err = 0

if last_pos == len(urls):
    last_pos=0
if exec_cnt % term == 0:
    for url in urls:
        if len(list) >= outcnt:
            break
        if i_in > last_pos:
            last_pos = i_in
            url=url.strip()
            try:
                ticketfile=ticket.maketicket( url, ConfDir, view, term)
                list.append(ticketfile)
            except:
                i_err = i_err + 1
                pass
        i_in = i_in + 1
    status = "OK"
else:
    status = "SKIP"
exec_cnt = exec_cnt + 1
configlib.setSimpleConfig("last_pos_"+basename,str(last_pos))
configlib.setSimpleConfig("実行回数",str(exec_cnt))
logging.info("%-25s  status=%-4s IN=%3d OUT=%3d ERR=%3d LastPos=%3d ->%3d",basename,status,len(urls),len(list),i_err,last_pos_pre,last_pos)