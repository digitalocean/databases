import os

from records import Database

DATABASE_URL = os.environ["DATABASE_URL"]

db = Database()
