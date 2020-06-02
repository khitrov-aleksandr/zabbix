#!/usr/bin/python3

import requests
import json
import sys

url     = 'https://api.pushbullet.com/v2/pushes'
token   = 'token'

email   = sys.argv[1]
title   = sys.argv[2]
message = sys.argv[3] 

headers = {
                'Content-type': 'application/json',
                'Access-Token': token
}

data = {
                "body":message,
                "title":title,
                "type":"note",
                "email":email
}

answer = requests.post(url, data=json.dumps(data), headers=headers)

print(answer)

response = answer.json()

print(response)

sys.exit()
