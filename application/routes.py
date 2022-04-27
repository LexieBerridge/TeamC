import json
from flask import render_template, request, jsonify
import service
from application import dbscript
from application import app
from application.forms import new_user_form
from application.forms.new_user_form import SignUpForm
from application.models.user_table import UserTable
import templates


@app.route('/signup', methods =['GET', 'POST'])
def signup():
    error = ""
    form = SignUpForm()
    if request.method == 'POST':
        form = SignUpForm(request.form)
        print(form.user_name.data)
        user_name = form.user_name.data
        user_age = form.user_age.data
        user_password = form.user_password.data
        if len(user_name) == 0 or len(user_password) == 0 or user_age <= 15:
            error = "Please supply username and password. You must be over 16 to use this site"
        else:
            user = UserTable(user_name=user_name, user_age=user_age)
            service.add_new_user(user)
            return render_template('welcome_new_user.html', user_name=user_name, user_age=user_age)
    return render_template('signup.html', form=form, message=error)