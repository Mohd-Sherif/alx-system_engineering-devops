#!/usr/bin/python3
"""
a function that queries the Reddit API and prints the titles of
the first 10 hot posts listed for a given subreddit.
"""

import requests


def top_ten(subreddit):
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)

    headers = {"User-Agent": "Custom"}
    params = {"limit": 10}
    response = requests.get(
            url,
            headers=headers,
            params=params,
            allow_redirects=False
            )
    if response.status_code == 404:
        print("None")
        return
    results = response.json().get('data')
    [print(title.get('data').get('title'))
        for title in results.get('children')]
