#!/usr/bin/python3
"""
Python script that, using this REST API, for a given employee ID,
returns information about his/her TODO list progress and export data
in the CSV format.
"""

import csv
import requests
import sys


if __name__ == '__main__':
    user_id = sys.argv[1]
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(user_id)).json()
    todos = requests.get(url + "todos", params={"userId": user_id}).json()
    completed = [task.get('title') for task in todos if task.get('completed')]
    with open('{}.csv'.format(user_id), mode='w') as f:
        writer = csv.writer(f, delimiter=',', quoting=csv.QUOTE_ALL)

        [writer.writerow(
            [
                user_id,
                user.get('username'),
                task.get('completed'),
                task.get('title')
                ]
            ) for task in todos]
