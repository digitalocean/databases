## Databases in Node

This example uses [pg](https://node-postgres.com) to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. Pass your database credentials in environment variables. To look up your DigitalOcean Database connection details, see [the examples README](../README.md#database-credentials).
    * `DB_HOST`—Server hostname
    * `DB_PORT`—Server port
    * `DB_USER`—Username
    * `DB_PASSWORD`—Password
    * `DB_DATABASE`—Database
    * `DB_SSL`—Use SSL? true/false
2. [Import the dataset](../README.md#the-dataset) if necessary
3. Start the server: `node index.js`
4. View the app at http://localhost:3000