# TheToDoList

## Technologies Used
* Ruby on Rails
* PostgreSQL
* Rspec
* Heroku (for deployment)

## Installation

#### Local installation:
1. Clone the repository onto your local machine
2. run ```bundle install``` to install all dependencies
3. run ```rake db:setup```
4. run ```rails s```
5. the server will be running on ```localhost:3000```
#### Running tests locally:

## Description:
Currently has a Welcome page located at `/`
There is a single item at `/todo_items/1`
From the item page you can click on the status (`done` or `not done`) and it will change to whichever it wasn't and update the displayed page

## Deployment
This is currently deployed [here](https://todos-kansas-271828.herokuapp.com/)