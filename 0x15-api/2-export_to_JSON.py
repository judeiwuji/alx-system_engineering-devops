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
    user_id = sys.argv[1]
    res = requests.get("https://jsonplaceholder.typicode.com/user/{}/todos".
                       format(user_id))
    res1 = requests.get("https://jsonplaceholder.typicode.com/users/{}".
                        format(user_id))
    if res.status_code == 200 and res1.status_code == 200:
        tasks = res.json()
        user = res1.json()
        filename = "{}.json".format(user_id)
        user_tasks = {user_id: []}
        for task in tasks:
            data = {
                    'task':  task.get('title'),
                    'completed': task.get('completed'),
                    'username': user.get('username'),
            }
            user_tasks[user_id].append(data)
        with open(filename, 'w') as fp:
            json.dump(user_tasks, fp)


if __name__ == '__main__':
    main()
