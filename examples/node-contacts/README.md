## Databases in Node

This example uses [pg](https://node-postgres.com) to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. Copy `database-credentials.example.js` to `database-credentials.js` and plug in your credentials
2. Start the server: `node index.js`
3. View the app at http://localhost:3000