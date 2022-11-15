#!/bin/bash
read -p '请输入证书存放目录: ' dir
if [ ! -d $dir ];then
	echo -e "\e[1;31m目录不存在\e[0m"
	exit 2
fi	
read -p '请输入私钥名称: ' name
openssl genrsa -out $dir/${name}.key
openssl req -new -x509 -key $dir/${name}.key -subj "/CN=common" -out $dir/${name}.crt
