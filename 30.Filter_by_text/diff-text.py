import sys,os
sys.path.append('C:\\Users\\public\\@UTS\WebShot\\library')
from mylib.webshot import fw

dir_in      =os.getcwd()+"\\shot\\"
dir_out     =os.getcwd()+"\\update\\"
dir_mst     =os.getcwd()+"\\master\\"

fw.file2file("diff_filesize",dir_in,dir_out,dir_mst)

