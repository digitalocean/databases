## Databases in Go

This example uses [sqlx](https://github.com/jmoiron/sqlx) along with [pgx](https://github.com/jackc/pgx) to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. [Import the dataset](../README.md#the-dataset) if necessary
2. Install the dependencies: `go get -u -v ./...`
3. Build the app: `go build .`
4. Prepare your PostgreSQL connection string. See [the examples README](../README.md#database-credentials)
5. Start the app: `./go-contacts -conn "PostgreSQL Connection String"`
    * You can alternatively pass the connection string in an environment variable named `DATABASE_URL`