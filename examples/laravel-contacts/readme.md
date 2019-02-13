## Databases with Laravel

This example uses Eloquent to connect to a DigitalOcean PostgreSQL database, with support for JSONB (see the `favorites` column in [the dataset](../README.md#the-dataset)).

1. Install the dependencies using composer: `composer install`
2. Plug in your connection credentials in the `.env` file or by using environment variables. Use `.env.example` for reference. To look up your DigitalOcean Database connection details, see [the examples README](../README.md#database-credentials).
3. Migrate and seed the database: `php artisan migrate --seed`
4. Start the server: `php artisan serve`
5. View the app at http://localhost:8080

### Files to look at

* [app/Contact.php](./app/Contact.php)
* [routes/web.php](./routes/web.php)
* [resources/views/welcome.blade.php](./resources/views/welcome.blade.php)
* [.env.example](./.env.example)
* [database/migrations/2018_11_11_200428_create_contacts_table.php](./database/migrations/2018_11_11_200428_create_contacts_table.php)
* [database/factories/ContactFactory.php](./database/factories/ContactFactory.php)
* [database/seeds/ContactsTableSeeder.php](./database/seeds/ContactsTableSeeder.php)