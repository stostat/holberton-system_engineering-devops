#!/usr/bin/python3
""" the urllib request"""

from sys import argv
import requests


if __name__ == "__main__":

    if len(argv) < 2:
        print('USAGE:', __file__, '<employee id>')

    try:
        employee_id = int(argv[1])
    except ValueError:
        print('Employee id must be an integer')

    url = "https://jsonplaceholder.typicode.com/"
    user_info = requests.get(url + "users/{}".format(employee_id)).json()
    tasks = requests.get(url + "todos", params={"userId": employee_id}).json()

    completed = [task.get("title") for task in tasks
                 if task.get("completed") is True]
    print("Employee {} is done with tasks({}/{}):".format(
        user_info.get("name"), len(completed), len(tasks)))
    [print("\t {}".format(c)) for c in completed]
