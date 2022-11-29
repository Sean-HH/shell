#!/work/apps/python3/bin/python3
import os
import sys
def copy(src_dir,dst_dir):
    if os.path.exists(src_dir) and os.path.exists(dst_dir):
        files=os.listdir(src_dir)
        for file in files:
            src_target=os.path.join(src_dir,file)
            dst_target=os.path.join(dst_dir,file)
            if os.path.isdir(src_target):
                os.mkdir(dst_target)
                copy(src_target,dst_target)
            else:
                with open(src_target,'rb') as f:
                    read_file=f.read()
                    with open(dst_target,'wb') as f:
                        f.write(read_file)
        else:
            print("拷贝完成！！！")
    else:
        print("目录不存在！")
copy(sys.argv[1],sys.argv[2])
