#!/usr/bin/python3
""" Recurse it!"""
import requests


def recurse(subreddit, hot_list=[]):
    """returns a list containing the titles of all hot articles
    for a given subreddit"""

    api = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {'User-Agent': 'Alx-Project by jude'}
    params = {'limit': 1}
    if len(hot_list) > 0:
        after = list(hot_list[-1].keys())[0]
        params['after'] = after

    response = requests.get(api, headers=headers, allow_redirects=False,
                            params=params)

    if response.status_code == 200:
        data_wrapper = response.json()
        record = data_wrapper.get('data')
        title = record.get('children')[0].get('data').get('title')
        next = record.get('after')
        if next:
            hot_list.append({next: title})
            recurse(subreddit, hot_list)
        else:
            hot_list = [title for title in list(hot_list.values())]
            return hot_list
    else:
        return None
