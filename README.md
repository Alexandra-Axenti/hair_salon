# hair_salon

A web app to manage a hair salon's stylists and clients. The application covers the following user stories:

* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.


## Prerequisites

* Ruby
* Postgres

## Instructions for the App Setup on your local machine

* Open your terminal and navigate to the folder where you want to copy the project, then type:
* `cd clone https://github.com/Alexandra-Axenti/hair_salon.git`
* `cd hair_salon`
* `bundle install`
* setup the database (see below instructions)
* `ruby app.rb`


## Instructions for DataBase Setup:

* Install postgres
* Open your terminal and run the following commands:
- `psql`
- `CREATE DATABASE hair_salon;`
- `\c hair_salon`
- `CREATE TABLE stylists (id  serial PRIMARY KEY, name VARCHAR);`
- `CREATE TABLE clients (id  serial PRIMARY KEY, name VARCHAR, stylist_id INTEGER);`
- `ALTER TABLE clients ADD FOREIGN KEY (stylist_id) REFERENCES stylists (id);`
- `CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;`


## Unit and integration testing (BDD)

* In your terminal navigate to the project folder and then run: `rspec`


## Author

Alexandra Axenti


## License

Free under MIT License
