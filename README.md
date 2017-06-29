# Booklist

A CRUD web-app to save lists of books to read, locations and ratings made with Ruby on Rails.

## Dependencies

* Ruby 2.2.*
* Rails 4.2.*
* [QRCode.js](https://github.com/davidshimjs/qrcodejs)
* NPM and gulp to compile JavaScript files
* PostgreSQL
* Ruby `pg` gem to connect with PostgreSQL

## Getting Started

* Download or clone the project and `cd` into the project directory
* `cd` into downloaded project directory
* Type `npm install` to install dependencies
* If you do not have Gulp installed type `npm install gulp -g` or `sudo npm install gulp -g` to install Gulp
* Type `gulp build` to compile raw js files
* If you do not have the pg gem installed, type `gem install pg` to install it
* Set up your PostgreSQL database, and enter the info in the `./config/database.yml` file
* Type `bin/rake db:migrate` to migrate the database
* Type `bin/rails server` to start the server
* Once the server has started up, navigate your web-browser of choice to `http://localhost:3000` to view the site

## License

Booklist is released under the MIT License. See license.txt for more details.
