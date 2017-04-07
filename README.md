# hair_salon

A web app to manage a hair salon's stylists and clients.

# User Stories

* As a salon owner, I want to view, add, update and delete stylists and clients.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

# Instructions for DataBase Setup:

* Install postgres
* Open your terminal and run the following commands:

CREATE DATABASE hair_salon;

CREATE TABLE stylists (id  serial PRIMARY KEY, name VARCHAR);

CREATE TABLE clients (id  serial PRIMARY KEY, name VARCHAR, stylist_id INTEGER);

ALTER TABLE clients ADD FOREIGN KEY (stylist_id) REFERENCES stylists (id);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
