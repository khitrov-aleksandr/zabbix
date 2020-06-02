#!/usr/bin/python

import sys
import urllib2

chat_id         = sys.argv[1]
text            = urllib2.quote(sys.argv[2])

host            = "api.telegram.org"
token           = "Oo--token--oO-000"

def send_get():
    url = "https://" + host + "/bot" + token + "/sendMessage?text=" + text + "&chat_id=" + chat_id
    print url
    try:
        status = urllib2.urlopen(url).read()
        return 0
    except:
        return 1

if text != None and chat_id != None:
    send_get()

sys.exit()
