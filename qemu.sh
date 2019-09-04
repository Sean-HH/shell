#!/bin/bash
path=/etc/libvirt/qemu
name=$1
cd /var/lib/libvirt/images/
if [ -e ${name}.img ];then
	echo "file exits"
	exit 1
else
	qemu-img create -f qcow2 -b node.qcow2 ${name}.img 20G
fi

cd /etc/libvirt/qemu
if [ -e ${name}.xml ];then
	echo "file exits"
	exit 1
else
	sed "s,node,${name},g" $path/node.xml > $path/${name}.xml
fi

virsh define $path/${name}.xml
