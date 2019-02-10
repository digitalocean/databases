// databases connection

const { Client : pgClient } = require('pg')
// make sure to set the connection details in environment variables
const dbConfig = require('./database-credentials')

let db
try {
    db = new pgClient(dbConfig)
    db.connect()
} catch (e) {
    console.error("couldn't connect to the database", e)
    process.exit(1)
}

// express app

const path = require('path')
const express = require('express')
const app = express()

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// handle index route
app.get('/', async (req, res) => {
    try {
        const contacts = await fetchContacts()
        
        res.render('index', { contacts })
    } catch {
        res.status(500)
        res.send('internal server error')
    }
});

const fetchContacts = async () => {
    // query DB for contacts
    const res = await db.query('select * from contacts')

    return res.rows
}

const port = process.env.PORT || 3000
const host = process.env.HOST || '0.0.0.0'
app.listen(port, host, () => console.log(`server listening on ${host}:${port}`));