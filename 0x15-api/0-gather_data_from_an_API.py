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
    user_id = int(sys.argv[1])
    res = requests.get("https://jsonplaceholder.typicode.com/user/{:d}/todos".
                       format(user_id))
    res1 = requests.get("https://jsonplaceholder.typicode.com/users/{:d}".
                        format(user_id))
    if res.status_code == 200 and res1.status_code == 200:
        tasks = json.loads(res.content)
        user = json.loads(res1.content)
        completed_tasks = []
        total_completed = 0
        total_tasks = 0

        for task in tasks:
            if task.get('completed'):
                total_completed += 1
                completed_tasks.append(task)
            total_tasks += 1
        print("Employee {} is done with tasks({:d}/{:d}):".
              format(user.get('name'), total_completed, total_tasks))
        for task in completed_tasks:
            print("\t {}".format(task.get('title')))


if __name__ == '__main__':
    main()
