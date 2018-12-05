## Databases in Node

This example uses [pg](https://node-postgres.com) to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. Copy `database-credentials.example.js` to `database-credentials.js` and plug in your credentials. To look up your DigitalOcean Database connection details, see [the examples README](../README.md#database-credentials).
2. [Import the dataset](../README.md#the-dataset) if necessary
3. Start the server: `node index.js`
4. View the app at http://localhost:3000