package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"html/template"
	"net/http"
	"strings"

	_ "github.com/jackc/pgx/stdlib"
	"github.com/jmoiron/sqlx"
	"github.com/jmoiron/sqlx/types"
	"github.com/pkg/errors"
)

type ContactFavorites struct {
	Colors []string `json:"colors"`
}

type Contact struct {
	ID                   int
	Name, Address, Phone string

	FavoritesJSON types.JSONText    `db:"favorites"`
	Favorites     *ContactFavorites `db:"-"`

	CreatedAt string `db:"created_at"`
	UpdatedAt string `db:"updated_at"`
}

var (
	connectionString = flag.String("conn", "", "PostgreSQL connection string")
	listenAddr       = flag.String("addr", ":8080", "HTTP address to listen on")
	db               *sqlx.DB
	tmpl             = template.New("")
)

func main() {
	flag.Parse()
	var err error

	// templating

	tmpl.Funcs(template.FuncMap{"StringsJoin": strings.Join})
	_, err = tmpl.ParseGlob("./templates/*.html")
	if err != nil {
		fmt.Printf("Unable to parse templates: %v\n", err)
		return
	}

	// postgres connection

	if *connectionString == "" {
		fmt.Println("Please pass the connection string using the -conn option")
		return
	}

	db, err = sqlx.Connect("pgx", *connectionString)
	if err != nil {
		fmt.Printf("Unable to establish connection: %v\n", err)
		return
	}

	// http server

	http.HandleFunc("/", handler)

	fmt.Printf("listening on %s\n", *listenAddr)
	http.ListenAndServe(*listenAddr, nil)
}

func fetchContacts() ([]*Contact, error) {
	contacts := []*Contact{}
	err := db.Select(&contacts, "select * from contacts")
	if err != nil {
		return nil, errors.Wrap(err, "Unable to fetch contacts")
	}

	for _, contact := range contacts {
		err := json.Unmarshal(contact.FavoritesJSON, &contact.Favorites)

		if err != nil {
			return nil, errors.Wrap(err, "Unable to parse JSON favorites")
		}
	}

	return contacts, nil
}

func handler(w http.ResponseWriter, r *http.Request) {
	contacts, err := fetchContacts()
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte(err.Error()))
		return
	}

	tmpl.ExecuteTemplate(w, "index.html", struct{ Contacts []*Contact }{contacts})
}
