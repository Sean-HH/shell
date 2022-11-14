#!/bin/bash
trap "" HUP INT OUIT TSTP
clear
while :
do
  cat <<-EOF
  1. control-plane
  2. jenkins
  3. nfs
  EOF
  read -p "Input Number: " num
  case $num in
  1)
    echo "login control-plane";;
  2)
    echo "login jenkins";;
  3)
    echo "login nfs";;
  *)
    echo "unkown host";;
  esac
done
