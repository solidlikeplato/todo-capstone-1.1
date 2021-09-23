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
Currently has a Welcome page located at `/` which displays a welcome message and a list of authors names. From this page you can create a new author. Each authors name links to that author's todo list

From the author's todo list pages you can update the author's name or delete the author. Deleting the author deletes all associated todo items. You can also navigate to individual to do items and create a new todo item and sort the list with undone todos at the top

From each item page you can click on the status (`done` or `not done`) and it will change to whichever it wasn't and update the displayed page. This page also allows updating of title or description and deletion of a todo item

## Deployment
This is currently deployed [here](https://todos-kansas-271828.herokuapp.com/)