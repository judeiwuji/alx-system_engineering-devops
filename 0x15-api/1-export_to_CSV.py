#!/usr/bin/python3
"""
using this REST API, for a given employee ID, returns information
about his/her TODO list progress.
"""
import csv
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
        filename = "{}.csv".format(user_id)
        with open(filename, 'w') as csvfile:
            writer = csv.writer(csvfile, delimiter=",", quotechar='"',
                                quoting=csv.QUOTE_ALL)
            for task in tasks:
                data = [user_id, user.get('username'), task.get('completed'),
                        task.get('title')]
                writer.writerow(data)


if __name__ == '__main__':
    main()
