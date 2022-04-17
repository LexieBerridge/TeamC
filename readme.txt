FILES AND FOLDER LAYOUT FOR USING FLASK AND SQLALCHEMY

FYI: DO NOT put anything into the venv folder. In the Scripts folder there is a .gitignore file - works like requirements
just type the files and folders you do not want to be pushed to git. Eg no need to push venv, pychach and .idea onto git.

FILES IN MAIN SECTION:
requirements.txt - all the libraries, frameworks etc you need to install for the app to work (also need to pip install
 via the terminal). Recommend you pip install cryptography as well or it might just ask you to do this when it doesn't
 work on day

app.py - for your app to exist (run this file so you can use your URLs from routes.py in your browser)
pretty sure if __name__ == '__main__': app.run(debug=True) is what allows you to run your code in developer mode to
test your URLS



APPLICATION FOLDER (SUBFOLDERS):
forms -

models - python classes that allow you to create tables in SQL and use them as objects in Python using SQLalchemy.orm
remember to add an empty __init__.py

static - CSS, should include images folder

templates - html, use Jinga2 templates

APPLICATION FOLDER (FILES):
__init__.py - this webpage explains this file: https://flask-sqlalchemy.palletsprojects.com/en/2.x/quickstart/#quickstart
in short it is boilerplate code essential for using sqlalchemy with flask and configuring the flask app. Allows you to
assign SQLalchemy to db then 'from application import db' so you can use it for functions like db.model. Same with app.

dbscript.py -

routes.py - make urls and assign them to GET, POST and other HTTP requests via functions (within which you can use more
functions from service.py)

service.py - acts as a module, list all the functions you want using the models you made and import these functions to
routes.py functions

KEYWORDS
JSON -JavaScript Object Notation - for sending data from the server to the client, so it can be displayed on a web page,
or vice versa. Use jsonify to make something json but you might not need to with newer version of flask all python
dictionaries that are returned from a function in the routes file automatically become json.
RENDER_TEMPLATE - Flask function that allows us to use html files saved in the templates folder that contain
html templates using Jinja2 engine
QUERY - Python function that equates to using SELECT in SQL
MODEL - allows you to make a class for your SQL
JINGA2 - HTML templates that work with Flask and allow you to use Python functions in html e.g for loops
ORM - object relationship mapping - using db.model to make classes so that you can use objects as SQL tables
(translates Python classes to tables on relational databases and automatically converts function calls to SQL statements)

