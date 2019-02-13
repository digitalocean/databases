import os

import responder
from records import Database

DATABASE_URL = os.environ["DATABASE_URL"]

db = Database()
api = responder.API()


def migrate(db):
    db.query_file("../contacts.sql")


@api.route("/")
async def greet_world(req, resp):
    contacts = db.query("SELECT * FROM contacts")
    resp.text = api.template("index.html", contacts=contacts)


if __name__ == "__main__":
    migrate(db=db)
    api.run()
