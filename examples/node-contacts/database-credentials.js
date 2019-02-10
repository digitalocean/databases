const connStr = {
    connectionString: process.env.DATABASE_URL
}

const split = {
    host: process.env.DB_HOST || 'db-postgresql-.db.ondigitalocean.com',
    port: process.env.DB_PORT || 25060,
    user: process.env.DB_USER || 'contactsapp',
    password: process.env.DB_PASSWORD || 'password',
    database: process.env.DB_DATABASE || 'contacts',
    ssl: process.env.DB_SSL == 'true' || true,
}

// prefer connStr over split
module.exports = connStr.connectionString ? connStr : split