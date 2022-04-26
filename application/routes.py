import json

from flask import render_template, request, jsonify

import service
from application import app


@app.route("/home")
@app.route("/")
def home():
    return render_template("home.html")

@app.route("/recipes")
def recipes():
    return render_template("recipes.html")