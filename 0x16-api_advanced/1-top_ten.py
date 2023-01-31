#!/usr/bin/python3
"""Top ten posts"""
import requests


def top_ten(subreddit):
    """prints the titles of the first 10 hot posts listed
    for a given subreddit"""

    api = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {'User-Agent': 'Alx-Project by jude'}
    params = {'limit': 10}
    response = requests.get(api, headers=headers, allow_redirects=False,
                            params=params)

    if response.status_code == 200:
        record = response.json().get('data')

        for item in record.get('children'):
            print("{}".format(item.get('data').get('title')))
    else:
        print('None')
