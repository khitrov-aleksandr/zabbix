#!/usr/bin/python

import sys
import urllib2

phone           = sys.argv[1]
text            = urllib2.quote(sys.argv[2])

login           = "login"
password        = "password"
primary_host    = "api.smstraffic.ru"
backup_host     = "api2.smstraffic.ru"
source          = "BeautifyNumber"
timeout         = 30

def send_get(host):
    url = "https://" + host + "/multi.php?login=" + login + "&password=" + password + "&phones=" + phone + "&rus=5&originator=" + source + "&message=" + text
    print(url)
    try:
        status = urllib2.urlopen(url, timeout = timeout).read()
        return 0
    except:
        return 1

def send_message():
    if send_get(primary_host) == 0:
        return 0
    elif send_get(backup_host) == 0:
        return 0
    else:
        return 1

if phone != None and text != None:
    send_message()

sys.exit()
