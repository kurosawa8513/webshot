import sys,os
sys.path.append('C:\\Users\\public\\@UTS\WebShot\\library')

from mylib.webshot import fw

dir_in      =os.getcwd()+"\\inbox\\"
dir_out     =os.getcwd()+"\\outbox\\"
dir_chk     =os.getcwd()+"\\update\\"

fw.conf2conf("checkout",dir_in,dir_out,dir_chk,"txt","text")

