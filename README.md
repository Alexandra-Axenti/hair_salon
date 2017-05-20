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

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
