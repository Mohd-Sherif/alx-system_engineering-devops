#!/usr/bin/python3
"""
Python script that, using this REST API returns information about all
ememployees TODO list progress and export data in the JSON format.
"""

import json
import requests


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com/"
    users = requests.get(url + "users/").json()
    dict_list = {}
    for user in users:
        todos = requests.get(
                url + "todos",
                params={"userId": user.get('id')}
            ).json()
        dict_list.update({
            user.get('id'): [
                {
                    "username": user.get('username'),
                    "task": task.get('title'),
                    "completed": task.get('completed')
                } for task in todos
            ]
        })
    with open("todo_all_employees.json", mode='w') as f:
        json.dump(dict_list, f)
