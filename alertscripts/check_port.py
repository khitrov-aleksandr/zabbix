#!/usr/bin/python3

from subprocess import call
import socket


address                 = 'localhost'
port                    = 10051
timeout                 = 5

pushbullet_email        = "khitrov.aleksandr@gmail.com"
subject_text            = "Zabbix server is DOWN"
message_text            = "Zabbix server is DOWN"

socket = socket.socket()

try:
    socket.settimeout(timeout)
    socket.connect((address, port))

except Exception as e:
    call(["/usr/lib/zabbix/alertscripts/pushbullet.py", pushbullet_email, subject_text, message_text])

finally:
    socket.close()
