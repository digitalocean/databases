## Examples

* [Go](./go-contacts)
* [Node](./node-contacts)
* [PHP / Laravel](./laravel-contacts)
* [Python](./python-contacts)

### Creating a database cluster

You may do so using DigitalOcean's Control Panel: https://cloud.digitalocean.com/databases/new

### Connecting to your database

These examples require a DigitalOcean Database instance. In the Control Panel, you are provided with your database's "Connection String", e.g:

```
postgresql://username:password@cluster-name.db.ondigitalocean.com:25060/defaultdb?sslmode=require
```

This URI contains all the necessary info for a PostgreSQL client to connect to your DigitalOcean Database. Here's what it contains:

Authority:

* `postgresql://` — Postgres protocol (scheme)
* `username` — username
* `password` — password
* `cluster-namea.db.ondigitalocean.com`— hostname to connect to
* `25060`— port to connect to

Path:

* `defaultdb`—the name of the database to connect to

Query:

* `?sslmode=require `— instructs most PG clients to only use a trusted TLS connection. A common convention, from JDBC. 

**Note:**
- It is considered best practice, and a well adopted standard, to store this connection string in an [environment variable](https://12factor.net/config) called `DATABASE_URL`.
- This URL contains *all* the information needed to access (and manipulate) your data. Keep it safe! Rotate it regularly.
- DigitalOcean Databases do not support non-TLS connections.

Use the control panel to create a database and a new user.

### The web app

The examples configure a web app that displays a list of fake contacts, queried from the database.

See instructions below on how to import the example dataset to your database.

<p align="center">
    <img src="screenshot.png" alt="screenshot of the web app in the examples" width="1010">
</p>

### The dataset

The dataset used in the examples is structured like so:

```sql
CREATE TABLE contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    favorites jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
```

#### Example dataset

##### Importing

The Go and Node examples require existing data in order to work, so you will need to import the example dataset. The Laravel example, however, automatically generates random contacts as part of its database migration flow so you will not need to do anything beyond creating a new database.

First, download the SQL export and save it somewhere accessible to you: [contacts.sql](./contacts.sql)

To import using the command line, prepare your [connection string](#database-credentials) and run the following command, replacing the connecting string with your own:

```
psql 'postgresql://user:password@db-postgresql-fra1-000-do-user-000-0.db.ondigitalocean.com:25060/database?sslmode=require' < contacts.sql
```

To import using a GUI client, connect to the database and import the `contacts.sql` file through the method the client offers you.

##### Example dataset

| id | name                    | phone          | address                                                    | favorites                                                               | created_at          | updated_at          |
|----|-------------------------|----------------|------------------------------------------------------------|-------------------------------------------------------------------------|---------------------|---------------------|
| 1  | Mrs. Hettie Bergstrom I | +5009890369775 | 52434 Arturo Trace Suite 414West Thea, NV 96425-7487       | `{"colors": ["Chartreuse", "PeachPuff", "DeepPink"]}`                     | 2018-11-12 19:40:41 | 2018-11-12 19:40:41 |
| 2  | Mrs. Catherine Emard II | +1002168309791 | 74477 Mohamed DivideMeredithchester, NC 26546-4810         | `{"colors": ["Tan", "DarkCyan", "ForestGreen"]}`                          | 2018-11-12 19:40:42 | 2018-11-12 19:40:42 |
| 3  | Lupe Gulgowski PhD      | +7434139825742 | 73361 Mante View Suite 646Lake Mireilleville, TN 64034     | `{"colors": ["LightCoral", "Aqua", "PaleVioletRed"]}`                     | 2018-11-12 19:40:42 | 2018-11-12 19:40:42 |
| 4  | Deon Klocko             | +4555245458004 | 80105 Torphy Fields Apt. 615Klockoshire, NV 51628-2316     | `{"colors": ["PaleGreen", "WhiteSmoke", "DarkGray"]}`                     | 2018-11-12 19:40:42 | 2018-11-12 19:40:42 |
| 5  | Dr. Harley Barrows III  | +9227847297432 | 977 Clifford Meadow Suite 799Christianabury, KS 94699-6827 | `{"colors": ["Teal", "Yellow", "Tomato"]}`                                | 2018-11-12 19:40:42 | 2018-11-12 19:40:42 |
| 6  | Dr. Reid Jones II       | +2415291490689 | 435 Lemke TrailMistyview, VT 57063-9013                    | `{"colors": ["Darkorange", "Blue", "Wheat"]}`                             | 2018-11-12 19:40:43 | 2018-11-12 19:40:43 |
| 7  | Daniela Rodriguez       | +8121358988599 | 84195 Ward Coves Apt. 636Matteoside, WI 81403-0803         | `{"colors": ["MediumTurquoise", "LightGoldenRodYellow", "AntiqueWhite"]}` | 2018-11-12 19:40:43 | 2018-11-12 19:40:43 |
| 8  | Dr. Rhea Bernhard       | +9376880669838 | 7423 Porter GatewayCroninbury, ME 53238                    | `{"colors": ["DarkSlateGray", "BlanchedAlmond", "DarkGreen"]}`            | 2018-11-12 19:40:44 | 2018-11-12 19:40:44 |
| 9  | Mr. Chance Wilkinson I  | +1860087624014 | 731 Alfonzo Pass Suite 199Lake Gabe, FL 26770              | `{"colors": ["Cornsilk", "SaddleBrown", "Blue"]}`                         | 2018-11-12 19:40:44 | 2018-11-12 19:40:44 |
| 10 | Janelle Hickle I        | +3726168597315 | 6595 Craig Keys Suite 695Moshefurt, OR 11056               | `{"colors": ["MistyRose", "MediumOrchid", "DarkCyan"]}`                   | 2018-11-12 19:40:44 | 2018-11-12 19:40:44 |
