#!/usr/bin/python3
"""
using this REST API, for a given employee ID, returns information
about his/her TODO list progress.
"""
import json
import requests
import sys


def main():
    """Entry point"""
    res = requests.get("https://jsonplaceholder.typicode.com/users")
    filename = "todo_all_employees.json"
    users_tasks = {}
    if res.status_code == 200:
        users = res.json()
        for user in users:
            user_id = user.get('id')
            url = "https://jsonplaceholder.typicode.com/user/{}/todos".\
                  format(user_id)
            res1 = requests.get(url)

            tasks = res1.json()
            users_tasks[user_id] = []
            for task in tasks:
                data = {
                        'task':  task.get('title'),
                        'completed': task.get('completed'),
                        'username': user.get('username'),
                }
                users_tasks[user_id].append(data)
        with open(filename, 'w') as fp:
            json.dump(users_tasks, fp)


if __name__ == '__main__':
    main()
