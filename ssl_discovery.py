#!/usr/bin/python
import os
import sys
import json

def ssl_cert_discovery():
    web_list = []
    web_dict = {"data":None}
    with open("/usr/local/zabbix/script/ssl_cert_list","r") as f:
        for sslcert in f:
            dict = {}
            dict["{#DOMAINNAME}"] = sslcert.strip().split()[0]
            dict["{#PORT}"] = sslcert.strip().split()[1]
            web_list.append(dict)
    web_dict["data"] = web_list
    jsonStr = json.dumps(web_dict,indent=4)
    return jsonStr
if __name__ == "__main__":
    print ssl_cert_discovery()
