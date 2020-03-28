import sys,os
sys.path.append('C:\\Users\\public\\@UTS\WebShot\\library')
from mylib.webshot import fw

dir_in      =os.getcwd()+"\\update\\"
dir_out     =os.getcwd()+"\\master\\"

fw.file2file("push_file",dir_in,dir_out)

