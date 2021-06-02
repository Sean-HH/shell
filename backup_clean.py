import os
import subprocess
def get_file_list(file_path):
    dir_list = os.listdir(file_path)
    if not dir_list:
        return
    else:
        dir_list = sorted(dir_list, key=lambda x: os.path.getmtime(os.path.join(file_path, x)),reverse=True)
        return dir_list

if __name__ == '__main__':
    adict = {}
    for path, dir, file in os.walk("/opt/backup"):
        adict[path] = []
        for i in file:
            adict[path].append(os.path.join(path, i))
    for key in adict.keys():
        if not adict[key]:
           continue
        else:
          blist = get_file_list(key)
          while len(blist) > 3:
            back_name = blist.pop()
            del_name = os.path.join(key,back_name)
            os.remove(del_name)
