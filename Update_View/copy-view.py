import sys,os
sys.path.append('C:\\Users\\public\\@UTS\WebShot\\library')
from mylib.webshot import fw

args 		= sys.argv
#dir_in      =args[1]
#dir_out     =args[2]
dir_in      =os.getcwd()+"\\inbox\\"
dir_out     =os.getcwd()+"\\view\\"

fw.conf2file("copy_view",dir_in,dir_out)

