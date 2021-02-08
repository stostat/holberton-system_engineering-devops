#!/usr/bin/python3
"""Querie to Reddit API."""

from requests import get


def number_of_subscribers(subreddit):
    """Returnsnumber of subscribers for a given subreddit."""
    url = 'https://www.reddit.com/r/{}/about.json'
    headers = {'User-Agent': 'matv:1.0.0'}
    request = get(url.format(subreddit),
                  headers=headers,
                  allow_redirects=False)
    if request.status_code != 200:
        return 0
    return request.json().get('data', {}).get('subscribers', 0)
