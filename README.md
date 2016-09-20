# Reading List

The Ruby on Rails backend that provides a JSON API for the Angular client to communicate with.

## Installation

1. `git clone git@github.com:jfmaggie/reading-list-ruby.git && cd reading-list-ruby`
2. Ensure that all dependencies are installed `bundle install`
3. Create the database and run the migrations `rails db:setup`
4. Run the application `rails s` (by default runs on port: 3000)

## Usage

This application expects and returns JSON and should be used through [reading-list-angular](https://github.com/jfmaggie/reading-list-angular).

## TODO

- [X] List/Item CRUD
- [X] Model validation for Lists
- [X] Create users table and user signup
- [ ] Authentication (user login and logout)
- [ ] Permissions
