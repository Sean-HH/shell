#!/bin/bash
#############
IMG_DIR=/var/lib/libvirt/images
id=$(sudo virsh dominfo win2008 2> /dev/null | grep running)
if  [ -n "$id"  ];then
        sudo virsh destroy win2008 &> /dev/null
fi
sudo virsh undefine win2008 2> /dev/null

if [ -e /var/lib/libvirt/images/win.img ]; then
    rm -rf $IMG_DIR/win.img &> /dev/null
fi
echo "正在还原....."

sleep 2
qemu-img create -f qcow2 -b $IMG_DIR/.win2008.qcow2  $IMG_DIR/win.img &> /dev/null
sudo virsh define /var/lib/libvirt/images/.win2008.xml &> /dev/null
echo  "还原成功....."
sleep 2
exit
