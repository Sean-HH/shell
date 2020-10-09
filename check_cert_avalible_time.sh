#!/bin/bash
host=$1
port=$2
end_date=`/usr/bin/openssl s_client -servername $host -host $host -port $port -showcerts </dev/null 2>/dev/null |
  sed -n '/BEGIN CERTIFICATE/,/END CERT/p' |
  /usr/bin/openssl  x509 -text 2>/dev/null |
  sed -n 's/ *Not After : *//p'`
# openssl 检验和验证SSL证书。
# -servername $host 因一台主机存在多个证书，利用SNI特性检查
# </dev/null 定向标准输入，防止交互式程序。从/dev/null 读时，直接读出0 。
# sed -n 和p 一起使用，仅显示匹配到的部分。 //,// 区间匹配。
# openssl x509 -text 解码证书信息，包含证书的有效期。

if [ -n "$end_date" ]
then
    end_date_seconds=`date '+%s' --date "$end_date"`
    now_seconds=`date '+%s'`
    echo "($end_date_seconds-$now_seconds)/24/3600" | bc
fi
