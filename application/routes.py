import json
from flask import render_template, request, jsonify
import service
from application import dbscript
from application import app
from application.forms import new_user_form
from application.forms.new_user_form import SignUpForm
from application.models.user_table import UserTable
import application.templates

# SIGNUP PAGE: uses a a python class SignUpForm made in new_user_form (in the forms folder) which is presented
# to the user via Signup.html (templates) and when filled out correctly shows the page welcome_new_user.html (templates)
@app.route('/signup', methods =['GET', 'POST'])
def signup():
    error = ""
    form = SignUpForm()
    if request.method == 'POST':
        form = SignUpForm(request.form)
        print(form.username.data)
        username = form.username.data
        user_name = form.user_name.data
        # user_age = form.user_age.data
        password = form.password.data
        if len(username) == 0 or len(password) == 0 or len(user_name) == 0:
            error = "Please supply username, password and the name you like to go by"
        else:
            user = UserTable(username=username, user_name=user_name, password=password)
            service.add_new_user(user)
            return render_template('welcome_new_user.html', user_name=user_name)
            # return redirect ( url_for('user'), user=user)
    return render_template('signup.html', form=form, message=error)

@app.route("/home")
@app.route("/")
def home():
    return render_template("home.html")

@app.route("/recipes")
def recipes():
    return render_template("recipes.html")

@app.route('/user_name')
def user_name():
    return render_template('welcome_new_user.html', user_name=user_name)