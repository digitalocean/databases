## Databases in Go

This example uses [sqlx](https://github.com/jmoiron/sqlx) along with [pgx](https://github.com/jackc/pgx) to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. Install the dependencies: `go get -u -v ./...`
2. Build the app: `go build .`
3. Prepare your PostgreSQL connection string. See [the examples README](../README.md#databases-credentials)
4. Start the app: `./go-contacts -conn "PostgreSQL Connection String"`